<?php

class Estabelecimento_IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
        $this->_helper->layout()->setLayout('header');
        
        if (isset($this->session->user))
        {
          $this->view->responsavel = $this->session->user->name;
          $this->_redirect("estabelecimento/index");  
        }
        else
        {
           $this->_redirect("estabelecimento/auth");
        }
      
        
    }

    public function indexAction()
    {
      
     
    }




}







