<?php

class Estabelecimento_ProdutoController extends Zend_Controller_Action {

    public $TipoProduto;
    public $Empresa;
    public $HorarioFuncionamento;
    public $errorMessage;
    public $caminho;
    public $session;
    public $db;
    public $empresaId; //empresa que o usuario logado que instanciou esta classe pertence

    public function init() {
        $this->_helper->layout()->setLayout('header');
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->session = new Zend_Session_Namespace('estabelecimento');
        if (isset($this->session->user)) {
            $this->empresaId = $this->session->user->empresa;
        }

        $this->Produto = new DbTable_Produto($this->db);
        $this->FotoProduto = new DbTable_FotoProduto($this->db);
        $this->CategoriaPermitidaComoAdicional = new DbTable_CategoriaPermitidaComoAdicional($this->db);
        $this->TamanhoProduto = new DbTable_TamanhoProduto($this->db);
        $this->Promocao = new DbTable_Promocao($this->db);
        $this->TipoProduto = new DbTable_TipoProduto();
        $this->TiposProdutosEmpresa = new DbTable_TiposProdutosEmpresa($this->db);
        $this->CategoriaEmpresa = new DbTable_CategoriaEmpresa();
        $this->CategoriaIngredienteEmpresa = new DbTable_CategoriaIngredienteEmpresa($this->db);
        $this->ItensDeUmLanche = new DbTable_ItensDeUmLanche($this->db);
        //$this->IngredienteEmpresa = new DbTable_IngredienteEmpresa($this->db);
        $this->Ingrediente = new DbTable_Ingrediente($this->db);
        $this->view->pageTitle = 'Produto';
        $this->caminho = $this->getRequest()->getModuleName() . "/" . $this->getRequest()->getControllerName();
    }

    public function errorAction() {
        $formId = $this->getRequest()->getPost('emorFrom');

        $this->editAction();
        //Este switch é para tentar recuperar os formularios com o ultimo dado que o usuario inseriu antes do erro
        switch ($formId) {
            case 1:
                $this->view->formData = $this->getRequest()->getPost();
                break;
            case 5:
                $this->view->formData5 = $this->getRequest()->getPost();
                break;
            case 7:
                $this->view->formData7 = $this->getRequest()->getPost();
                break;
        }

        $this->_helper->viewRenderer('index');
    }

    public function indexAction() {

        $this->view->produtoId = '';
        $this->view->empresaId = $this->empresaId;
        $this->view->ingredienteEmpresaRec = $this->Ingrediente->getIngredientOptionDropDown();
        $this->view->CategoriaEmpresaRec = $this->CategoriaEmpresa->getRecords($this->empresaId);
        $this->view->cod_tipo_produto = $this->TiposProdutosEmpresa->getCodTipoProductoDropDown($this->empresaId);
        $this->_helper->viewRenderer('index');
    }

    public function autocompleteAction() {
       
        if (isset($_GET['term'])) {
            $term = $_GET['term'];
            $get_ingredients_arr = $this->Ingrediente->getSearchIngredients($term);
        }

        $return_arr = array();
        if (!empty($get_ingredients_arr)) {
            $i = 0;
            foreach ($get_ingredients_arr as $arr) {

                $return_arr[$i]['label'] = $arr['nome'];
                $return_arr[$i]['value'] = $arr['nome'];
                $return_arr[$i]['id'] = $arr['cod_ingrediente'];
                $i++;
            }
        }

        echo json_encode($return_arr);
        die;
    }

