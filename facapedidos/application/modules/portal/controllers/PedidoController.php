<?php

class Portal_PedidoController extends Zend_Controller_Action
{

    private $session;

    public function init()
    {
	/* Initialize action controller here */
	$this->_helper->layout->disableLayout();
	$this->session = new Zend_Session_Namespace('compra');

	$this->ProdutoDB = new DbTable_Produto(Zend_Db_Table::getDefaultAdapter());
	$this->EmpresaDB = new DbTable_Empresa(Zend_Db_Table::getDefaultAdapter());
	$this->TamanhoProdutoDB = new DbTable_TamanhoProduto(Zend_Db_Table::getDefaultAdapter());
	$this->CategoriaAdicinal = new DbTable_CategoriaPermitidaComoAdicional(Zend_Db_Table::getDefaultAdapter());
	$this->IngredientesCategoria = new DbTable_CategoriaIngredienteEmpresa(Zend_Db_Table::getDefaultAdapter());
	$this->PedidoDB = new DbTable_PedidoDAO();

	if (isset($this->session->cliente))
	    $this->view->nomeCliente = $this->session->cliente->getNomeExibicao();
    }

    public function fecharPedidoAction()
    {
	//verifa se cliente esta logado
	if (!isset($this->session->cliente))
	{
	    $this->getRequest()->setParam("isFecharPedido", true);
	    $this->_forward("index", "cliente", "portal");
	    return;
	}

	$empresas = $this->session->carrinho->getCarrinho();
	if (empty($empresas))
	    return;

	$this->_helper->layout->disableLayout();

	//descobre quais são os ids das empresas que estao no array $empresas
	$cod_empresas = array_keys($empresas);

	$configuracao_produtos = array(); //controla os adicionais que um produto poderá ter

	foreach ($cod_empresas as $key_empresa)
	{
	    //obtem todos os produtos dessa empresa
	    $cod_tamanho_produtos = array_keys($empresas[$key_empresa]);

	    foreach ($cod_tamanho_produtos as $key_tamanho)
	    {
		//obtem as informacoes de tamanho
		try
		{
		    $tamanho_produto = $this->TamanhoProdutoDB->getRecords($key_tamanho);
		}
		catch (Exception $e)
		{
		    continue;
		}
		//retorna um array indexado de 0
		$configuracoes = $this->ProdutoDB->configuracaoProduto($tamanho_produto['cod_produto']);
		$j = 0;
		for ($i = 0; $i < count($configuracoes); $i++)
		{

		    $configuracao_produtos[$key_empresa][$key_tamanho]['tipo_produto'] = $configuracoes[$i]['tipo_produto'];
		    $configuracao_produtos[$key_empresa][$key_tamanho]['numero_sabores_pizza'] = $tamanho_produto['numero_sabores_pizza'];
		    $configuracao_produtos[$key_empresa][$key_tamanho]['tempo_preparo_minutos'] = $configuracoes[$i]['tempo_preparo_minutos'];
		    $configuracao_produtos[$key_empresa][$key_tamanho]['cobrado_por_quilo'] = $configuracoes[$i]['cobrado_por_quilo'];
		    $configuracao_produtos[$key_empresa][$key_tamanho]['descricao'] = $configuracoes[$i]['descricao'];


		    $nome_categoria = $configuracoes[$i]['categoria_adicional'];
		    $qtd_max_adicionais = $configuracoes[$i]['qtd_max_adicionais'];

		    $ingredientes = array();
		    //itera em todos os ingredientes de uma categoria
		    while ($nome_categoria == $configuracoes[$i]['categoria_adicional'])
		    {
			$ingredientes[$configuracoes[$i]['cod_ingrediente']]['nome_ingrediente'] = $configuracoes[$i]['nome_ingrediente'];
			$ingredientes[$configuracoes[$i]['cod_ingrediente']]['preco_adicional'] = $configuracoes[$i]['preco_quando_adicional'];
			$i++;
		    }
		    $i--;

		    $configuracao_produtos[$key_empresa][$key_tamanho][$j] = array(
			"nome_categoria" => $nome_categoria,
			"qtd_max_adicionais" => $qtd_max_adicionais,
			"ingredientes" => $ingredientes,
		    );
		    $j++;
		}
	    }
	}

	$this->view->carrinho = $empresas;
	$this->view->configuracoes = $configuracao_produtos;
	$this->_helper->viewRenderer("index");

    }

    public function concluirCompraAction()
    {
	$this->_helper->viewRenderer("concluir_compra");
	$configuracoes = $this->getRequest()->getPost('configuracoes');

	$this->session->configuracoesPedido = $configuracoes;

	$this->view->emailCliente = $this->session->cliente->getEmail();
	$this->view->tefeloneCliente = $this->session->cliente->getTelefone();


	//Apresentar como endereco de entrega o endereco que o usuario utilizou para se localizar no site logo no início
	//Buscar enderecos de entrega que o cliente ja utilizou antes para apresentar opcao na tela??
	//compatibiliza o que esta em configuracoes com o carrinho na sessao
    }

    public function pagamentoAction()
    {
	$this->_helper->viewRenderer("concluir_pagamento");
	$endereco = $this->getRequest()->getPost('endereco');

	if (!isset($this->session->configuracoesPedido) || !isset($this->session->cliente))
	{
	    $this->view->headline = "Por algum motivo seu pedido não foi encontrado. Provavelmente transcorreu muito tempo desde o seu último acesso. Favor refazer o pedido.";
	    $this->view->emailCliente = $this->session->cliente->getEmail();
	    $this->view->tefeloneCliente = $this->session->cliente->getTelefone();

	    $this->_helper->viewRenderer("concluir_compra");
	}

	try
	{
	    $this->PedidoDB->cadastrarPedido($endereco, $this->session->configuracoesPedido, $this->session->cliente);
	}
	catch (Exception $e)
	{
	    $this->view->headline = "Houve um erro no processamento de sua solicitação. Erro: " . $e->getMessage();
	    $this->view->emailCliente = $this->session->cliente->getEmail();
	    $this->view->tefeloneCliente = $this->session->cliente->getTelefone();
	    $this->_helper->viewRenderer("concluir_compra");
	}
    }

    public function getImagemProdutoAction()
    {
	$this->_helper->layout->disableLayout();
	$this->_helper->viewRenderer->setNoRender(true);
	$id = $this->_getParam('id', '');
	$image = $this->FotoProdutoDB->getImageData($id);
	header('Content-type: image/jpeg/png/gif/jpg');
	echo base64_decode($image);
    }

    public function recalcularQuantidadeAction()
    {
	$this->_helper->layout->disableLayout();
	$cod_tamanho_produto = $this->getRequest()->getParam("cod_tamanho");
	$cod_empresa = $this->getRequest()->getParam("cod_empresa");
	$qt = $this->getRequest()->getParam("qt");

	if (empty($cod_tamanho_produto) || empty($cod_empresa))
	    return;

	if (isset($this->session->carrinho))
	{
	    $this->session->carrinho->alterarQuantidadeProduto($cod_empresa, $cod_tamanho_produto, $qt);
	}
	$this->fecharPedidoAction();

	exit;
    }

}

