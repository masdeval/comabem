<?php

class Estabelecimento_AuthController extends Zend_Controller_Action {

    public $errorMessage;

    public function init() {
        
        $this->_helper->layout()->setLayout('header');
        
        //$this->_helper->layout()->disableLayout();        
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->FuncionarioDB = new DbTable_Funcionario($this->db);        
        
    }

    public function indexAction() {
        $msg = $this->_getParam('msg', '');
        $this->view->headline = $msg;
       
    }

    public function loginAction($formData) {
       // $form = new Form_login();
        $success = false;

        if ($this->_request->isPost()) {

            $formData = $this->_request->getPost();
        }
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
        

       // $this->view->form = $form;
    }

    public function logoutAction() {

        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        $auth = Zend_Auth::getInstance();
        $auth->setStorage(new Zend_Auth_Storage_Session('estabelecimento'));
        $auth->clearIdentity();
        $session = new Zend_Session_Namespace('estabelecimento');
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
                ->setIdentityColumn("cpf")
                ->setCredentialColumn("senha");
                //->setCredentialTreatment('role <> "" and role <> "user"');

        $authAdapter->setIdentity($formData['cpf'])
                ->setCredential($formData['senha']);

        return $authAdapter;
    }

    private function criaUsuarioNaSessao($auth){

            $privilege = new DbTable_UserPrivileges();
            $funcionario = new DbTable_Funcionario(Zend_Db_Table::getDefaultAdapter());
            $user = new User();
            $user->id = $auth->getIdentity()->cod_funcionario;
            $user->name = $auth->getIdentity()->nome;
            $user->resources = $privilege->getResourcesFromUser($user->id);
            $user->empresa = $funcionario->getEmpresa($user->id);
            $user->role = $privilege->getUserRole($user->id);
            $session = new Zend_Session_Namespace('estabelecimento');
            //$session->resetSingleInstance('estabelecimento');
            //$session->__unset('estabelecimento');
            $session->user = $user;        
    }
    
    public function criarContaAction()
    {
	$formData = $this->getRequest()->getPost("cliente");

	if (!$formData['aceite'])
	{
	    $this->view->headline = "Você deve aceitar os termos e condições do site antes de prosseguir.";
	    $this->errorAction();
	    return;
	}

	try
	{
	    unset($formData['senha_repetida']);
	    unset($formData['aceite']);

	     /*TODO Melhorar o timezone para obter valor de acordo com localizacao do usuario*/
	    date_default_timezone_set("America/Sao_Paulo");
	    $formData['data_cadastro'] = date("Y-m-d H:i:s");
	    $id = $this->FuncionarioDB->add($formData);
	    $this->_helper->viewRenderer('index');
	    $this->view->headline = "Cadastro efetuado com sucesso.";

	    //insere responsavel na sessao
            $this->loginAction($formData);
                 
            
	    //$responsavel = new Cliente($id, $formData['nome'], $formData['cpf'], '');
	    $this->view->responsavel = $this->session->user->name;

	}
	catch (Exception $e)
	{
	    if ($e->getCode() == 23505) //Unique violation
	    {
		$this->view->headline = "Esse CPF já foi cadastrado. Favor escolher outro.";
		$this->errorAction();
		return;
	    }
	    else
	    {
		$this->view->headline = "Problema ao cadastrar sua conta. " . $e->getMessage();
		$this->errorAction();
		return;
	    }
	}
    }
    

}