    public function addAction() {

        $formData = $this->getRequest()->getPost();
        $produtoId = $formData['produtoId'];


        if ($formData['emorFrom'] == 1) { //formulario principal de produto

            if (!empty($produtoId)) { //alteracao de um produto
                try {
                    $this->Produto->edit($formData, $this->empresaId, $produtoId);
                    //insere tambem no lucene
                    LuceneManager::criaDocumentoProduto($this->empresaId, $produtoId, $formData);
                } catch (Exception $e) {
                    $this->view->headline = "Problema ao editar registro. " . $e->getMessage();
                    $this->errorAction();
                    return;
                }
                $this->editAction($produtoId);
                //$this->view->action = 'edit';
                //$this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$id");
            } else { //insercao de um produto novo
                try {
                    $produtoId = $this->Produto->add($formData, $this->empresaId);
                    $this->TamanhoProduto->add($formData, $produtoId);
                    //insere tambem no lucene
                    LuceneManager::criaDocumentoProduto($this->empresaId, $produtoId, $formData);
                } catch (Exception $e) {
                    $this->view->headline = "Problema ao inserir registro. " . $e->getMessage();
                    $this->_forward("index");
                    return;
                }
                $this->view->produtoId = $produtoId;
                $this->editAction($produtoId);
                //$this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$id");
            }
        }
        if ($formData['emorFrom'] == 2) { //formulario de imagens do produto
            if (!empty($produtoId)) {
                if (!empty($_FILES['userfile']['name'])) {
                    try {
                        $fileName = $this->do_upload();
                    } catch (Exception $e) {
                        $this->view->headline = "Problema ao fazer upload da imagem. " . $e->getMessage();
                        $this->errorAction();
                        return;
                    }
                }

                try {
                    $this->db->beginTransaction();
                    $this->FotoProduto->add($formData, $fileName, $produtoId);
                    $this->db->commit();
                } catch (Exception $e) {
                    $this->db->rollBack();

                    $this->view->headline = "Erro ao inserir imagem. " . $e->getMessage();
                    $this->errorAction();
                    return;
                }
                $this->editAction($produtoId);
            } else {
                $this->view->headline = "Por favor, selecione um produto primeiro.";
                return $this->indexAction();
            }
        }
        if ($formData['emorFrom'] == 3) { //formulario de categorias permitidas como adicional para um produto
            if (!empty($produtoId)) {
                try {
                    $this->db->beginTransaction();
                    $this->CategoriaPermitidaComoAdicional->add($formData, $produtoId);
                    $this->db->commit();
                } catch (Exception $e) {
                    $this->db->rollBack();
                    $this->view->headline = "Erro ao inserir registro. " . $e->getMessage();
                    $this->errorAction();
                    return;
                }
                $this->editAction($produtoId);
            } else {
                $this->view->headline = "Por favor, selecione um produto primeiro.";
                return $this->indexAction();
            }
        }
        if ($formData['emorFrom'] == 4) { //ingredientes
            //echo "<pre>";print_r($_POST); die;
            

            if (!empty($produtoId)) {
                try {
                 
                    $this->db->beginTransaction();
                  
                    $this->ItensDeUmLanche->add($formData, $produtoId, $this->empresaId);
                   //    $this->ItensDeUmLanche->add($formData, $produtoId, '4');
                   
                    $this->db->commit();
                } catch (Exception $e) {
                    $this->db->rollBack();
                    $this->view->headline = "Erro ao inserir registro. " . $e->getMessage();
                    $this->errorAction();
                    return;
                }
                $this->editAction($produtoId);
            } else {
                $this->view->headline = "Por favor, selecione um produto primeiro.";
                return $this->indexAction();
            }
        }
        if ($formData['emorFrom'] == 5) {  //tamanho dos produtos
            // $promocaoId = $this->_getParam('promocaoId', '');
            $tamanhoId = $formData['tamanhoId'];
            if (!empty($produtoId)) {
                //Esse metodo trata se devera ser feita uma edicao ou uma insercao.
                //Se no combobox de tamanhos foi selecionado algum tamanho para edicao entao
                //o javascript acionado setou um valor para o campo hidden tamanhoId
                try {
                    $tamanhoId = $this->TamanhoProduto->add($formData, $produtoId);
                } catch (Exception $e) {
                    $this->view->headline = "Erro ao inserir registro. " . $e->getMessage();
                    $this->errorAction();
                    return;
                }
                /* if (empty($formData['act2'])) //javascript  savePromocao seta o campo hidden act2 com o valor 'editPromocao'
                  {
                  //se o javascript nao foi executado foi o botao salvar do formulario de tamanho
                  //e significa que é para inserir um tamanho
                  $tamanhoId = $this->TamanhoProduto->add($formData, $produtoId);
                  } */
                /*  if (!empty($promocaoId))  //javascript savePromocao seta esse campo hidden
                  {
                  $this->Promocao->edit($formData['val'][$promocaoId], $promocaoId, $produtoId);
                  } else
                  {
                  if (!empty($tamanhoId)) //nesse caso promocaoId esta vazio
                  {
                  $this->Promocao->add($formData, $produtoId, $tamanhoId);
                  }
                  } */
                if (!empty($tamanhoId)) {
                    $this->editAction($produtoId, $tamanhoId);
                } else {
                    $this->editAction($produtoId);
                }
            } else {
                $this->view->headline = "Por favor, selecione um produto primeiro.";
                return $this->indexAction();
            }
        }

        //promocao
        if ($formData['emorFrom'] == 6 || $formData['emorFrom'] == 7) {
            if (!empty($produtoId)) {
                $tamanhoId = $formData['tamanhoId'];

                if (!empty($tamanhoId)) {
                    $promocaoId = $formData['promocaoId'];

                    if (!empty($promocaoId)) { //eh uma edicao
                        try {
                            if ($this->Promocao->isPromocaoSobreposta($tamanhoId, $formData['data_inicio'], $formData['data_fim'])) {
                                $this->view->headline = " Já existe outra promoção válida ativa. ";
                                $this->errorAction();
                                return;
                            }
                            $this->Promocao->edit($formData['val'][$promocaoId], $promocaoId, $produtoId);
                        } catch (Exception $e) {
                            $this->view->headline = "Erro ao alterar registro. " . $e->getMessage();
                            $this->errorAction();
                            return;
                        }
                    } else {
                        try {
                            if ($this->Promocao->isPromocaoSobreposta($tamanhoId, $formData['data_inicio'], $formData['data_fim'])) {
                                $this->view->headline = " Já existe outra promoção válida ativa. ";
                                $this->errorAction();
                                return;
                            }

                            $this->Promocao->add($formData, $produtoId, $tamanhoId);
                        } catch (Exception $e) {
                            $this->view->headline = "Erro ao inserir registro. " . $e->getMessage();
                            $this->errorAction();
                            return;
                        }
                    }
                    $this->editAction($produtoId, $tamanhoId);
                } else {
                    $this->view->headline = "Por favor, selecione um tamanho de produto primeiro.";
                    $this->editAction($produtoId, $tamanhoId);
                }
            } else {
                $this->view->headline = "Por favor, selecione um produto primeiro.";
                return $this->indexAction();
            }
        }

        $this->Produto->calculaValorCalorico($produtoId);
    }

