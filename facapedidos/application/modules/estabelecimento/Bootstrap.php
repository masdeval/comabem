<?php

class Estabelecimento_Bootstrap extends Zend_Application_Module_Bootstrap{

	private $_acl = null;

	protected function _initViews(){
		
		$view = Zend_Registry::get("view");
		
		//Titulo
		$view->headTitle("faça pedidos Online - Painel de controle");
		
		//CSS
		$view->headLink()->appendStylesheet("/js/jquery-ui-1.8.4.custom/css/custom-theme/jquery-ui-1.8.4.custom.css");
		$view->headLink()->appendStylesheet("/js/jcarousel/skins/tango/skin.css");
		$view->headLink()->appendStylesheet("/js/DataTables-1.7.1/media/css/demo_table.css");
		$view->headLink()->appendStylesheet("/css/base.css");
		
		
		//JS
		$view->headScript()->appendFile("/js/jquery-ui-1.8.4.custom/js/jquery-ui-1.8.4.custom.min.js","text/javascript");
		$view->headScript()->appendFile("/js/jcarousel/lib/jquery.jcarousel.min.js","text/javascript");
		$view->headScript()->appendFile("/js/DataTables-1.7.1/media/js/jquery.dataTables.js","text/javascript");
		$view->headScript()->appendFile("/js/js.js","text/javascript");
	
	}
	
	
	public function _initAdminAcl(){
		
             /*
              * Verifica se foi armazenado na sessao o resultado de uma autenticacao. Se sim, lê a role
              * desse usuario (um usuario tem apenas uma role) e seta numa variavel de registro.
              * 
              *  if(Zend_Auth::getInstance()->setStorage(new Zend_Auth_Storage_Session("estabelecimento"))
			->hasIdentity()){
			
		Zend_Registry::set("role",Zend_Auth::getInstance()->setStorage(new Zend_Auth_Storage_Session("estabelecimento"))->getStorage()->read()->role);
			
		}else{
			
			Zend_Registry::set("role","guest");
			
		}
*/
		$this->_acl = new AdminAcl();
		$front = Zend_Controller_Front::getInstance();		
		$front->registerPlugin(new Plugins_CheckAcl($this->_acl)); 	
		
	}
	
	
	/*public function _initNavigation(){
		$view = Zend_Registry::get('view');
		$nav = new Zend_Config_Xml(APPLICATION_PATH."/configs/estabelecimentoNavigation.xml");
		$navContainer = new Zend_Navigation($nav);
		$view->navigation($navContainer);// ->setAcl($this->_acl)->setRole(Zend_Registry::get("role"));
	}*/
}

?>