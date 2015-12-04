<?php

class Estabelecimento_IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
        $this->_helper->layout()->setLayout('header');
        //$this->_helper->layout()->disableLayout();

        if (isset($this->session->responsavel))
	{
	    $this->view->responsavel = $this->session->responsavel->getNomeExibicao();
	}
    }

    public function indexAction()
    {
      
     
    }




}