    private function calculaValorCalorico($produtoId) {
        
    }

    public function editAction($produtoId = '', $tamanhoId = '') {

        if (empty($produtoId))
            $produtoId = $this->getRequest()->getPost('produtoId');

        if (empty($tamanhoId))
            $tamanhoId = $this->getRequest()->getPost('tamanhoId');

        //Trata as abas Produto, Imagens, Categorias Permitidas como Adicional e Ingredientes
        if (!empty($produtoId)) {
            $this->view->produtoId = $produtoId;
            $this->view->formData = $this->Produto->getSingleData($produtoId);
            $this->view->formData2 = $this->FotoProduto->getRecords($produtoId);
            $b = $this->CategoriaPermitidaComoAdicional->getRecords($produtoId);
            $formData3 = "";
            foreach ($b as $k => $v) {
                $formData3[$v['cod_categoria_empresa']] = $v;
            }
            $this->view->formData3 = $formData3;
            $b = $this->ItensDeUmLanche->getRecordsProduto($this->empresaId, $produtoId);
            $formData4 = "";

            foreach ($b as $k => $v) {
                $formData4[$v['cod_ingrediente']] = $v;
            }
            $this->view->formData4 = $formData4;

            $this->view->tamanhoDropDown = $this->TamanhoProduto->getDropDown($produtoId);
            //$this->view->totalPrco = $this->ItensDeUmLanche->getPreco($produtoId);
            $this->view->totalCalorias = $this->ItensDeUmLanche->getCalorias($produtoId);
        }

        //Trata a aba Tamanhos
        if (!empty($tamanhoId)) {
            $this->view->tamanhoId = $tamanhoId;
            $this->view->formData5 = $this->TamanhoProduto->getRecords($tamanhoId);
            $formData6 = $this->Promocao->getRecords($tamanhoId);


            foreach ($formData6 as $k => $v) {
                if (!empty($v['data_inicio'])) {
                    $v['data_inicio'] = str_replace('00:00:00', '', $v['data_inicio']);
                    $v['data_inicio'] = trim($v['data_inicio']);
                    list($year, $month, $day) = explode('-', $v['data_inicio']);
                    $date = "$day/$month/$year";
                    $formData6[$k]['data_inicio'] = $date;
                }
                if (!empty($v['data_fim'])) {
                    $v['data_fim'] = str_replace('00:00:00', '', $v['data_fim']);
                    $v['data_fim'] = trim($v['data_fim']);
                    list($year, $month, $day) = explode('-', $v['data_fim']);
                    $date = "$day/$month/$year";
                    $formData6[$k]['data_fim'] = $date;
                }
            }
            $this->view->formData6 = $formData6;
        } else {
            $formData6 = '';
        }

        $this->view->CategoriaEmpresaRec = $this->CategoriaEmpresa->getRecords($this->empresaId);
        $this->view->ingredienteEmpresaRec = $this->Ingrediente->getIngredientOptionDropDown();
        $cod_tipo_produto = $this->TiposProdutosEmpresa->getCodTipoProductoDropDown($this->empresaId);
        $this->view->cod_tipo_produto = $cod_tipo_produto;
        $this->view->title = 'Produto';
        // $this->view->action = 'edit';
        $this->view->empresaId = $this->empresaId;
        $this->_helper->viewRenderer('index');
    }

