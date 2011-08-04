<?php

  class Estabelecimento_ProdutoController extends Zend_Controller_Action
  {
      public $TipoProduto;
      public $Empresa;
      public $HorarioFuncionamento;
      public $errorMessage;
      public $caminho;
   
      public function init()
      {
          $this->_helper->layout()->setLayout('tela_cadastro_layout');
          $session = new Zend_Session_Namespace('default');
          $this->Produto = new DbTable_Produto();
          $this->FotoProduto = new DbTable_FotoProduto();
          $this->CategoriaPermitidaComoAdicional = new DbTable_CategoriaPermitidaComoAdicional();
          $this->TamanhoProduto = new DbTable_TamanhoProduto();
          $this->Promocao = new DbTable_Promocao();
          $this->TipoProduto = new DbTable_TipoProduto();
          $this->TiposProdutosEmpresa = new DbTable_TiposProdutosEmpresa();
          $this->Ingrediente = new DbTable_Ingrediente();
          $this->CategoriaIngrediente = new DbTable_CategoriaIngrediente();
          $this->CategoriaIngredienteEmpresa = new DbTable_CategoriaIngredienteEmpresa();
          $this->IngredienteEmpresa = new DbTable_IngredienteEmpresa();
          $this->ItensDeUmLanche = new DbTable_ItensDeUmLanche();         
          $this->view->pageTitle = 'Producto';
          if(isset($session->user)){
            $this->user = $session->user;
          }
          $this->view->empresaId = $this->user->empresa;
          $this->caminho = $this->getRequest()->getModuleName()."/".$this->getRequest()->getControllerName();
      }
      public function indexAction()
      {
          $msg = $this->_getParam('msg', '');
          $m[1] = 'Please complete the form below first';
          if (!empty($msg)) {
              $message = $m[$msg];
          } else {
              $message = 'Welcome!';
          }

          $this->view->produtoId = '';
          $cod_tipo_produto = $this->TiposProdutosEmpresa->getCodTipoProductoDropDown($this->user->empresa);
          $this->view->ingredienteEmpresaRec = $this->IngredienteEmpresa->getAllRecords();
          $categoriaIngredienteRec = $this->CategoriaIngrediente->getRecords();
          $this->view->categoriaIngredienteRec = $categoriaIngredienteRec;
          $this->view->cod_tipo_produto = $cod_tipo_produto;
          $this->view->headline = $message;
      }
      public function addAction()
      {
          $error = false;
          $formData = $this->getRequest()->getPost();
          $produtoId = $formData['produtoId'];
          if ($formData['emorFrom'] == 1) {
              if ($formData['nome']) {
                  if ($formData['action'] == 'edit') {
                      $id = $formData['produtoId'];
                      $this->Produto->edit($formData, $this->user->empresa, $id);
                      $this->view->action = 'edit';
                      $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$id");
                  } else {
                      $id = $this->Produto->add($formData, $this->user->empresa);
                      $this->view->produtoId = $id;
                      $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$id");
                  }
              } else {
                  $this->_helper->redirector->gotoUrl('produto/index/msg/1');
              }
          }
          if ($formData['emorFrom'] == 2) {
              if (!empty($_FILES['userfile']['name'])) {
                  $file = $this->do_upload();
                  if (!empty($this->errorMessage)) {
                      $error = true;
                  } else {
                      $fileName = $file;
                  }
              }
              if (!$error) {

                  $this->FotoProduto->add($formData, $fileName, $produtoId);
                  $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$produtoId");
              } else {
                  $this->view->headline = $this->errorMessage;
                  $this->_helper->viewRenderer('index');
              }
          }
          if ($formData['emorFrom'] == 3) {
              if (!empty($produtoId)) {
                  $this->CategoriaPermitidaComoAdicional->add($formData, $produtoId);
                  $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$produtoId");
              } else {
                  $this->_helper->redirector->gotoUrl($this->caminho . "/index/msg/1");
              }
          }
          if ($formData['emorFrom'] == 4) {
              if (!empty($produtoId)) {
                  $this->ItensDeUmLanche->add($formData, $produtoId, $this->user->empresa);
                  $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$produtoId");
              } else {
                  $this->_helper->redirector->gotoUrl($this->caminho . "/index/msg/1");
              }
          }
          if ($formData['emorFrom'] == 5) {
             // echo '<pre>';print_r($_REQUEST);echo '</pre>';
              //exit;
              $promocaoId= $this->_getParam('promocaoId', '');
              $tamanhoId=$formData['tamanhoId'];
              //echo "<h1> var $tamanhoId </h1>";
              //exit;
              if (!empty($produtoId)) {

                  if(empty($formData['editPromocao'])){
                      $tamanhoId=$this->TamanhoProduto->add($formData, $produtoId);
                  }
                  if(!empty($promocaoId)){
                   $this->Promocao->edit($formData['val'][$promocaoId], $promocaoId,$produtoId);
                  }else{
                      if(!empty($tamanhoId)){
                         $this->Promocao->add($formData, $produtoId,$tamanhoId);
                      }

                  }
                  if(!empty($tamanhoId)){
                      $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$produtoId/tamid/$tamanhoId");

                  }else{
                    $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$produtoId");
                  }

              } else {
                  $this->_helper->redirector->gotoUrl($this->caminho . "/index/msg/1");
              }
          }

           if ($formData['emorFrom'] == 6) {
              if (!empty($produtoId)) {
                  $promocaoId= $this->_getParam('promocaoId', '');
                  if(!empty($promocaoId)){
                   $this->Promocao->edit($formData['val'][$promocaoId], $promocaoId,$produtoId);
                  }else{
                   $this->Promocao->add($formData, $produtoId);
                  }
                  $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$produtoId");
              } else {
                  $this->_helper->redirector->gotoUrl($this->caminho . "/index/msg/1");
              }
          }
      }
      public function editAction()
      {
          $id = $this->_getParam('id', '');
          $tamanhoId=$this->_getParam('tamid', '');
          if (!empty($id)) {
              $this->view->produtoId = $id;
          }
          $produtoId = $id;
          if (!empty($produtoId)) {
              $this->view->formData = $this->Produto->getSingleData($produtoId);
              $this->view->formData2 = $this->FotoProduto->getRecords($produtoId);
              $b = $this->CategoriaPermitidaComoAdicional->getRecords($produtoId);
              foreach ($b as $k => $v) {
                  $formData3[$v['cod_tipo_ingrediente']] = $v;
              }
              $this->view->formData3 = $formData3;
              $b = $this->ItensDeUmLanche->getRecordsProduto($this->user->empresa, $produtoId);
              foreach ($b as $k => $v) {
                  $formData4[$v['cod_ingrediente']] = $v;
              }
              $this->view->formData4 = $formData4;

              //echo "<h1> var $tamanhoId </h1>";
              if(!empty($tamanhoId)){
              $this->view->formData5 = $this->TamanhoProduto->getRecords($tamanhoId);

              $formData6=$this->Promocao->getRecords($tamanhoId);

              foreach($formData6 as $k=>$v){
              if(!empty($v['data_inicio'])){
                 $v['data_inicio']=str_replace('00:00:00','',$v['data_inicio']);
                 $v['data_inicio']=trim($v['data_inicio']);
                  list($year,$month,$day)=explode('-',$v['data_inicio']);
                  $date="$day/$month/$year";
                  $formData6[$k]['data_inicio']=$date;
              }
              if(!empty($v['data_fim'])){
                  $v['data_fim']=str_replace('00:00:00','',$v['data_fim']);
                 $v['data_fim']=trim($v['data_fim']);
                  list($year,$month,$day)=explode('-',$v['data_fim']);
                  $date="$day/$month/$year";
                  $formData6[$k]['data_fim']=$date;
              }
              }

              }
              else{
                $formData6='';
              }

           // echo '<pre>';print_r($formData6);echo '</pre>';
              $this->view->formData6 = $formData6;
              $this->view->tamanhoId = $tamanhoId;
              $tamanhoDropDown = $this->TamanhoProduto->getDropDown($produtoId);

              $this->view->tamanhoDropDown = $tamanhoDropDown;
              //echo '<pre>';print_r($this->view->tamanhoDropDown);echo '</pre>';
          }
          $totalPrco = $this->ItensDeUmLanche->getSum($produtoId);
          $this->view->totalPrco = $totalPrco;
          $categoriaIngredienteRec = $this->CategoriaIngrediente->getRecords();
          $this->view->categoriaIngredienteRec = $categoriaIngredienteRec;
          $this->view->ingredienteEmpresaRec = $this->IngredienteEmpresa->getAllRecords();
          $cod_tipo_produto = $this->TiposProdutosEmpresa->getCodTipoProductoDropDown($this->user->empresa);
          $this->view->cod_tipo_produto = $cod_tipo_produto;
          $this->view->cidadeOption = $cidadeOption;
          $this->view->title = 'Produto';
          $this->view->headline = 'Welcome';
          $this->view->action = 'edit';
          $this->view->empresaId = $this->user->empresa;
          $this->_helper->viewRenderer('index');
      }
      public function do_upload()
      {
          $adapter = new Zend_File_Transfer_Adapter_Http();
          $adapter->setDestination('logo');
          $adapter->addValidator('Extension', false, 'jpg,png,jpeg,gif,xps');
          $adapter->addValidator('Size', false, 200000000);
          if (!$adapter->receive()) {
              $messages = $adapter->getMessages();
              $this->_helper->viewRenderer('index');
              $this->errorMessage = implode("\n", $messages);
              return false;
          } else {
              $file = $adapter->getFileInfo();
              $name = $file['userfile']['name'];
              $d = file_get_contents($file['userfile']['tmp_name']);
              unlink($file['userfile']['tmp_name']);
              return $d;
          }
      }
      public function deleteAction()
      {
          $produtoId = $this->_getParam('id', '');
          $this->Produto->deleteRecords($produtoId);
          $this->_helper->redirector->gotoUrl($this->caminho . "/gridView");
      }
      public function gridviewAction()
      {
          $record = $this->Produto->getRecords();
          $page = $this->_getParam('page', 1);
          $paginator = Zend_Paginator::factory($record);
          $paginator->setItemCountPerPage(2);
          $paginator->setCurrentPageNumber($page);
          $this->view->paginator = $paginator;
      }
      public function deleteTamanhosAction()
      {
          $produtoId = $this->_getParam('id', '');
          $tamanhoId=$this->_getParam('tamid', '');
          $this->TamanhoProduto->deleteRecords($tamanhoId);
          $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$produtoId");
      }
       public function deletePromocaoAction()
      {
          $id = $this->_getParam('id', '');
          $produtoId= $this->_getParam('produtoId', '');
          $this->Promocao->deleteRecords($id);
          $this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$produtoId");
      }
      public function getImageAction()
      {
          $this->_helper->layout->disableLayout();
          $this->_helper->viewRenderer->setNoRender(true);
          $id = $this->_getParam('id', '');
          $image = $this->FotoProduto->getImageData($id);
          header('Content-type: image/jpeg/png/gif/jpg');
          echo base64_decode($image);
      }
  }
?>
