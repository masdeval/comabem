<?php

class Plugins_CheckAcl extends Zend_Controller_Plugin_Abstract {

    private $_acl = null;

    public function __construct(Zend_Acl $acl) {

        $this->_acl = $acl;
    }

    public function dispatchLoopStartup(Zend_Controller_Request_Abstract $request) {
        
        //Deixa sempre passar tela de erro e de login
        if ($request->getControllerName() == 'error' OR $request->getControllerName() == 'auth'
		OR $request->getModuleName() == 'portal' OR ($request->getControllerName() == 'index' and $request->getActionName() == 'quemSomos')
                OR ($request->getControllerName() == 'index' and $request->getActionName() == 'faleConosco')
                )
            return true;

        if (!$this->_accessValid($request)) {
            //we throw an exception because the error controller
            //can easily handle these
            //Tenho que mudar o request aqui se nao ira apresentar a pagina mesmo sendo invalida
            $request->setModuleName('estabelecimento')
                ->setControllerName('auth')
                ->setActionName('index');
   
            throw new Exception('Access denied');
        }
        else{

         /* Essa parte é importante. Seta no navigation qual a role que deve ser considerada.
          * Cada usuario tem sua propria role e se chegar aqui certamente ja terá um usuario na sessao.
          *  */
         $view = Zend_Registry::get('view');
         $session = new Zend_Session_Namespace('estabelecimento');
         if (isset($session->user))
         {
            $view->navigation()->setRole(new Zend_Acl_Role($session->user->role));
         }

        }

    }

    private function _accessValid(Zend_Controller_Request_Abstract $request) {

        $module = $request->getModuleName();
        $resource = $request->getControllerName();
        $action = $request->getActionName();

        $session = new Zend_Session_Namespace('estabelecimento');
        if (isset($session->user)){
            $user = $session->user;
        }
        else
        {
           $request->setModuleName('estabelecimento')
                ->setControllerName('auth')
                ->setActionName('index');
	   return false; 
        }

    $aux = $module . ':' . $resource;
    return $this->_acl->hasRole($user->role) && $this->_acl->has($aux)
       && $this->_acl->isAllowed($user->role, $aux, $action);

    }

}