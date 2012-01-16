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
	$this->_helper->layout->disableLayout();
	$this->_helper->viewRenderer("index");

	//verifa se cliente esta logado
	if (!isset($this->session->cliente))
	{
	    $this->getRequest()->setParam("isFecharPedido", true);
	    $this->_forward("index", "cliente", "portal");
	    return;
	}

	if (!isset($this->session->carrinho))//nao tem produto no carrinho
	{
	    $this->_forward("index", "index", "portal");
	    return;
	}

	$empresas = $this->session->carrinho->getCarrinho();
	if (empty($empresas))
	{
	    $this->_forward("index", "index", "portal");
	    return;
	}

	//descobre quais são os ids das empresas que estao no array $empresas
	$cod_empresas = array_keys($empresas);

	$configuracao_produtos = array(); //controla os adicionais que um produto poderá ter

	foreach ($cod_empresas as $key_empresa)
	{
	    //obtem todos os produtos dessa empresa
	    $cod_tamanho_produtos = array_keys($empresas[$key_empresa]);

	    foreach ($cod_tamanho_produtos as $key_tamanho)
	    {
		if (!is_numeric($key_tamanho))
		    continue;

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
		    if (strcasecmp($configuracao_produtos[$key_empresa][$key_tamanho]['tipo_produto'], "pizza") == 0 && ((int) $configuracao_produtos[$key_empresa][$key_tamanho]['numero_sabores_pizza']) > 0)
			$configuracao_produtos[$key_empresa][$key_tamanho]['sabores_pizza'] = $this->ProdutoDB->getSaboresPizza($key_empresa);
		    $configuracao_produtos[$key_empresa][$key_tamanho]['tempo_preparo_minutos'] = $configuracoes[$i]['tempo_preparo_minutos'];
		    $configuracao_produtos[$key_empresa][$key_tamanho]['cobrado_por_quilo'] = $configuracoes[$i]['cobrado_por_quilo'];
		    $configuracao_produtos[$key_empresa][$key_tamanho]['descricao'] = $configuracoes[$i]['descricao'];
		    $configuracao_produtos[$key_empresa][$key_tamanho]['max_adicionais'] = $configuracoes[$i]['numero_max_adicionais'];

		    $nome_categoria = $configuracoes[$i]['categoria_adicional'];
		    $qtd_max_adicionais = $configuracoes[$i]['qtd_max_adicionais'];

		    $ingredientes = array();
		    //itera em todos os ingredientes de uma categoria se existir
		    if (!empty($nome_categoria))
		    {
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
	}

	$this->view->carrinho = $empresas;
	$this->view->configuracoes = $configuracao_produtos;
	if (isset($this->session->configuracoesPedido))//significa que o usuario já chegou a fazer alguma configuracao e voltou para continuar comprando
	    $this->view->configuracoesJaFeitas = $this->session->configuracoesPedido;
    }

    /*
     * Chega aqui quando o usuario escolhe a opcao "Concluir Compra" ou "Continuar Comprando" 
     */

    public function concluirCompraAction()
    {
	$configuracoes = $this->getRequest()->getPost('configuracoes');
	$this->session->configuracoesPedido = $configuracoes;
	$carrinho = $this->session->carrinho->getCarrinho();
	//a quantidade pode ter sido alterada e isso deve se refletir no carrinho
	//isso faz com que seja mantida a ultima escolhe de quantidades na tela do usuario
	foreach ($configuracoes as $key_empresa => $tamanhos)
	{
	    foreach ($tamanhos as $key_tamanho => $detalhes)
	    {
		if ($key_tamanho == 'entregar' || $key_tamanho == 'sms' || $key_tamanho == 'observacao')
		    continue;

		//verifica se realmente a quantidade foi alterada
		//nao deve zerar as configuracoes quando o usuario nem mexeu na quantidade
		if ($detalhes['quantidade'] != null && $detalhes['quantidade'] >= 0 && $detalhes['quantidade'] != $carrinho[$key_empresa][$key_tamanho]['quantidade'])
		{
		    $this->session->carrinho->alterarQuantidadeProduto($key_empresa, $key_tamanho, $detalhes['quantidade']);
		    if (!empty($this->session->configuracoesPedido[$key_empresa][$key_tamanho]['adicionais']))//se ja havia escolhido algum adicional para esse produto, zera tudo
		    {
			unset($this->session->configuracoesPedido[$key_empresa][$key_tamanho]['adicionais']);
		    }
		}
	    }
	}

	$this->_helper->viewRenderer("concluir_compra");
	$this->view->emailCliente = $this->session->cliente->getEmail();
	$this->view->telefoneCliente = $this->session->cliente->getTelefone();
//TODO - Apresentar como endereco de entrega o endereco que o usuario utilizou para se localizar no site logo no início
//TODO - Buscar enderecos de entrega que o cliente ja utilizou antes para apresentar opcao na tela??
    }

    /*
     * Entra aqui quando o usuário já escolheu a forma de pagamento. Será cadastrodo seu pedido na base de dados e
     * encaminhado para a tela do player de pagamento escolhido.
     */
    public function pagamentoAction()
    {
	$this->_helper->viewRenderer("concluir_pagamento");
	$endereco = $this->getRequest()->getPost('endereco');

	if (!isset($this->session->configuracoesPedido) || !isset($this->session->cliente))
	{
	    $this->view->headline = "Por algum motivo seu pedido não foi encontrado. Provavelmente transcorreu muito tempo desde o seu último acesso. Por favor refaça seu pedido.";
	    $this->_helper->viewRenderer("concluir_compra");
	}

	$this->view->emailCliente = $this->session->cliente->getEmail();
	$this->view->tefeloneCliente = $this->session->cliente->getTelefone();

	if (empty($endereco))
	{
	    $this->view->headline = "O endereço deve ser preenchido.";
	    $this->_helper->viewRenderer("concluir_compra");
	}

	//cadastra pedido
	try
	{
	    $pedidoObject = new Pedido();
	    $pedidoObject->setCliente($this->session->cliente);

	    // A variavel $pedidoObject voltara povoada com os dados do pedido necessarios para criacao de uma transacao generica de pagamento
	    $id_pedido = $this->PedidoDB->cadastrarPedido($endereco, $this->session->carrinho->getCarrinho(), $this->session->configuracoesPedido, $this->session->cliente, $pedidoObject);

	    unset($this->session->configuracoesPedido);
	    unset($this->session->carrinho);
	    $this->session->id_pedido = $id_pedido;
	}
	catch (Exception $e)
	{
	    $this->view->headline = "Houve um erro no processamento da sua solicitação. Erro: " . $e->getMessage();
	    $this->_helper->viewRenderer("concluir_compra");
	    return;
	}

	//$forma_pagamento = $this->getRequest()->getPost('forma_pagamento');
	$forma_pagamento = FormasPagamentoEnum::$PagSeguro;
	//Inicia transacao de pagamento
	switch ($forma_pagamento)
	{
	    case FormasPagamentoEnum::$PagSeguro:

		$gerenciadorPagamento = new PagSeguroAdapter();
		$gerenciadorPagamento->enviaPagamento($pedidoObject);
		break;
	}
    }

    /*
     * Recebe o retorno automatico de uma transacao do PAgSeguro
     */
    public function notificacaoPagSeguroAction()
    {
	$this->_helper->viewRenderer("concluir_pagamento");

	//Usa a API do PagSeguro para fazer uma consulta aa transacao relacionada com a notificacao recebida

	/* Tipo de notificação recebida */
	$type = $this->getRequest()->getParam('notificationType');

	/* Código da notificação recebida */
	$code = $this->getRequest()->getParam('notificationCode');

	/* Verificando tipo de notificação recebida */
	//if ($type === 'transaction')
	{
	    $gerenciadorPagamento = new PagSeguroAdapter();
	    $transacao = $gerenciadorPagamento->getStatusPagamento($code);//retorna um objeto TransacaoPagamento
	    //Atualiza na tabela Pedido o status do pagamento de acordo com os valores possiveis em StatusPagamentoEnum
	    $this->PedidoDB->alterarStatusPedido($transacao->getCodPedido(), $transacao->getStatus());
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
	$carrinho = $this->session->carrinho->getCarrinho();
	//salva configuracoes
	$configuracoes = $this->getRequest()->getPost('configuracoes');
	$this->session->configuracoesPedido = $configuracoes;

	//a quantidade pode ter sido alterada e isso deve se refletir no carrinho
	//isso faz com que seja mantida a ultima escolhe de quantidades na tela do usuario
	foreach ($configuracoes as $key_empresa => $tamanhos)
	{
	    foreach ($tamanhos as $key_tamanho => $detalhes)
	    {
		if ($key_tamanho == 'entregar' || $key_tamanho == 'sms' || $key_tamanho == 'observacao')
		    continue;

		//verifica se realmente a quantidade foi alterada
		//nao deve zerar as configuracoes quando o usuario nem mexeu na quantidade
		if ($detalhes['quantidade'] != null && $detalhes['quantidade'] >= 0 && $detalhes['quantidade'] != $carrinho[$key_empresa][$key_tamanho]['quantidade'])
		{
		    $this->session->carrinho->alterarQuantidadeProduto($key_empresa, $key_tamanho, $detalhes['quantidade']);
		    if (isset($this->session->configuracoesPedido[$key_empresa][$key_tamanho]['adicionais']))//se ja havia escolhido algum adicional para esse produto, zera tudo
		    {
			unset($this->session->configuracoesPedido[$key_empresa][$key_tamanho]['adicionais']);
		    }
		}
	    }
	}

	$this->fecharPedidoAction();

	//exit;
    }

    public function continuarComprandoAction()
    {
	$this->_helper->layout->disableLayout();
	$this->_forward("index", "index", "portal");
    }

    /*
     * Recebe o retorno automatico logo apos uma compra ter sido aprovada em algum player de pagamento
     */
    public function retornoAutomaticoIntegradorAction()
    {
	$this->_helper->viewRenderer("concluir_pagamento");


    }

}

