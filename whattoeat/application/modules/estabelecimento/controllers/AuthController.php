<?php

class Estabelecimento_AuthController extends Zend_Controller_Action {

    public $errorMessage;
    public $db;
    public $FuncionarioDB;
    public $PrivilegeDB;

    public function init() {

        $this->_helper->layout()->setLayout('header');
        $this->db = Zend_Db_Table::getDefaultAdapter();
        //$this->_helper->layout()->disableLayout();                
        $this->FuncionarioDB = new DbTable_Funcionario($this->db);
        $this->PrivilegeDB = new DbTable_UserPrivileges($this->db);
    }

    public function indexAction() { 
        $msg = $this->_getParam('msg', '');
        $this->view->headline = $msg;
    }

    public function loginAction($formData = '') {
        //$form = new Form_login();
        $success = false;
        
        if (empty($formData)) {

            $formData = $this->_request->getPost();
        }
        // if ($form->isValid($formData)) {
        $authAdapter = $this->getAuthAdapter($formData);
        $result = $authAdapter->authenticate();

        if ($result->isValid()) {
            $auth = Zend_Auth::getInstance();
            $auth->setStorage(new Zend_Auth_Storage_Session('estabelecimento'));
            $dataAuth = $authAdapter->getResultRowObject(array('cod_funcionario', 'nome'));
            $auth->getStorage()->write($dataAuth);
            $this->criaUsuarioNaSessao($auth);                        
            $this->_redirect("estabelecimento/index");
        } else {
            $this->view->headline = "Usuário ou senha inválidos.";
            $this->_helper->viewRenderer('index'); 
        }
        //  } else {
        //    $this->view->mensagem = "Informações inválidas";
        // }
        // $this->view->form = $form;
    }

    public function logoutAction() {

        
        $this->_helper->viewRenderer('index');
        $session = new Zend_Session_Namespace('estabelecimento');

	if (isset($session))
	{
	    unset($session->user);

	}        
        
       /* $auth = Zend_Auth::getInstance();
        $auth->setStorage(new Zend_Auth_Storage_Session('estabelecimento'));
        $auth->clearIdentity();
        $session = new Zend_Session_Namespace('estabelecimento');
        if (isset($session->user)) {
            $session->__unset("user"); //nao esta funcionando ????
            Zend_Session::destroy(); //nao esta funcionando ????
        }*/
        
    }

    private function getAuthAdapter($formData) {
        
        $bootstrap = $this->getInvokeArg("bootstrap");
        $resource = $bootstrap->getPluginResource("db");

        $db = $resource->getDbAdapter();

        $authAdapter = new Zend_Auth_Adapter_DbTable($db);
        $authAdapter->setTableName("funcionario")
                ->setIdentityColumn("cpf")
                ->setCredentialColumn("senha");
        //->setCredentialTreatment('role <> "" and role <> "user"');

        $authAdapter->setIdentity($formData['cpf'])
                ->setCredential($formData['senha']);

        return $authAdapter;
    }

    private function criaUsuarioNaSessao($auth) {

        $user = new User();
        $user->id = $auth->getIdentity()->cod_funcionario;
        $user->name = $auth->getIdentity()->nome;
        $user->resources = $this->PrivilegeDB->getResourcesFromUser($user->id);
        $user->empresa = $this->FuncionarioDB->getEmpresa($user->id);
        $user->role = $this->PrivilegeDB->getUserRole($user->id);
        $session = new Zend_Session_Namespace('estabelecimento');
        //$session->resetSingleInstance('estabelecimento');
        //$session->__unset('estabelecimento');
        $session->user = $user;
    }

    public function criarContaAction() {
        $formData = $this->getRequest()->getPost("responsavel");

        if (!$formData['aceite']) {
            $this->view->headline = "Você deve aceitar os termos e condições do site antes de prosseguir.";
            $this->_helper->viewRenderer('index');
            return;
        }

        try {
            unset($formData['senha_repetida']);
            unset($formData['aceite']);
            $formData['data_cadastro'] = date("Y-m-d H:i:s");

            $this->db->beginTransaction();
            $id = $this->FuncionarioDB->addFuncionario($formData);
            $this->PrivilegeDB->addUserPrivilege(1, $id); //insere role de administrador
            $this->db->commit();
        } catch (Exception $e) {
            $this->db->rollback();
            if ($e->getCode() == 23505) { //Unique violation
                $this->view->headline = "Esse CPF já foi cadastrado. Favor escolher outro.";
                $this->_helper->viewRenderer('index');
                return;
            } else {
                $this->view->headline = "Problema ao cadastrar sua conta. " . $e->getMessage();
                $this->_helper->viewRenderer('index');
                return;
            }
        }
        //insere responsavel na sessao
        $this->loginAction($formData);
        
    }

}
