<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PedidoController
 *
 * @author masdeval
 */

//require_once 'EnviaSMS.php';
//require_once 'EnviaSMSMeuSMSGratis.php';

class Estabelecimento_PedidosController extends Zend_Controller_Action
{

    public $session;
    public $db;
    public $empresaId; //empresa que o usuario logado que instanciou esta classe pertence

    public function init()
    {
	$this->db = Zend_Db_Table::getDefaultAdapter();
	$this->session = new Zend_Session_Namespace('default');
	if (isset($this->session->user))
	{
	    $this->empresaId = $this->session->user->empresa;
	}

	$this->_helper->layout()->setLayout('layout');

	$this->PedidoDB = new DbTable_PedidoDAO();

	$this->view->pageTitle = 'Atendimento de Pedidos';
	//$this->caminho = $this->getRequest()->getModuleName() . "/" . $this->getRequest()->getControllerName();
    }

    public function indexAction()
    {

	$this->view->empresaId = $this->empresaId;
	$this->view->pedidos = $this->PedidoDB->obtemPedidosPagos($this->empresaId);
    }



    public function ajaxRejeitarAction()
    {
	$this->_helper->layout->disableLayout();
	$this->_helper->viewRenderer->setNoRender(true);
	$cod_pedido = $this->_getParam('cod_pedido');
        $cod_empresa = $this->_getParam('cod_empresa');
	$celular = $this->_getParam('celular');
	$email = $this->_getParam('email');

	if (!empty($cod_pedido))
	{
	    //envia email informando
	    $mail = new Zend_Mail();
	    $mail->setBodyText('Infelizmente não foi possível atender sua solicitação. Em breve seu pagamento será extornado no seu cartão. Att. Equipe FacaPedido');
	    $mail->setFrom('FacaPedido@facapedido.com');
	    $mail->addTo($email);
	    $mail->setSubject('FacaPedido - Cancelamento');
	    //TODO facapedido - Se o email nor for enviado o que fazer?
	    $mail->send();

    	    //envia SMS -> pode nao ser enviado
	    $SMS = new EnviaSMSComtele();
	    $SMS->enviarSMS($celular, "Desculpe mas nao foi possivel atender seu pedido.Em breve entraremos em contato.");
	    //TODO facapedido - Se o SMS nao for enviado o que fazer?

    	    //muda estado do pedido
	    $this->PedidoDB->rejeitar($cod_pedido,$cod_empresa);
	}
    }

    public function ajaxPrepararAction()
    {
	$this->_helper->layout->disableLayout();
	$this->_helper->viewRenderer->setNoRender(true);
	$cod_pedido = $this->_getParam('cod_pedido');
	$cod_empresa = $this->_getParam('cod_empresa');

	if (!empty($cod_pedido))
	{
	    //muda estado do pedido
	    $this->PedidoDB->preparar($cod_pedido,$cod_empresa);
	}
    }


    public function ajaxAlterarTempoAction()
    {
	$this->_helper->layout->disableLayout();
	$this->_helper->viewRenderer->setNoRender(true);
	$cod_pedido = $this->_getParam('cod_pedido');
	$cod_empresa = $this->_getParam('cod_empresa');
	$novo_tempo = $this->_getParam('novo_tempo');
	$email = $this->_getParam('email');
	$celular = $this->_getParam('celular');
	
	if (!empty($cod_pedido))
	{
	    //envia email informando
	    $mail = new Zend_Mail();
	    $mail->setBodyText('Informamos que o tempo para entrega de seu pedido foi alterado para'.$novo_tempo.' minutos. Equipe FacaPedido');
	    $mail->setFrom('FacaPedido@facapedido.com');
	    $mail->addTo($email);
	    $mail->setSubject('FacaPedido - Mudança de tempo para entrega');
	    //TODO facapedido - Se o email nor for enviado o que fazer?
	    $mail->send();

    	    //envia SMS -> pode nao ser enviado
	    $SMS = new EnviaSMSComtele();
	    $SMS->enviarSMS($celular, 'Informamos que o tempo para entrega de seu pedido foi alterado para'. $novo_tempo.' minutos.  Equipe FacaPedido');
	    //TODO facapedido - Se o SMS nao for enviado o que fazer?

	    //muda estado do pedido
	    $this->PedidoDB->alterarTempoEntrega($cod_pedido,$cod_empresa,$novo_tempo);
	}
    }



}





?>
