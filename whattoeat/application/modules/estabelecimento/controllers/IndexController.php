<?php

class Estabelecimento_IndexController extends Zend_Controller_Action
{
    public $session;

    public function init()
    {
        $this->session = new Zend_Session_Namespace('estabelecimento');
        $this->view->responsavel = $this->session->user->name; 
        $this->_helper->layout()->setLayout('header');           
        
    }

    public function indexAction()
    {
      
     
    }




}







