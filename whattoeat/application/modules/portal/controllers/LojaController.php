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
class Portal_LojaController extends Zend_Controller_Action {

    //put your code here
    private $session;

    public function init() {
        $this->session = new Zend_Session_Namespace('compra');
        /* Initialize action controller here */
        $this->_helper->layout()->disableLayout();
        $this->TipoProdutoDB = new DbTable_TipoProduto();
        $this->FotoProdutoDB = new DbTable_FotoProduto(Zend_Db_Table::getDefaultAdapter());
        $this->ProdutoDB = new DbTable_Produto(Zend_Db_Table::getDefaultAdapter());
        $this->EmpresaDB = new DbTable_Empresa(Zend_Db_Table::getDefaultAdapter());

        if (isset($this->session->cliente))
            $this->view->nomeCliente = $this->session->cliente->getNomeExibicao();

        $this->view->pesquisa_facapedido_empresa_oferece = array();
    }

    public function indexAction() {

        $url_loja = $this->getRequest()->getParam("url_loja");

        if (empty($url_loja)) {
            $this->_forward("index", "index", "portal");
            return;
        }


        //verifica se é uma URL valida. O retorno eh um array[0]['cod_empresa'] e array[0]['razao_social']
        $array = $this->EmpresaDB->checkUrlExist($url_loja);
        if ($array['cod_empresa'] == false) {
            $this->_helper->viewRenderer('pagina_nao_encontrada');
            return;
        }

        $this->view->cod_empresa = $array['cod_empresa'];
        $this->view->razao_social = $array['razao_social'];

        $this->view->cod_tipo_produto = $this->TipoProdutoDB->getCodTipoProductoDropDown();
        $this->view->pesquisa_facapedido_empresa_oferece = array();
        $this->view->url = $url_loja;

        //pode ser que chegou aqui via o botao "Ir à Loja" com algum criterio de busca ja selecionado
        $this->consultaAction($array['cod_empresa']);
    }

    public function consultaAction($cod_empresa = '', $produtos = '') {
        //Obs: $produtos so estará preenchido se a funcao for chamada dentro da index

        if (empty($cod_empresa)) {
            $cod_empresa = $this->getRequest()->getPost('cod_empresa');
        }

        if (empty($cod_empresa)) {
            $this->_forward("index", "index", "portal");
            return;
        }

        $criterios = $this->getRequest()->getPost('criterio');
        $tipos_produto = $this->getRequest()->getPost('cod_tipo_produto');
        $caloria = $this->getRequest()->getPost('caloria');
        $empresa_oferece = $this->getRequest()->getPost('empresa_oferece');
        if (!$empresa_oferece) {
            $empresa_oferece = array();
        }



        //primeiro busca com o lucene
        if (!empty($criterios)) {
            $hits = LuceneManager::search($criterios);
            //obtem a lista de produtos em ordem crescente de relevancia e insere os ids em uma string
            //para fazer select no banco
            foreach ($hits as $hit) {
                $produtos .= $hit->cod_produto . ", ";
            }
            $produtos .= "-1"; //so porque fica uma virgula no final
        }

        $resultado = $this->ProdutoDB->consultaQBE($produtos, $caloria, $tipos_produto, $empresa_oferece, '', $cod_empresa);

        if (empty($resultado)) {
            $this->view->headline = "Nenhum resultado encontrado.";
        }

        //verifica se a loja esta aberta
        date_default_timezone_set($this->EmpresaDB->getTimezone($cod_empresa)); //seta a timezone do estabelecimento para que volte a hora correta de acordo com o fuso-horario local
        $hora_atual = date('H') . ":" . date('i') . ":00";
        $this->view->isAberto = $this->EmpresaDB->isAberto($cod_empresa, date('l'), $hora_atual);


        $this->view->resultado = $resultado;
        $this->view->cod_tipo_produto = $this->TipoProdutoDB->getCodTipoProductoDropDown();
        $this->view->pesquisa_facapedido_criterio = $criterios;
        $this->view->pesquisa_facapedido_tipo_produto = $tipos_produto;
        $this->view->pesquisa_facapedido_caloria = $caloria;
        $this->view->cod_empresa = $cod_empresa;
        $this->view->pesquisa_facapedido_empresa_oferece = $empresa_oferece;
        //codigo necessario para apresentar no topo da pagina da loja suas informações 
        $dados_empresa = $this->EmpresaDB->getSingleData($cod_empresa);
        $this->view->razao_social = $dados_empresa['razao_social'];
        $this->view->rua = $dados_empresa['rua'];
        $this->view->numero = $dados_empresa['numero'];
        $this->view->complemento = $dados_empresa['complemento'];
        $this->view->bairro = $dados_empresa['bairro'];
        $this->view->telefone1 = $dados_empresa['telefone1'];
        $this->view->telefone2 = $dados_empresa['telefone2'];
        $this->view->email = $dados_empresa['email'];
        $this->view->website = $dados_empresa['website'];


        $this->_helper->viewRenderer("index");
    }

