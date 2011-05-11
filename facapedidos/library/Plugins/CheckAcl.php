<?php


class Plugins_CheckAcl extends Zend_Controller_Plugin_Abstract{
	
	private $_acl = null;
	
	public function __construct(Zend_Acl $acl){
		
		$this->_acl = $acl;
	}
	
	public function dispatchLoopStartup(Zend_Controller_Request_Abstract $request){
		
		$module = $request->getModuleName();
		$resource = $request->getControllerName();
		$action = $request->getActionName();
		
		
		if($module == 'estabelecimento'){
			
			if(!$this->_acl->isAllowed(Zend_Registry::get('role'),$module.':'.$resource,$action)){
				
				if(Zend_Registry::get("role") == "guest" ){
				
					$request->setModuleName('estabelecimento')
							->setControllerName('auth')
							->setActionName('index');
				}else{
					$request->setModuleName('estabelecimento')->setControllerName('index');
				} 
								
			}
			
		}
		
	}
	
	
	
}