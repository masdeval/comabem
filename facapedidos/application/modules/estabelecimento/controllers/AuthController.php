<?php

class Estabelecimento_AuthController extends Zend_Controller_Action
{

    public function init()
    {
        $this->_helper->layout()->disableLayout();
    }

    public function indexAction()
    {
  		$this->_forward('login');
    }
    
    public function loginAction()
    {
    	 $form = new Forms_EstabelecimentoLogin();
    	 
    	 if($this->_request->isPost()){
    	 	
    	 	$formData = $this->_request->getPost();
    	 	
    	 	if($form->isValid($formData))
    	 	{
					$authAdapter = $this->getAuthAdapter($formData);
    	 			$result = $authAdapter->authenticate();
    	 			
    	 			if($result->isValid())
    	 			{
    	 				$auth = Zend_Auth::getInstance();
    	 				$auth->setStorage(new Zend_Auth_Storage_Session("estabelecimento"));
    	 				$dataAuth = $authAdapter->getResultRowObject(null,'senha');
		       			$auth->getStorage()->write($dataAuth);
		       			$this->_redirect("estabelecimento/index");
    	 				
    	 			}else{
    	 				$this->view->mensagem = "Usuário ou senha inválidos.";
    	 			}
    	 		
    	 	}else{
    	 				$this->view->mensagem = "Informações inválidas";
    	 	}
    	 	
    	 }
    	 
    	 $this->view->form = $form;
    }

 	public function logoutAction(){
    	
    	$this->_helper->viewRenderer->setNoRender();
    	$this->_helper->layout->disableLayout();
    	$auth = Zend_Auth::getInstance();
    	$auth->setStorage(new Zend_Auth_Storage_Session("estabelecimento"));
    	$auth->clearIdentity();
    	$this->_redirect("estabelecimento/auth");
    	
    }
    
 	private function getAuthAdapter($formData)
 	{
    	
    	$bootstrap = $this->getInvokeArg("bootstrap");
    	$resource = $bootstrap->getPluginResource("db");
    	
    	$db = $resource->getDbAdapter();
    	
    	$authAdapter = new Zend_Auth_Adapter_DbTable($db);
    	$authAdapter->setTableName("funcionario")
			    	->setIdentityColumn("email")
			    	->setCredentialColumn("senha")
			    	->setCredentialTreatment('role <> "" and role <> "user"');
    	
    	$authAdapter->setIdentity($formData['email'])
		       		->setCredential($formData['senha']);
    	
    	return $authAdapter;
    }

}

