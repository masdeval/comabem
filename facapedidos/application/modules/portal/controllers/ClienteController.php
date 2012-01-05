<?php

class Portal_ClienteController extends Zend_Controller_Action
{

    private $session;
    private $ClienteDB;

    public function init()
    {
	/* Initialize action controller here */
	$this->_helper->layout()->disableLayout();

	$this->session = new Zend_Session_Namespace('compra');
	$this->ClienteDB = new DbTable_ClienteDAO();

	if (isset($this->session->cliente))
	    $this->view->nomeCliente = $this->session->cliente->getNomeExibicao();
    }

    public function indexAction()
    {
	$isFecharPedido = (boolean) $this->_getParam('isFecharPedido');

	if ($isFecharPedido)
	    $this->view->isFecharPedido = true;
    }

    public function errorAction()
    {

	$this->view->cliente = $this->getRequest()->getPost('cliente');
	$this->_helper->viewRenderer('index');
    }

    public function criarContaAction()
    {
	$formData = $this->getRequest()->getPost("cliente");

	if (!$formData['aceite'])
	{
	    $this->view->headline = "Você deve aceitar os termos e condições do site antes de prosseguir.";
	    $this->errorAction();
	    return;
	}

	try
	{
	    unset($formData['senha_repetida']);
	    unset($formData['aceite']);
	    $formData['data_cadastro'] = date("Y-m-d H:i:s");
	    $id = $this->ClienteDB->add($formData);
	    $this->_helper->viewRenderer('index');
	    $this->view->headline = "Cadastro efetuado com sucesso.";

	    //cria cliente na sessao
	    $cliente = new Cliente($id, $formData['nome'], $formData['email'], $formData['telefone']);
	    $this->session->cliente = $cliente;

	    if ((boolean) $this->getRequest()->getPost('isFecharPedido'))
	    {
		$this->_forward("fechar-Pedido", "pedido", "portal");
		return;
	    }
	}
	catch (Exception $e)
	{
	    if ($e->getCode() == 23505) //Unique violation
	    {
		$this->view->headline = "Esse email já foi cadastrado. Favor escolher outro.";
		$this->errorAction();
		return;
	    }
	    else
	    {
		$this->view->headline = "Problema ao cadastrar sua conta. " . $e->getMessage();
		$this->errorAction();
		return;
	    }
	}
    }

    public function checkMailAjaxAction()
    {

	$email = $this->_getParam("email");

	$flag = (boolean) $this->ClienteDB->isMailDuplicado($email);

	if ($flag)
	{
	    echo "Fail";
	}


	exit;
    }

    public function loginAction()
    {
	$email = $this->getRequest()->getPost('email-login');
	$senha = $this->getRequest()->getPost('senha-login');
	$this->_helper->viewRenderer('index');

	$retorno = $this->ClienteDB->validaCliente($email, $senha);

	if ($retorno == 2)//login nao encontrado
	{
	    $this->view->headline = "Email não confere!";
	}
	else if ($retorno == 3)
	{
	    $this->view->headline = "Senha não confere!";
	}
	else
	{

	    //cria cliente na sessao	    
	    $this->session->cliente = $retorno;

	    if ((boolean) $this->getRequest()->getPost('isFecharPedido'))
	    {
		$this->_forward("fechar-Pedido", "pedido", "portal");
		return;
	    }

	    $this->_forward("index","index","portal");
	}
    }

    public function logoutAction()
    {
	$this->_helper->viewRenderer('index');

	if (isset($this->session))
	{
	    unset($this->session->cliente);
	    unset($this->session->carrinho);
	    unset($this->session->configuracoesPedido);

	}

	$this->view->headline = "Logout efetuado com sucesso";
    }

}

?>
