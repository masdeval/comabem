<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap {

    protected function _initViews() {
        $this->bootstrap("view");
        $view = $this->getResource("view");

        Zend_Registry::set("view", $view);

        $view->headMeta()->appendHttpEquiv("Content-type", "text/html;charset=utf-8");
        $view->addHelperPath("ZendX/JQuery/View/Helper", "ZendX_JQuery_View_Helper");
     
    }

    protected function _initAutoLoader() {
        $autoloader = Zend_Loader_Autoloader::getInstance();
        $autoloader->setFallbackAutoloader(true); //pega tudo
    }

    protected function _initPlugins() {
        $bootstrap = $this->getApplication();
        if ($bootstrap instanceof Zend_Application)
            $bootstrap = $this;

        $bootstrap->bootstrap('FrontController');
        $front = $bootstrap->getResource('FrontController');

        $front->registerPlugin(new Plugins_layout());
    }

}

