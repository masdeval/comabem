<?php

class Plugins_CheckAcl extends Zend_Controller_Plugin_Abstract {

    private $_acl = null;

    public function __construct(Zend_Acl $acl) {

        $this->_acl = $acl;
    }

    public function dispatchLoopStartup(Zend_Controller_Request_Abstract $request) {

        //Deixa sempre passar tela de erro e de login
        if ($request->getControllerName() == 'error' OR $request->getControllerName() == 'auth')
            return true;

        if (!$this->_accessValid($request)) {
            //we throw an exception because the error controller
            //can easily handle these      
            throw new Exception('Access denied');
        }
    }

    private function _accessValid(Zend_Controller_Request_Abstract $request) {

        $module = $request->getModuleName();
        $resource = $request->getControllerName();
        $action = $request->getActionName();

        $session = new Zend_Session_Namespace('default');
        if (isset($session->user)){
            $user = $session->user;
        }
        else
        {
           $request->setModuleName('estabelecimento')
                ->setControllerName('auth')
                ->setActionName('index');
        }

    //$factory = new Application_Model_AclFactory();
    //$resource = strtolower($request->getControllerName());
    //$acl = $factory->createUserAcl($user);

    $aux = $module . ':' . $resource;
    return $this->_acl->hasRole($user->role) && $this->_acl->has($aux)
       && $this->_acl->isAllowed($user->role, $aux, $action);

   /* if ($module == 'estabelecimento') {

            if (!$this->_acl->isAllowed(Zend_Registry::get('role'), $module . ':' . $resource, $action)) {

                if (Zend_Registry::get("role") == "guest") {

                    $request->setModuleName('estabelecimento')
                            ->setControllerName('auth')
                            ->setActionName('index');
                } else {
                    //	$request->setModuleName('estabelecimento')->setControllerName('index');
                }
            }
        } */
    }

}