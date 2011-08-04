<?php

class Estabelecimento_AuthController extends Zend_Controller_Action {

    public $errorMessage;

    public function init() {
        $this->_helper->layout()->disableLayout();
    }

    public function indexAction() {
        $msg = $this->_getParam('msg', '');
        $this->view->headline = $msg;

        $this->_forward('login');
    }

    public function loginAction() {
        $form = new Forms_EstabelecimentoLogin();
        $success = false;

        if ($this->_request->isPost()) {

            $formData = $this->_request->getPost();

            if ($form->isValid($formData)) {
                $authAdapter = $this->getAuthAdapter($formData);
                $result = $authAdapter->authenticate();

                if ($result->isValid()) {
                    $auth = Zend_Auth::getInstance();
                    $auth->setStorage(new Zend_Auth_Storage_Session('default'));
                    $dataAuth = $authAdapter->getResultRowObject(array('cod_funcionario', 'nome'));
                    $auth->getStorage()->write($dataAuth);
                    $this->criaUsuarioNaSessao($auth);
                    $this->_redirect("estabelecimento/index");
                } else {
                    $this->view->mensagem = "Usuário ou senha inválidos.";
                }
            } else {
                $this->view->mensagem = "Informações inválidas";
            }
        }

        $this->view->form = $form;
    }

    public function logoutAction() {

        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        $auth = Zend_Auth::getInstance();
        $auth->setStorage(new Zend_Auth_Storage_Session('default'));
        $auth->clearIdentity();
        $session = new Zend_Session_Namespace('default');
        if (isset($session->user)){
            $session->__unset("user");//nao esta funcionando ????
            Zend_Session::destroy(); //nao esta funcionando ????
        }
        $this->_redirect("estabelecimento/auth");
    }

    private function getAuthAdapter($formData) {

        $bootstrap = $this->getInvokeArg("bootstrap");
        $resource = $bootstrap->getPluginResource("db");

        $db = $resource->getDbAdapter();

        $authAdapter = new Zend_Auth_Adapter_DbTable($db);
        $authAdapter->setTableName("funcionario")
                ->setIdentityColumn("email")
                ->setCredentialColumn("senha");
                //->setCredentialTreatment('role <> "" and role <> "user"');

        $authAdapter->setIdentity($formData['email'])
                ->setCredential($formData['senha']);

        return $authAdapter;
    }

    private function criaUsuarioNaSessao($auth){

            $privilege = new DbTable_UserPrivileges();
            $funcionario = new DbTable_Funcionario();
            $user = new User();
            $user->id = $auth->getIdentity()->cod_funcionario;
            $user->name = $auth->getIdentity()->nome;
            $user->resources = $privilege->getResourcesFromUser($user->id);
            $user->empresa = $funcionario->getEmpresa($user->id);
            $user->role = $privilege->getUserRole($user->id);
            $session = new Zend_Session_Namespace('default');
            //$session->resetSingleInstance('estabelecimento');
            //$session->__unset('estabelecimento');
            $session->user = $user;        
    }

}

