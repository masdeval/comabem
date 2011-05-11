<?php

/** 
 * @author Eduardo
 * 
 * 
 */
class Plugins_layout extends Zend_Controller_Plugin_Abstract {
	//TODO - Insert your code here
	

	public function dispatchLoopStartup(Zend_Controller_Request_Abstract $request){
		
		$layout = Zend_Layout::getMvcInstance();
		$layout->setLayout("layout")->setLayoutPath(APPLICATION_PATH."/modules/".$request->getModuleName()."/views/layouts");
			
	}
}

?>