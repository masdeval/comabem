<?php

class Portal_IndexController extends Zend_Controller_Action {

    public $TipoProdutoDB;
    public $ProdutoDB;
    public $FotoProdutoDB;
    public $EmpresaDB;
    public $ConsultaDB;
    private $session;
    private $descricaoTipoProdutos;
    //private $geolocation;

    public function init() {
        
        
        /* Initialize action controller here */
        $this->session = new Zend_Session_Namespace('compra');
        $this->_helper->layout()->disableLayout();
        $this->CidadeDB = new DbTable_TbCidade();
        $this->TipoProdutoDB = new DbTable_TipoProduto();
        $this->FotoProdutoDB = new DbTable_FotoProduto(Zend_Db_Table::getDefaultAdapter());
        $this->ProdutoDB = new DbTable_Produto(Zend_Db_Table::getDefaultAdapter());
        $this->EmpresaDB = new DbTable_Empresa(Zend_Db_Table::getDefaultAdapter());
        $this->ConsultaDB = new DbTable_Consulta(Zend_Db_Table::getDefaultAdapter());
        //$this->geolocation = new IP2Location_DatabaseGeo(APPLICATION_PATH . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'library' . DIRECTORY_SEPARATOR . 'IP2Location' . DIRECTORY_SEPARATOR . 'databases' . DIRECTORY_SEPARATOR . 'IP2LOCATION-LITE-DB1.BIN', IP2Location_DatabaseGeo::FILE_IO);

        $this->descricaoTipoProdutos = $this->TipoProdutoDB->getCodTipoProductoDropDown();
        
        if (isset($this->session->cliente)) {
            $this->view->nomeCliente = $this->session->cliente->getNomeExibicao();
        }
        $this->view->pesquisa_facapedido_empresa_oferece = array();
    }

    public function indexAction() {
        $this->view->cod_tipo_produto = $this->TipoProdutoDB->getCodTipoProductoDropDown();
        $this->view->pesquisa_facapedido_empresa_oferece = array();
        $this->view->cidade = $this->CidadeDB->getCitiesAvaiable();
        
    }

