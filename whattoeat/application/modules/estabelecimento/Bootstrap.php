<?php

class Estabelecimento_Bootstrap extends Zend_Application_Module_Bootstrap
{

    private $_acl = null;

    protected function _initViews()
    {

        $view = Zend_Registry::get("view");

        //Titulo
       /* $view->headTitle("Bem vindo ao Coma Bem!");

        //CSS
        $view->headLink()->appendStylesheet("/js/jquery-ui-1.8.4.custom/css/custom-theme/jquery-ui-1.8.4.custom.css");
        $view->headLink()->appendStylesheet("/js/jcarousel/skins/tango/skin.css");
        $view->headLink()->appendStylesheet("/js/DataTables-1.7.1/media/css/demo_table.css");
        $view->headLink()->appendStylesheet("/css/base.css");
        $view->headLink()->appendStylesheet("/css/portal.css");


        //JS
        $view->headScript()->appendFile("/js/jquery-ui-1.8.4.custom/js/jquery-ui-1.8.4.custom.min.js", "text/javascript");
        $view->headScript()->appendFile("/js/jcarousel/lib/jquery.jcarousel.min.js", "text/javascript");
        $view->headScript()->appendFile("/js/DataTables-1.7.1/media/js/jquery.dataTables.js", "text/javascript");
        $view->headScript()->appendFile("/js/js.js", "text/javascript");*/
    }

    public function _initAdminAcl()
    {

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

    public function _initNavigation()
    {
        $view = Zend_Registry::get('view');
        $config = new Zend_Config_Xml(APPLICATION_PATH . "/configs/estabelecimentoNavigation.xml","nav");
        $navContainer = new Zend_Navigation($config);

        /*
         * $view possui uma instancia da classe Zend_View. O código abaixo funciona pela seguinte explicacao:
         *
         * To use a helper in your view script, call it using $this->helperName() (onde $this é o Zend_View). Behind the scenes,
         * Zend_View will load the Zend_View_Helper_HelperName class, create an object instance of it,
         *  and call its helperName() method. The object instance is persistent within the Zend_View instance,
         *  and is reused for all future calls to $this->helperName().
         *
         *  Portanto, fazer $view->navigation irá instanciar um objeto da classe Zend_View_Helper_Navigation
         *
         */
        $view->navigation($navContainer)->setAcl(new AdminAcl()); //->setRole(new Zend_Acl_Role("geral"));
        //Nesse momento nao sei ainda qual role usar. Entao a role eh setada apenas no CheckAcl.php
        //quando ja se sabe qual usuario esta logado e qual a role do mesmo.
    }

}

?>