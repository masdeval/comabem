<?php

class Portal_IndexController extends Zend_Controller_Action
{

    public $TipoProdutoDB;
    public $ProdutoDB;
    public $FotoProdutoDB;
    public $EmpresaDB;
    public $RecadoClienteDB;
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
        $this->view->pesquisa_facapedido_empresa_oferece = array();
    }

    public function indexAction()
    {
	$this->view->cod_tipo_produto = $this->TipoProdutoDB->getCodTipoProductoDropDown();
        $this->view->pesquisa_facapedido_empresa_oferece = array();
        
    }

    public function consultaAction()
    {        
	$criterios = $this->getRequest()->getPost('criterio');
	$tipos_produto = $this->getRequest()->getPost('cod_tipo_produto');
	$caloria = $this->getRequest()->getPost('caloria');
        $empresa_oferece = $this->getRequest()->getPost('empresa_oferece');
        if(!$empresa_oferece){$empresa_oferece=array();}
	$produtos = "";

        //echo "<pre>"; print_r($_POST); die;
        
  
       
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
            $resultado = $this->ProdutoDB->consultaQBE($produtos, $caloria, $tipos_produto, $empresa_oferece);
	}else{
                        
            $resultado = LuceneManager::searchDefault($empresa_oferece);
            
}

	//insere em resultado a situacao do estabelecimento informando se o mesmo
	//esta aberto ou fechado
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
               

		date_default_timezone_set($resultado[$i]['timezone']);//seta a timezone do estabelecimento para que volte a hora correta de acordo com o fuso-horario local
		//date_default_timezone_set('asia/kolkata');
                $hora_atual = date('H') . ":" . date('i') . ":00";

//quero apresentar empresas apenas uma vez
		$empresa_ja_apresentada[$resultado[$i]['cod_empresa']] = $resultado[$i]['cod_empresa'];
		$resultado[$i]['isAberto'] = $this->EmpresaDB->isAberto($resultado[$i]['cod_empresa'], date('l'), $hora_atual);
		$novo_resultado[$j] = $resultado[$i];
		$j++;
	    }
             //echo "<pre>";print_r($resultado); die;
	}

//echo "<pre>"; print_r($novo_resultado); die;
	$this->view->resultado = $novo_resultado;
	$this->view->cod_tipo_produto = $this->TipoProdutoDB->getCodTipoProductoDropDown();
	$this->view->pesquisa_facapedido_criterio = $criterios;
	$this->view->pesquisa_facapedido_tipo_produto = $tipos_produto;
	$this->view->pesquisa_facapedido_caloria = $caloria;
        $this->view->pesquisa_facapedido_empresa_oferece = $empresa_oferece;

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
	

	date_default_timezone_set($this->EmpresaDB->getTimezone($cod_empresa));//seta a timezone do estabelecimento para que volte a hora correta de acordo com o fuso-horario local

	$data = date('d') . "/" . date('m') . "/" . date('Y'); //ano com 4 digitos
	$hora_atual = date('His');
	$status = $this->RecadoClienteDB->registraSolicitacaoLojaAberta($cod_empresa, $data, $hora_atual);
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

