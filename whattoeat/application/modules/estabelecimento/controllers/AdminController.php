<?php

class Estabelecimento_AdminController extends Zend_Controller_Action {

    public $errorMessage;
    public $db;
   
    public function init() {

        $this->_helper->layout()->setLayout('header');
        $this->db = Zend_Db_Table::getDefaultAdapter();
      
    }

    public function indexAction() { 
        $msg = $this->_getParam('msg', '');
        $this->view->headline = $msg;
        
    }

    public function recriateLuceneDatabaseAction() {
                  
        try{
        
            $retorno = LuceneManager::recriateLuceneDatabase();
        
        $this->view->headline = $retorno;
        
                   
        } catch (Exception $e) {
            
            $this->view->headline = "Erro ao recirar a base " . $e;
        }
        $this->_helper->viewRenderer('index');
    }

  
}