    public function consultaAction() {
        $criterios = $this->getRequest()->getPost('criterio');
        $tipos_produto = $this->getRequest()->getPost('cod_tipo_produto');
        $caloria = $this->getRequest()->getPost('caloria');
        $empresa_oferece = $this->getRequest()->getPost('empresa_oferece');
        if (!$empresa_oferece) {
            $empresa_oferece = array();
        }
        $produtos = "";

        //grava a consulta no banco 
        $latitude = $this->getRequest()->getPost('latitude');
        $longitude = $this->getRequest()->getPost('longitude');
        $cidade = $this->getRequest()->getPost('cod_cidade');
        
        $this->gravaLogConsulta($criterios,$tipos_produto,$caloria,$empresa_oferece,$latitude,$longitude,$cidade);

        //echo "<pre>"; print_r($_POST); die;
        //
 	//primeiro busca com o lucene
        if (!empty($criterios)) {
            $hits = LuceneManager::search($criterios);
            //obtem a lista de empresas em ordem crescente de relevancia e insere os ids em uma string
            //para fazer select no banco
            
            $produtos = '';
            foreach ($hits as $hit) {
                //Quero selecionar apenas uma vez uma determinada empresa no filtro da primeira pagina
                
                    $produtos .= $hit->cod_produto . ", ";
                
            }
            $produtos .= "-1"; //so porque fica uma virgula no final
        }

        $resultado = $this->ProdutoDB->consultaQBE($produtos, $caloria, $tipos_produto, $empresa_oferece,$cidade);

        if (!empty($resultado) && sizeof($resultado) > 0) {


            //insere em resultado a situacao do estabelecimento informando se o mesmo
            //esta aberto ou fechado
            $empresa_ja_apresentada = array();
            $novo_resultado = array();
            $j = 0;

            for ($i = 0; $i < sizeof($resultado); $i++) {


                //if (array_key_exists($resultado[$i]['cod_empresa'], $empresa_ja_apresentada)) {
                //continue;
                // } else {


                date_default_timezone_set($resultado[$i]['timezone']); //seta a timezone do estabelecimento para que volte a hora correta de acordo com o fuso-horario local
                //date_default_timezone_set('asia/kolkata');
                $hora_atual = date('H') . ":" . date('i') . ":00";

                //quero apresentar empresas apenas uma vez
                $empresa_ja_apresentada[$resultado[$i]['cod_empresa']] = $resultado[$i]['cod_empresa'];
                $resultado[$i]['isAberto'] = $this->EmpresaDB->isAberto($resultado[$i]['cod_empresa'], date('l'), $hora_atual);
                $novo_resultado[$j] = $resultado[$i];
                $j++;
                // }
                //echo "<pre>";print_r($resultado); die;
            }

            $this->view->resultado = $novo_resultado;
            //echo "<pre>"; print_r($novo_resultado); die;
        } else {
            $this->view->headline = "Nenhum resultado encontrado.";
        }

        $this->view->cod_tipo_produto = $this->TipoProdutoDB->getCodTipoProductoDropDown();
        $this->view->pesquisa_facapedido_criterio = $criterios;
        $this->view->pesquisa_facapedido_tipo_produto = $tipos_produto;
        $this->view->pesquisa_facapedido_caloria = $caloria;
        $this->view->pesquisa_facapedido_empresa_oferece = $empresa_oferece;
        $this->view->cidade = $this->CidadeDB->getCitiesAvaiable();
        $this->view->cod_cidade = $cidade;        
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

    public function lojaFechadaAction() {
        $cod_empresa = $this->_getParam('codEmpresa', '');


        date_default_timezone_set($this->EmpresaDB->getTimezone($cod_empresa)); //seta a timezone do estabelecimento para que volte a hora correta de acordo com o fuso-horario local

        $empresa = $this->EmpresaDB->getSingleData($cod_empresa);
        $email = $empresa['email'];
        $data = date('d') . "/" . date('m') . "/" . date('Y'); //ano com 4 digitos
        $hora_atual = date('H:i:s');

        $config = array('auth' => 'login',
            'username' => 'suporte@buscacomabem.com.br',
            'password' => 'inglaterra2012');
        $tr = new Zend_Mail_Transport_Smtp('localhost', $config);
        Zend_Mail::setDefaultTransport($tr);
        //envia email 
        $mail = new Zend_Mail();
        $mail->setBodyText('No dia ' . $data . ' foi solicitado que voce estivesse aberto na hora ' . $hora_atual);
        $mail->setFrom('suporte@buscacomabem.com.br');
        $mail->addTo($email);
        $mail->setSubject('Pedido de que voce estivesse aberto');

        try {

            if ($mail->send($tr)) {
                echo "1"; //flag que sera utilizada no javascript para imprimir msg ao usuario
            } else {
                echo "Fail";
            }
        } catch (Exception $ex) {
            echo 'Fail';
        }


        //$status = $this->RecadoClienteDB->registraSolicitacaoLojaAberta($cod_empresa, $data, $hora_atual);
        //echo $status;
        exit;
    }

    public function limparCarrinhoAction() {
        
        if (isset($this->session)) {
            $this->session->__unset("carrinho");
            $this->session->__unset("configuracoesPedido");
        }
        $this->view->cod_tipo_produto = $this->TipoProdutoDB->getCodTipoProductoDropDown();
        $this->view->pesquisa_facapedido_empresa_oferece = array();
        $this->view->cidade = $this->CidadeDB->getCitiesAvaiable();
        $this->view->cod_cidade = $this->getRequest()->getPost('cod_cidade');
        $this->_helper->viewRenderer("index");
    }

    private function gravaLogConsulta($criterios,$tipos_produto,$caloria,$empresa_oferece,$latitude,$longitude,$cidade)
    {
        try{
        if (!empty($criterios) || !empty($tipos_produto) || !empty($caloria) || !empty($empresa_oferece)) {
            
            $ip = $_SERVER['REMOTE_ADDR'];
            //GEO $cidade = substr($this->geolocation->lookup($ip, IP2Location_DatabaseGeo::CITY_NAME),0,29);
            $pais = "BR";//GEO substr($this->geolocation->lookup($ip, IP2Location_DatabaseGeo::COUNTRY_NAME),0,19);
            
            $descricao_tipo_produto = "";
            if(!empty($tipos_produto))
            {
                foreach($tipos_produto as $p)
                {                    
                    $descricao_tipo_produto .= $this->descricaoTipoProdutos[$p]." ";
                }
            }
            $produtosEspeciais='';
            if(!empty($empresa_oferece))
            {
                foreach($empresa_oferece as $e)
                {
                    $produtosEspeciais .= $e." ";
                }
            }
            
            $this->ConsultaDB->addConsulta($ip, $pais, $cidade, $criterios, $descricao_tipo_produto,$caloria,$produtosEspeciais,$latitude,$longitude);
        }
        }catch(Exception $e)
        {
          //throw new Exception($e)  
          //TODO Log the error   
        }
    }
    
    
}
