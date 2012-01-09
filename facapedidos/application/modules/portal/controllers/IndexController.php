<?php

class Portal_IndexController extends Zend_Controller_Action
{

    public $TipoProdutoDB;
    public $ProdutoDB;
    public $FotoProdutoDB;
    private $session;

    public function init()
    {
	/* Initialize action controller here */
	$this->session = new Zend_Session_Namespace('compra');
	$this->_helper->layout()->disableLayout();
	$this->TipoProdutoDB = new DbTable_TipoProduto();
	$this->FotoProdutoDB = new DbTable_FotoProduto(Zend_Db_Table::getDefaultAdapter());
	$this->ProdutoDB = new DbTable_Produto(Zend_Db_Table::getDefaultAdapter());
	$this->EmpresaDB = new DbTable_Empresa(Zend_Db_Table::getDefaultAdapter());
	$this->RecadoClienteDB = new DbTable_RecadoCliente();
	if (isset($this->session->cliente))
	{
	    $this->view->nomeCliente = $this->session->cliente->getNomeExibicao();
	}
    }

    public function indexAction()
    {
	$this->view->cod_tipo_produto = $this->TipoProdutoDB->getCodTipoProductoDropDown();
    }

    public function consultaAction()
    {
	$criterios = $this->getRequest()->getPost('criterio');
	$tipos_produto = $this->getRequest()->getPost('cod_tipo_produto');
	$caloria = $this->getRequest()->getPost('caloria');
	$produtos = "";

	//primeiro busca com o lucene
	if (!empty($criterios))
	{
	    $hits = LuceneManager::search($criterios);
	    //obtem a lista de empresas em ordem crescente de relevancia e insere os ids em uma string
	    //para fazer select no banco
	    $cod_empresa = "";
	    foreach ($hits as $hit)
	    {
		//Quero selecionar apenas uma vez uma determinada empresa no filtro da primeira pagina
		if ($cod_empresa == $hit->cod_empresa)
		{
		    continue;
		}
		else
		{
		    $cod_empresa = $hit->cod_empresa;
		    $produtos .= $hit->cod_produto . ", ";
		}
	    }
	    $produtos .= "-1"; //so porque fica uma virgula no final
	}

	$resultado = $this->ProdutoDB->consultaQBE($produtos, $caloria, $tipos_produto);

	//insere em resultado a situacao do estabelecimento informando se o mesmo
	//esta aberto ou fechado
	
	$hora_atual = date('H') . ":" . date('i') . ":00";

	$empresa_ja_apresentada = array();
	$novo_resultado = array();
	$j = 0;
	for ($i = 0; $i < sizeof($resultado); $i++)
	{
	    if (array_key_exists($resultado[$i]['cod_empresa'], $empresa_ja_apresentada))
	    {
		continue;
	    }
	    else
	    {
		//quero apresentar empresas apenas uma vez
		$empresa_ja_apresentada[$resultado[$i]['cod_empresa']] = $resultado[$i]['cod_empresa'];
		$resultado[$i]['isAberto'] = $this->EmpresaDB->isAberto($resultado[$i]['cod_empresa'], date('l'), $hora_atual);
		$novo_resultado[$j] = $resultado[$i];
		$j++;
	    }
	}


	$this->view->resultado = $novo_resultado;
	$this->view->cod_tipo_produto = $this->TipoProdutoDB->getCodTipoProductoDropDown();
	$this->view->pesquisa_facapedido_criterio = $criterios;
	$this->view->pesquisa_facapedido_tipo_produto = $tipos_produto;
	$this->view->pesquisa_facapedido_caloria = $caloria;

	$this->_helper->viewRenderer("index");
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

    public function lojaFechadaAction()
    {
	$cod_empresa = $this->_getParam('codEmpresa', '');
	$cod_produto = $this->_getParam('codProduto', '');
	$data = date('d') . "/" . date('m') . "/" . date('Y'); //ano com 4 digitos
	$hora_atual = date('H') . ":00";
	$status = $this->RecadoClienteDB->registraSolicitacaoLojaAberta($cod_empresa, $cod_produto, $data, $hora_atual);
	echo $status;
	exit;
    }

    public function limparCarrinhoAction()
    {
	if (isset($this->session))
	{
	    $this->session->__unset("carrinho");
	    $this->session->__unset("configuracoesPedido");
	    
	}
	$this->view->cod_tipo_produto = $this->TipoProdutoDB->getCodTipoProductoDropDown();
	$this->_helper->viewRenderer("index");
    }

}

