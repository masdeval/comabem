<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
    /**
     * Automatically load classes that are part of the default module.
     */
    /*  protected function _initModuleAutoloader()
      {
      new Zend_Application_Module_Autoloader(array(
      'namespace' => 'Default',
      'basePath' => APPLICATION_PATH
      ));
      } */

    /**
     * Initialize our routes.
     * We setup a default route that allows the user to load an action like IndexController:testAction()
     * through the URL like mysite.com/test. This allows us to not have to prefix the action with the
     * controller like mysite.com/index/test. However, since the default route is there, that would
     * still work and any other :controller/:action routes
     */
    protected function _initRoutes()
    {
	$this->bootstrap('frontcontroller');
	$front = $this->getResource('frontcontroller');

	$router = $front->getRouter();
	/*
	  $router->addRoute('index-action', new Zend_Controller_Router_Route(
	  ':action/*',
	  array(
	  'controller' => 'index',
	  'action' => 'index'
	  )
	  )); */

	$router->addRoute("url-lojas", new Zend_Controller_Router_Route(
			":url_loja",
			array(
			    'module' => 'portal',
			    'controller' => 'loja',
			    'action' => 'index'
			)
	));

	$router->addRoute("portal", new Zend_Controller_Router_Route(
			"portal",
			array(
			    'module' => 'portal',
			    'controller' => 'index',
			    'action' => 'index'
			)
	));

	$router->addRoute("estabelecimento", new Zend_Controller_Router_Route(
			"estabelecimento",
			array(
			    'module' => 'estabelecimento',
			    'controller' => 'index',
			    'action' => 'index'
			)
	));


	//return $router;
    }

    protected function _initViews()
    {
	$this->bootstrap("view");
	$view = $this->getResource("view");

	Zend_Registry::set("view", $view);

	$view->headMeta()->appendHttpEquiv("Content-type", "text/html;charset=utf-8");
	$view->addHelperPath("ZendX/JQuery/View/Helper", "ZendX_JQuery_View_Helper");
    }

    protected function _initAutoLoader()
    {

	$autoloader = Zend_Loader_Autoloader::getInstance();
	$autoloader->setFallbackAutoloader(true); //pega tudo


	/* $autoloader = new Zend_Loader_Autoloader_Resource(array(
	  'namespace' => '',
	  'basePath' => APPLICATION_PATH,
	  'resourceTypes' => array(
	  'form' => array(
	  'path' => 'forms/',
	  'namespace' => 'Form',
	  ),
	  'model' => array(
	  'path' => 'models/',
	  'namespace' => 'Model',
	  ),
	  )
	  )); */
    }

    protected function _initPlugins()
    {
	$bootstrap = $this->getApplication();
	if ($bootstrap instanceof Zend_Application)
	    $bootstrap = $this;

	$bootstrap->bootstrap('FrontController');
	$front = $bootstrap->getResource('FrontController');

	$front->registerPlugin(new Plugins_layout());
    }

    /**
     * Here we will initialize any view helpers.    This will also setup basic
     * head information for the view/layout.
     */
    /*   protected function _initViewHelpers()
      {
      $this->bootstrap(array('frontcontroller', 'view'));
      $frontController = $this->getResource('frontcontroller');
      $view = $this->getResource('view');

      // Add helper paths.
      $view->addHelperPath(APPLICATION_PATH . '/views/helpers', 'Default_View_Helper');

      // Setup our AssetUrl View Helper
      if ((bool) $frontController->getParam('cdnEnabled'))
      $view->getHelper('AssetUrl')->setBaseUrl($frontController->getParam('cdnHost'));

      // Set our DOCTYPE
      $view->doctype('XHTML1_STRICT');

      // Set our TITLE
      $view->headTitle()->setSeparator(' - ')->append('Site');

      // Add any META elements
      $view->headMeta()->appendHttpEquiv('Content-Type', 'text/html; charset=UTF-8');
      $view->headMeta()->appendHttpEquiv('Content-Style-Type', 'text/css');
      $view->headMeta()->appendHttpEquiv('imagetoolbar', 'no');

      // Add our favicon
      $view->headLink()->headLink(array(
      'rel' => 'favicon',
      'type' => 'image/ico',
      'href' => $view->baseUrl('favicon.ico')
      ));

      // Add Stylesheet's
      $view->headLink()
      ->appendStylesheet($view->assetUrl('css/reset.css'));

      // Add JavaScript's
      $view->headScript()
      ->appendFile('http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js');
      }
     */
}

