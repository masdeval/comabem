<?php

class Portal_IndexController extends Zend_Controller_Action
{

    public $TipoProdutoDB;
    public $ProdutoDB;
    public $FotoProdutoDB;

    public function init()
    {
        /* Initialize action controller here */
        $this->_helper->layout()->disableLayout();
        $this->TipoProdutoDB = new DbTable_TipoProduto();
        $this->FotoProdutoDB = new DbTable_FotoProduto(Zend_Db_Table::getDefaultAdapter());
        $this->ProdutoDB = new DbTable_Produto(Zend_Db_Table::getDefaultAdapter());
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

        $this->view->resultado =  $this->ProdutoDB->consultaQBE($produtos, $caloria, $tipos_produto);
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



}