    public function getImagemProdutoAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        $id = $this->_getParam('id', '');
        $image = $this->FotoProdutoDB->getImageData($id);
        header('Content-type: image/jpeg/png/gif/jpg');
        echo base64_decode($image);
    }

    public function getLogoEmpresaAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        $empresaId = $this->_getParam('id');
        $image = $this->EmpresaDB->getImageData($empresaId);
        header('Content-type: image/jpeg/png/gif/jpg');
        echo base64_decode($image);
    }

    /*
     * Adiciona uma certa quantidade de itens de um produto no carrinho de compras.
     */

    public function addProdutoCarrinhoAction() {
        $this->_helper->layout->disableLayout();
        $cod_tamanho_produto = $this->getRequest()->getParam("cod_tamanho_produto");
        $cod_empresa = $this->getRequest()->getParam("cod_empresa");

        if (empty($cod_tamanho_produto) || empty($cod_empresa))
            return;

        $quantidade = (int) $this->getRequest()->getParam("quantidade");
        $nome_empresa = $this->getRequest()->getParam("nome_empresa");
        $nome_produto = $this->getRequest()->getParam("nome_produto");
        $tamanho = $this->getRequest()->getParam("tamanho");
        $preco = (double) $this->getRequest()->getParam("preco");

        if (isset($this->session->carrinho)) {
            try {
                $this->session->carrinho->addProduto($cod_empresa, $cod_tamanho_produto, $nome_empresa, $nome_produto, $preco, $tamanho, $quantidade);
                $status = 'Ok';
            } catch (Exception $e) {
                $status = 'Fail';
            }
        } else {
            try {
                $this->session->__set("carrinho", new Carrinho());
                $this->session->carrinho->addProduto($cod_empresa, $cod_tamanho_produto, $nome_empresa, $nome_produto, $preco, $tamanho, $quantidade);
                $status = 'Ok';
            } catch (Exception $e) {
                $status = 'Fail';
            }
        }

        echo $status;
        exit;
    }

    /*
     * Remove uma unidade de um produto que está no carrinho de compras.
     */

    public function removeUmaUnidadeProdutoCarrinhoAction() {
        $this->_helper->layout->disableLayout();
        $cod_tamanho_produto = $this->getRequest()->getParam("cod_tamanho_produto");
        $cod_empresa = $this->getRequest()->getParam("cod_empresa");

        if (empty($cod_tamanho_produto) || empty($cod_empresa))
            return;

        if (isset($this->session->carrinho)) {
            $this->session->carrinho->deleteProduto($cod_empresa, $cod_tamanho_produto);
        }
        exit;
    }

    public function retornaCarrinhoJsonAction() {

        /*
         * Talvez fosse necessario usar essa implementacao alternativa do JSON para retornar
         * strings com acentos de forma correta. Estou usando a implementacao padrao do PHP e
         * por enquanto esta funcionando corretamente.
         */
        //$json = new Services_JSON();
        ////echo $json->encode($this->session->carrinho->getCarrinho());

        if (isset($this->session)) {
            if (isset($this->session->carrinho)) {
                if ($this->session->carrinho->getCarrinho() != null && sizeof($this->session->carrinho->getCarrinho()) > 0) {
                    echo json_encode($this->session->carrinho->getCarrinho());
                } else {
                    echo "";
                }
            }
        }
        exit;
    }

    public function limparCarrinhoAction() {
        
        if (isset($this->session)) {
            $this->session->__unset("carrinho");
            $this->session->__unset("configuracoesPedido");
        }
        $cod_empresa = $this->getRequest()->getPost('cod_empresa');
        //verifica se a loja esta aberta
        date_default_timezone_set($this->EmpresaDB->getTimezone($cod_empresa)); //seta a timezone do estabelecimento para que volte a hora correta de acordo com o fuso-horario local
        $hora_atual = date('H') . ":" . date('i') . ":00";
        $this->view->isAberto = $this->EmpresaDB->isAberto($cod_empresa, date('l'), $hora_atual);


        $this->view->cod_tipo_produto = $this->TipoProdutoDB->getCodTipoProductoDropDown();
        $this->view->cod_empresa = $cod_empresa;
        //codigo necessario para apresentar no topo da pagina da loja suas informações 
        $dados_empresa = $this->EmpresaDB->getSingleData($cod_empresa);
        $this->view->razao_social = $dados_empresa['razao_social'];
        $this->view->rua = $dados_empresa['rua'];
        $this->view->numero = $dados_empresa['numero'];
        $this->view->complemento = $dados_empresa['complemento'];
        $this->view->bairro = $dados_empresa['bairro'];
        $this->view->telefone1 = $dados_empresa['telefone1'];
        $this->view->telefone2 = $dados_empresa['telefone2'];
        $this->view->email = $dados_empresa['email'];
        $this->view->website = $dados_empresa['website'];
        $this->_helper->viewRenderer("index");
    }

}

?>
