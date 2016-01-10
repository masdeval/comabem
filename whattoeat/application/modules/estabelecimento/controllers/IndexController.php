<?php

class Estabelecimento_IndexController extends Zend_Controller_Action {

    public $session;

    public function init() {
        $this->session = new Zend_Session_Namespace('estabelecimento');
        $this->view->responsavel = $this->session->user->name;
        $this->_helper->layout()->setLayout('header');
    }

    public function indexAction() {
        
    }

    public function quemsomosAction() {
        
    }

    public function faleconoscoAction() {

        $nome = $this->getRequest()->getPost("nome");
        $email = $this->getRequest()->getPost("email");
        $mensagem = $this->getRequest()->getPost("mensagem");

        if (!empty($nome) && !empty($email)) {


            $config = array('auth' => 'login',
                'username' => 'suporte@buscacomabem.com.br',
                'password' => 'inglaterra2012');

            $tr = new Zend_Mail_Transport_Smtp('localhost', $config);
            Zend_Mail::setDefaultTransport($tr);
            //envia email informando
            $mail = new Zend_Mail();
            $mail->setBodyText($nome." (".$email . ") escreveu: " . $mensagem);
            $mail->setFrom($email);
            $mail->addTo("suporte@buscacomabem.com.br");
            $mail->setSubject('Fale conosco');
            try {
                if ($mail->send($tr)) {
                    $this->view->headline = "Parabéns! Sua mensagem foi enviada.";
                }
            } catch (Exception $e) {
                return;
            }
        }
        
        
    }

}
