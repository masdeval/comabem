<?php

class Estabelecimento_FuncionarioController extends Zend_Controller_Action
{

    public $TbCidade;
    public $TipoProduto;
    public $Funcionario;
    public $TiposProdutosEmpresa;
    public $HorarioFuncionamento;
    public $errorMessage;
    public $caminho;
    public $empresaId; //empresa que o usuario logado que instanciou esta classe pertence
    public $session;
    public $db;

    public function init()
    {
        $this->_helper->layout()->setLayout('tela_cadastro_layout');
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->Funcionario = new DbTable_Funcionario($this->db);
        $this->Empresa = new DbTable_Empresa($this->db);
        $this->FuncionarioHasEmpresa = new DbTable_FuncionarioHasEmpresa($this->db);
        $this->FuncionarioEntregador = new DbTable_FuncionarioEntregador($this->db);
        $this->view->pageTitle = 'Funcionario';
        $this->session = new Zend_Session_Namespace('default');
        if (isset($this->session->user))
        {
            $this->empresaId = $this->session->user->empresa;
        }
        $this->view->cod_empresa = $this->empresaId;
        $this->caminho = $this->getRequest()->getModuleName() . "/" . $this->getRequest()->getControllerName();
        $this->view->empresaOption = $this->Empresa->getEmpresaOptionDropDown();

        //Esses metodos nao funcionaram muito bem
        //$this->getRequest()->setParamSources(array('_POST'));//garante que o metodo getParam somente lerá dados setados por setParam e submetidos via Post
        //$this->getRequest()->clearParams("funcionarioId");
    }

    public function indexAction()
    {
        $this->view->funcionarioId = '';
    }

    public function addAction()
    {
        $formData = $this->getRequest()->getPost();

        if ($formData['emorFrom'] == 1)
        {

            if (!empty($formData['funcionarioId'])) //edicao
            {
                $id = $formData['funcionarioId'];

                try
                {
                    $this->db->beginTransaction();
                    $this->Funcionario->editFuncionario($formData, $id);
                    $this->FuncionarioHasEmpresa->updateRecord($id, $this->empresaId);
                    $this->db->commit();
                } catch (Exception $e)
                {
                    $this->db->rollback();
                    if ($e->getCode() == 23505) //Unique violation
                    {

                        $this->view->headline = "Este CPF já está cadastrado. Por favor escolha outro.";
                        //$this->_setParam("id", $id);
                        $this->editAction($id);
                        return;
                    } else
                    {
                        $this->view->headline = $e->getMessage();
                        $this->_forward("error");
                        return;
                    }
                }
            } else //novo registro
            {
                try
                {
                    $this->db->beginTransaction();
                    $id = $this->Funcionario->addFuncionario($formData);
                    $this->FuncionarioHasEmpresa->insertRecord($id, $this->empresaId);
                    $this->db->commit();
                } catch (Exception $e)
                {
                    $this->db->rollback();
                    if ($e->getCode() == 23505) //Unique violation
                    {
                        $this->view->headline = "Este CPF já está cadastrado. Por favor escolha outro.";
                        $this->_forward("error");
                        return;
                    }

                    $this->view->headline = "Erro ao inserir o registro! " . $e->getMessage();
                    $this->_forward("error");
                    return;
                }
            }
            $this->view->funcionarioId = $id;
            //$this->_setParam("id", $id);
            //$this->_forward("edit");
            $this->editAction($id);
        }
        if ($formData['emorFrom'] == 2) //dados de entregador
        {
            $funcionarioId = $formData['funcionarioId'];
            if (!empty($funcionarioId))
            {
                try
                {
                    $this->db->beginTransaction();
                    $funcionarioId = $formData['funcionarioId'];
                    $this->FuncionarioEntregador->editRecord($formData, $funcionarioId);
                    $this->db->commit();
                    //$this->_setParam("id", $funcionarioId);
                    $this->editAction($funcionarioId);
                } catch (Exception $e)
                {
                    $this->db->rollBack();
                    $this->view->headline = "Problema ao inserir registro. " . $e->getMessage();
                    $this->_forward("error");
                    return;
                }
            } else //esse eh o caso de escolher a aba de entregador sem ter escolhido antes um funcionario na aba principal
            {
                $this->view->headline = "Por favor, selecione um funcionário primeiro.";
                $this->_forward("index");
            }
        }
    }

    public function errorAction()
    {
        $this->view->cod_empresa = $this->empresaId;
        $this->view->empresaOption = $this->Empresa->getEmpresaOptionDropDown();
        $this->view->formData = $this->getRequest()->getPost();
        $this->_helper->viewRenderer('index');
    }

    public function editAction($funcionarioId = '')
    {
        if (empty($funcionarioId))
            $funcionarioId = $this->getRequest()->getPost("funcionarioId"); //quando vem do Grid

            if (empty($funcionarioId))
        {
            $this->view->headline = "Id do funcionário é nula. Contacte o administrator do sistema!";
            $this->_forward("error");
            return;
        }
        $formData = $this->Funcionario->getSingleData($funcionarioId);
        $cod_empresa = $this->FuncionarioHasEmpresa->getRecord($funcionarioId);
        if (!empty($formData['data_nascimento']))
        {
            list($year, $month, $day) = explode('-', $formData['data_nascimento']);
            $data_nascimento = "$day/$month/$year";
            $formData['data_nascimento'] = $data_nascimento;
        }
        $formData2 = $this->FuncionarioEntregador->getRecords($funcionarioId);
        $this->view->cod_empresa = $this->empresaId;
        $this->view->empresaOption = $this->Empresa->getEmpresaOptionDropDown();
        $this->view->formData = $formData;
        $this->view->formData2 = $formData2;

        //$this->view->action = 'edit';
        $this->view->title = 'Funcionario';
        $this->view->funcionarioId = $funcionarioId;
        $this->_helper->viewRenderer('index');
    }

    public function deleteAction()
    {
        $funcionarioId = $this->getRequest()->getPost("funcionarioId");
        try
        {

            $this->db->beginTransaction();
            /*
             * Nao remove tudo relacionado a funcionario. Apenas marca uma flag dizendo que na tabela master
             * FUNCIONARIO o registro foi removido
              //$this->FuncionarioHasEmpresa->deleteRecords($funcionarioId);
              //$this->FuncionarioEntregador->deleteRecords($funcionarioId);

             */
            $this->Funcionario->deleteRecords($funcionarioId);
            $this->db->commit();
        } catch (Exception $e)
        {
            $this->db->rollback();
            $this->view->headline = "Erro ao remover o registro! " . $e->getMessage();
            $this->_forward("error");
            return;
        }
        $this->_forward("gridView");
    }

    public function gridviewAction()
    {
        $record = $this->Funcionario->getRecords($this->empresaId); //empresa do usuario que esta logado
        $page = $this->_getParam('page', 1);
        $paginator = Zend_Paginator::factory($record);
        $paginator->setItemCountPerPage(20);
        $paginator->setCurrentPageNumber($page);
        $this->view->paginator = $paginator;
    }

    public function deleteFuncionarioEntregadorAction()
    {
        $funcionarioId = $this->getRequest()->getPost("funcionarioId");
        $this->FuncionarioEntregador->deleteRecords($funcionarioId);
        $this->editAction($funcionarioId);
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
