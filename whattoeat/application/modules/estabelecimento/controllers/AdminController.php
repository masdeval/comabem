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
        LuceneManager::recriateLuceneDatabase();
        $this->view->headline = "Base recriada com sucesso.";
        
                   
        } catch (Exception $ex) {
            
            $this->view->headline = "Erro ao recirar a base " . $ex;
        }
        $this->_helper->viewRenderer('index');
    }

  
}
