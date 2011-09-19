<?php

//Funcionario
class Estabelecimento_FuncionarioController extends Zend_Controller_Action
{

    public $TbCidade;
    public $TipoProduto;
    public $Funcionario;
    public $TiposProdutosEmpresa;
    public $HorarioFuncionamento;
    public $errorMessage;
    public $caminho;

    public function init()
    {
        $this->_helper->layout()->setLayout('tela_cadastro_layout');
        $this->Funcionario = new DbTable_Funcionario();
        $this->Empresa = new DbTable_Empresa();
        $this->FuncionarioHasEmpresa = new DbTable_FuncionarioHasEmpresa();
        $this->FuncionarioEntregador = new DbTable_FuncionarioEntregador();
        $this->view->pageTitle = 'Funcionario';
        $this->caminho = $this->getRequest()->getModuleName() . "/" . $this->getRequest()->getControllerName();
    }

    public function indexAction()
    {
        $this->view->funcionarioId = '';
        $empresaOption = $this->Empresa->getEmpresaOptionDropDown();
        $this->view->empresaOption = $empresaOption;
    }

    public function addAction()
    {
        $formData = $this->getRequest()->getPost();

        if ($formData['emorFrom'] == 1)
        {

            if ($formData['action'] == 'edit')
            {
                $id = $formData['funcionarioId'];
                try
                {
                    $this->Funcionario->editFuncionario($formData, $id);
                } catch (Exception $e)
                {

                    if ($e->getCode() == 23505) //Unique violation
                    {
                        $this->view->headline = "Este CPF já está cadastrado. Por favor escolha outro.";
                        $this->_setParam("id", $id);
                        $this->_forward("edit");
                        return;
                    }
                }
                $this->FuncionarioHasEmpresa->updateRecord($id, $formData['cod_empresa']);
                $this->view->action = 'edit';
                $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$id");
            } else
            {
                try
                {
                    $id = $this->Funcionario->addFuncionario($formData);
                } catch (Exception $e)
                {

                    if ($e->getCode() == 23505) //Unique violation
                    {
                        $this->view->headline = "Este CPF já está cadastrado. Por favor escolha outro.";
                        // $this->_setParam("id", $id);
                        //           $this->getRequest()->setPost($this->getRequest()->getPost());
                        $this->_forward("error");
                        return;
                    }
                }
                $this->FuncionarioHasEmpresa->insertRecord($id, $formData['cod_empresa']);
                $this->view->funcionarioId = $id;
                $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$id");
            }
        }
        if ($formData['emorFrom'] == 2)
        {
            $funcionarioId = $formData['funcionarioId'];
            if (!empty($funcionarioId))
            {
                if ($formData['action'] == 'edit')
                {
                    $funcionarioId = $formData['funcionarioId'];
                    $this->FuncionarioEntregador->editRecord($formData, $funcionarioId);
                    $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$funcionarioId");
                } else
                {
                    $id = $this->FuncionarioEntregador->addRecord($formData, $funcionarioId);
                    $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$id");
                }
            } else
            {
                $this->view->headline = "Por favor, preencha o formulário.";
                $this->_forward("index");
            }
        }
    }

    public function errorAction()
    {
        $formData = $this->getRequest()->getPost();
        $empresaOption = $this->Empresa->getEmpresaOptionDropDown();
        $this->view->cod_empresa = $formData["cod_empresa"];
        $this->view->empresaOption = $this->Empresa->getEmpresaOptionDropDown();
        $this->view->formData = $formData;
        $this->_helper->viewRenderer('index');
    }

    public function editAction()
    {
        $funcionarioId = $this->_getParam('id', '');
        if (empty($funcionarioId))
        {
            $this->view->headline = "Problema inesperado. Contacte o administrator do sistema!";
            $this->_forward("error");
            return;
        }
        $formData = $this->Funcionario->getSingleData($funcionarioId);
        $cod_empresa = $this->FuncionarioHasEmpresa->getRecord($funcionarioId);
        $cod_empresa = $cod_empresa['cod_empresa'];
        if (!empty($formData['data_nascimento']))
        {
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

        $this->view->action = 'edit';
        $this->view->title = 'Funcionario';
        $this->view->funcionarioId = $funcionarioId;
        $this->_helper->viewRenderer('index');
    }

    public function deleteAction()
    {
        $funcionarioId = $this->_getParam('id', '');
        //Exclui o funcionario e todas as suas entregas
        // if (!$this->Funcionario->checkEntregaRelation($funcionarioId))
        {

            $this->FuncionarioHasEmpresa->deleteRecords($funcionarioId);
            $this->FuncionarioEntregador->deleteRecords($funcionarioId);
            $this->Funcionario->deleteRecords($funcionarioId);
            $this->_helper->redirector->gotoUrl($this->caminho . "/gridView");
        }
        /* else
          {

          $this->getRequest()->setParam("id", $funcionarioId);
          $this->getRequest()->setParam("msg", "Este funcionário não pode ser removido pois existem entregas associadas a ele.");
          $this->_forward("edit");

          } */
    }

    public function gridviewAction()
    {
        $record = $this->Funcionario->getRecords();
        $page = $this->_getParam('page', 1);
        $paginator = Zend_Paginator::factory($record);
        $paginator->setItemCountPerPage(2);
        $paginator->setCurrentPageNumber($page);
        $this->view->paginator = $paginator;
    }

    public function deleteFuncionarioEntregadorAction()
    {
        $funcionarioId = $this->_getParam('id', '');
        $this->FuncionarioEntregador->deleteRecords($funcionarioId);
        $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$funcionarioId");
    }

    public function checkCpfAction()
    {
        $cpf = $this->_getParam('cpf', '');
        $id = $this->_getParam('id', '');
        $status = $this->Funcionario->checkDuplicateCPF($cpf, $id);
        echo $status;
        exit;
    }

}

?>