    public function do_upload() {
        $adapter = new Zend_File_Transfer_Adapter_Http();
        //$adapter->setDestination('logo');
        $adapter->addValidator('Extension', false, 'jpg,png,jpeg,gif,xps');
        $adapter->addValidator('Size', false, 2000000);
        if (!$adapter->receive()) {
            $messages = $adapter->getMessages();
            throw new Exception(implode("\n", $messages));
            return;

            //$messages = $adapter->getMessages();
            //$this->_helper->viewRenderer('index');
            //$this->errorMessage = implode("\n", $messages);
            //return false;
        } else {
            $file = $adapter->getFileInfo();
            $name = $file['userfile']['name'];
            $d = file_get_contents($file['userfile']['tmp_name']);
            unlink($file['userfile']['tmp_name']);
            return $d;
        }
    }

    public function deleteAction() {
        $produtoId = $this->getRequest()->getPost('produtoId');
        try {
            $this->Produto->deleteRecords($produtoId);
        } catch (Exception $e) {
            $this->editAction();
            return;
        }
        $this->_helper->redirector->gotoUrl($this->caminho . "/gridView");
    }

    public function gridviewAction() {
        $record = $this->Produto->getRecords($this->empresaId);
        $page = $this->_getParam('page', 1);
        $paginator = Zend_Paginator::factory($record);
        $paginator->setItemCountPerPage(20);
        $paginator->setCurrentPageNumber($page);
        $this->view->paginator = $paginator;
    }

    public function deleteTamanhosAction() {
        $produtoId = $this->getRequest()->getPost("produtoId");
        $tamanhoId = $this->getRequest()->getPost("tamanhoId");
        try {
            $this->db->beginTransaction();
            $this->TamanhoProduto->deleteRecords($tamanhoId);
            $this->db->commit();
        } catch (Exception $e) {
            $this->db->rollBack();
            $this->view->headline = "Erro na remoção de tamanho. " . $e->getMessage();
            $this->errorAction();
            return;
        }

        $this->editAction($produtoId);
    }

    public function deletePromocaoAction() {
        $promocaoId = $this->getRequest()->getPost("promocaoId");
        $produtoId = $this->getRequest()->getPost("produtoId");
        $tamanhoId = $this->getRequest()->getPost("tamanhoId");
        try {
            $this->Promocao->deleteRecords($promocaoId);
            $this->editAction($produtoId, $tamanhoId);
        } catch (Exception $e) {
            $this->view->headline = "Erro na remoção da promoção. " . $e->getMessage();
            $this->errorAction();
        }
    }

    public function getImageAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        $id = $this->_getParam('id', '');
        $image = $this->FotoProduto->getImageData($id);
        header('Content-type: image/jpeg/png/gif/jpg');
        echo base64_decode($image);
    }

    public function ajaxPedidoIngredienteAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $novo_ingrediente = $this->_getParam('sugestao_ingrediente');

        if (!empty($novo_ingrediente)) {
            $config = array('auth' => 'login',
                'username' => 'suporte@buscacomabem.com.br',
                'password' => 'inglaterra2012');
            $tr = new Zend_Mail_Transport_Smtp('localhost', $config);
            Zend_Mail::setDefaultTransport($tr);
            //envia email informando
            $mail = new Zend_Mail();
            $mail->setBodyText('Pedido de novo ingrediente: ' . $novo_ingrediente);
            $mail->setFrom('suporte@buscacomabem.com.br');
            $mail->addTo("suporte@buscacomabem.com.br");
            $mail->setSubject('Pedido de novo ingrediente');

            //TODO facapedido - Se o email nor for enviado o que fazer?
            if ($mail->send($tr)) {
                echo "1"; //flag que sera utilizada no javascript para imprimir msg ao usuario
            }
        }

        exit;
    }

}

?>
