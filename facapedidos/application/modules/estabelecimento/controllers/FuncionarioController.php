<?php

//Funcionario
class Estabelecimento_FuncionarioController extends Zend_Controller_Action {

    public $TbCidade;
    public $TipoProduto;
    public $Funcionario;
    public $TiposProdutosEmpresa;
    public $HorarioFuncionamento;
    public $errorMessage;
    public $caminho;

    public function init() {
        $this->_helper->layout()->setLayout('tela_cadastro_layout');
        $this->Funcionario = new DbTable_Funcionario();
        $this->Empresa = new DbTable_Empresa();
        $this->FuncionarioHasEmpresa = new DbTable_FuncionarioHasEmpresa();
        $this->FuncionarioEntregador = new DbTable_FuncionarioEntregador();
        $this->view->pageTitle = 'Funcionario';
        $this->caminho = $this->getRequest()->getModuleName() . "/" . $this->getRequest()->getControllerName();
    }

    public function indexAction() {
        $msg = $this->_getParam('msg', '');
        $m[1] = 'Please complete the form below first';
        if (!empty($msg)) {
            $message = $m[$msg];
        } else {
            $message = 'Welcome!';
        }
        $this->view->funcionarioId = '';
        $empresaOption = $this->Empresa->getEmpresaOptionDropDown();
        $this->view->empresaOption = $empresaOption;
        $this->view->headline = $message;
    }

    public function addAction() {
        $error = false;
        $formData = $this->getRequest()->getPost();

        if ($formData['emorFrom'] == 1) {
            if ($formData['nome']) {

                if ($formData['action'] == 'edit') {
                    $id = $formData['funcionarioId'];
                    $this->Funcionario->editFuncionario($formData, $id);
                    $this->FuncionarioHasEmpresa->updateRecord($id, $formData['cod_empresa']);
                    $this->view->action = 'edit';
                    $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$id");
                } else {
                    $id = $this->Funcionario->addFuncionario($formData);
                    $this->FuncionarioHasEmpresa->insertRecord($id, $formData['cod_empresa']);
                    $this->view->funcionarioId = $id;
                    $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$id");
                }
            } else {
                $this->_helper->redirector->gotoUrl('funcionario/index/msg/1');
            }
        }
        if ($formData['emorFrom'] == 2) {
            $funcionarioId = $formData['funcionarioId'];
            if (!empty($funcionarioId)) {
                if ($formData['action'] == 'edit') {
                    $funcionarioId = $formData['funcionarioId'];
                    $this->FuncionarioEntregador->editRecord($formData, $funcionarioId);
                    $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$funcionarioId");
                } else {
                    $id = $this->FuncionarioEntregador->addRecord($formData, $funcionarioId);
                    $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$id");
                }
            } else {
                $this->_helper->redirector->gotoUrl('funcionario/index/msg/1');
            }
        }
    }

    public function editAction() {
        $id = $this->_getParam('id', '');
        if (!empty($id)) {
            $this->view->funcionarioId = $id;
        }
        $msg = $this->_getParam('msg', '');
        $m[2] = "Record could not be deleted as there is foreign key in table entrega";
        if (!empty($msg)) {
            $message = $m[$msg];
        } else {
            $message = 'Welcome!';
        }
        $funcionarioId = $id;
        if (!empty($funcionarioId)) {
            $formData = $this->Funcionario->getSingleData($funcionarioId);
            $cod_empresa = $this->FuncionarioHasEmpresa->getRecord($id);
            $cod_empresa = $cod_empresa['cod_empresa'];
            if (!empty($formData['data_nascimento'])) {
                list($year, $month, $day) = explode('-', $formData['data_nascimento']);
                $data_nascimento = "$day/$month/$year";
                $formData['data_nascimento'] = $data_nascimento;
            }
            $formData2 = $this->FuncionarioEntregador->getRecords($funcionarioId);
            $empresaOption = $this->Empresa->getEmpresaOptionDropDown();
            $this->view->cod_empresa = $cod_empresa;
            $this->view->empresaOption = $empresaOption;
            $this->view->formData = $formData;
            $this->view->formData2 = $formData2;
        }
        $this->view->headline = $message;
        $this->view->action = 'edit';
        $this->view->funcionarioId = $funcionarioId;
        $this->view->title = 'Funcionario';
        $this->_helper->viewRenderer('index');
    }

    public function deleteAction() {
        $funcionarioId = $this->_getParam('id', '');
        if (!$this->Funcionario->checkEntregaRelation($funcionarioId)) {

            $this->FuncionarioHasEmpresa->deleteRecords($funcionarioId);
            $this->FuncionarioEntregador->deleteRecords($funcionarioId);
            $this->Funcionario->deleteRecords($funcionarioId);
            $this->_helper->redirector->gotoUrl($this->caminho . "/gridView");
        } else {
            $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$funcionarioId/msg/2");
        }
    }

    public function gridviewAction() {
        $record = $this->Funcionario->getRecords();
        $page = $this->_getParam('page', 1);
        $paginator = Zend_Paginator::factory($record);
        $paginator->setItemCountPerPage(2);
        $paginator->setCurrentPageNumber($page);
        $this->view->paginator = $paginator;
    }

    public function deleteFuncionarioEntregadorAction() {
        $funcionarioId = $this->_getParam('id', '');
        $this->FuncionarioEntregador->deleteRecords($funcionarioId);
        $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$funcionarioId");
    }

}

?>
