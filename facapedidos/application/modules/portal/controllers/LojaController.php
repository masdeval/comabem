<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of LojaController
 *
 * @author masdeval
 */
class Portal_LojaController extends Zend_Controller_Action
{

    //put your code here

    public function init()
    {
	/* Initialize action controller here */
	$this->_helper->layout()->disableLayout();
	$this->TipoProdutoDB = new DbTable_TipoProduto();
	$this->FotoProdutoDB = new DbTable_FotoProduto(Zend_Db_Table::getDefaultAdapter());
	$this->ProdutoDB = new DbTable_Produto(Zend_Db_Table::getDefaultAdapter());
	$this->EmpresaDB = new DbTable_Empresa(Zend_Db_Table::getDefaultAdapter());
    }

    public function indexAction()
    {
	$url_loja = $this->getRequest()->getParam("url_loja");

	if (empty($url_loja))
	{
	    $this->_forward("index","index","portal");
	    return;
	}


	//verifica se é uma URL valida
	$cod_empresa = $this->EmpresaDB->checkUrlExist($url_loja);
	if ($cod_empresa == false)
	{
	    $this->_helper->viewRenderer('pagina_nao_encontrada');
	    return;
	}
	$this->view->cod_empresa = $cod_empresa;
	$this->view->cod_tipo_produto = $this->TipoProdutoDB->getCodTipoProductoDropDown();

	//pode ser que chegou aqui via o botao "Ir à Loja"
	$cod_produto = $this->getRequest()->getParam("cod_produto");
	if (!empty($cod_produto))
	{
	    $this->consultaAction($cod_empresa, $cod_produto);
	}
	 
    }

    public function consultaAction($cod_empresa = '', $produtos = '')
    {
	//Obs: $produtos so estará preenchido se a funcao for chamada dentro da index

	if (empty($cod_empresa))
	{
	    $cod_empresa = $this->getRequest()->getPost('cod_empresa');
	}

	if (empty($cod_empresa))
	{
	    $this->_forward("index","index","portal");
	    return;
	}

	$criterios = $this->getRequest()->getPost('criterio');
	$tipos_produto = $this->getRequest()->getPost('cod_tipo_produto');
	$caloria = $this->getRequest()->getPost('caloria');

	//primeiro busca com o lucene
	if (!empty($criterios))
	{
	    $hits = LuceneManager::search($criterios);
	    //obtem a lista de produtos em ordem crescente de relevancia e insere os ids em uma string
	    //para fazer select no banco
	    foreach ($hits as $hit)
	    {
		$produtos .= $hit->cod_produto . ", ";
	    }
	    $produtos .= "-1"; //so porque fica uma virgula no final
	}

	$resultado = $this->ProdutoDB->consultaQBE($produtos, $caloria, $tipos_produto, $cod_empresa);

	//verifica se a loja esta aberta
	$hora_atual = date('H') . ":" . date('i') . ":00";
	$this->view->isAberto = $this->EmpresaDB->isAberto($cod_empresa, date('l'), $hora_atual);


	$this->view->resultado = $resultado;
	$this->view->cod_tipo_produto = $this->TipoProdutoDB->getCodTipoProductoDropDown();
	$this->view->pesquisa_facapedido_criterio = $criterios;
	$this->view->pesquisa_facapedido_tipo_produto = $tipos_produto;
	$this->view->pesquisa_facapedido_caloria = $caloria;
	$this->view->cod_empresa = $cod_empresa;

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

}

?>
