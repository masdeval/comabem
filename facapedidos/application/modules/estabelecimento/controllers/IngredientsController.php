<?php
  class Estabelecimento_IngredientsController extends Zend_Controller_Action
  {
      public $TbCidade;
      public $TipoProduto;
      public $Empresa;
      public $TiposProdutosEmpresa;
      public $HorarioFuncionamento;
      public $Ingrediente;
      public $CategoriaIngrediente;
      public $IngredienteEmpresa;
      public $errorMessage;
      public $empresaId;
      public $caminho;

      public function init()
      {
          $this->_helper->layout()->setLayout('tela_cadastro_layout');
          $session = new Zend_Session_Namespace('default');
          $this->Empresa = new DbTable_Empresa();
          $this->TbCidade = new DbTable_TbCidade();
          $this->TipoProduto = new DbTable_TipoProduto();
          $this->TiposProdutosEmpresa = new DbTable_TiposProdutosEmpresa();
          $this->HorarioFuncionamento = new DbTable_HorarioFuncionamento();
          $this->Ingrediente = new DbTable_Ingrediente();
          $this->CategoriaIngrediente = new DbTable_CategoriaIngrediente();
          $this->CategoriaIngredienteEmpresa = new DbTable_CategoriaIngredienteEmpresa();
          $this->IngredienteEmpresa = new DbTable_IngredienteEmpresa();
          $this->ItensDeUmLanche = new DbTable_ItensDeUmLanche();
          $this->view->pageTitle='Ingredients';
          if(isset($session->user)){
            $this->empresaId=$session->user->empresa;
          }
          $this->view->empresaId=$this->empresaId;
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
          $ingredienteOption = $this->Ingrediente->getIngredientOptionDropDown();
          $this->view->ingredienteOption = $ingredienteOption;
          $categoriaIngredienteRec = $this->CategoriaIngrediente->getRecords();
          $this->view->categoriaIngredienteRec = $categoriaIngredienteRec ;
          $categoriaIngredienteOption = $this->CategoriaIngrediente->getOptionDropDown();
          $this->view->categoriaIngredienteOption = $categoriaIngredienteOption ;
          $ingredienteEmpresaRec = $this->IngredienteEmpresa->getRecords($this->empresaId);
          $this->view->ingredienteEmpresa = $ingredienteEmpresaRec ;
          $this->view->headline = $message;
      }
      public function addAction()
      {
           $this->_helper->layout->disableLayout();
          $this->_helper->viewRenderer->setNoRender(true);
          $error=false;
          $formData = $this->getRequest()->getPost();

          if ($formData['emorFrom'] == 1) {
                  if (!empty($_FILES['userfile']['name'])) {
                      $file = $this->do_upload();
                      if(!empty($this->errorMessage)){
                          $error=true;
                      }
                      else{
                      $fileName = $file;
                      }
                  }
                  if(!$error){
                  if ($formData['action'] == 'edit') {
                      $empresaId = $this->empresaId;
                      $ingredienteId = $formData['ingredienteId'];
                      $this->CategoriaIngredienteEmpresa->updateRecord($formData,$ingredienteId,$empresaId);
                      $this->IngredienteEmpresa->editRecord($formData, $ingredienteId,$empresaId, $fileName);
                      $this->_helper->redirector->gotoUrl($this->caminho . "/edit/ingrediente/$ingredienteId");
                  } else {
                      $empresaId = $this->empresaId;
                      $ingredienteId = $formData['cod_ingrediente'];
                      if(!$this->IngredienteEmpresa->checkDuplicateRec($empresaId,$ingredienteId)){
                       $this->_helper->redirector->gotoUrl($this->caminho . "/edit/ingrediente/$ingredienteId/msg/2");
                       exit;
                      }
                      $this->view->ingredienteId = $ingredienteId;
                      $this->IngredienteEmpresa->addRecord($formData, $ingredienteId,$empresaId, $fileName);
                      $this->CategoriaIngredienteEmpresa->updateRecord($formData,$ingredienteId,$empresaId);
                      $this->_helper->redirector->gotoUrl($this->caminho . "/edit/ingrediente/$ingredienteId");
                  }
              } else {
                  $ingredienteOption = $this->Ingrediente->getIngredientOptionDropDown();
                  $this->view->ingredienteOption = $ingredienteOption;
                  $categoriaIngredienteRec = $this->CategoriaIngrediente->getRecords();
                  $this->view->categoriaIngredienteRec = $categoriaIngredienteRec ;
                  $categoriaIngredienteOption = $this->CategoriaIngrediente->getOptionDropDown();
                  $this->view->categoriaIngredienteOption = $categoriaIngredienteOption ;
                  $ingredienteEmpresaRec = $this->IngredienteEmpresa->getRecords();
                  $this->view->ingredienteEmpresa = $ingredienteEmpresaRec ;
                  $this->view->headline = $this->errorMessage;
                  $this->_helper->viewRenderer('index');
              }
          }
          if ($formData['emorFrom'] == 2) {
              $empresaId = $this->empresaId;
              $ingredienteId =  $formData['ingredienteId'];

              if (!empty($empresaId)) {
                      $id = $this->CategoriaIngredienteEmpresa->associarCategoria($formData,$empresaId);
                     $this->_helper->redirector->gotoUrl($this->caminho . "/edit/ingrediente/$ingredienteId");
              } else {
                   //$this->_helper->redirector->gotoUrl('empresa/index/msg/1');
              }
          }

      }
      public function editAction()
      {
          $empresaId = $this->empresaId;
          $ingredienteId = $this->_getParam('ingrediente', '');
          $msg = $this->_getParam('msg', '');
          $m[1] = 'Record can not be deeted';
          $m[2] = 'Record already exist , please edit it';
          if (!empty($empresaId) && !empty($ingredienteId)) {
              $this->view->ingredienteId= $ingredienteId;
          }
          if (!empty($empresaId)) {
              $formData = $this->IngredienteEmpresa->getSingleData($ingredienteId,$empresaId);
              $formData2 = $this->CategoriaIngredienteEmpresa->getRecords($ingredienteId,$empresaId);
              $categoriaIngredienteEmpresa = $this->CategoriaIngredienteEmpresa->getRecords($ingredienteId,$empresaId);
              $this->view->formData = $formData;
              $this->view->formData2 = $formData2;
              $this->view->categoriaIngredienteEmpresa = $categoriaIngredienteEmpresa;
          }
           $ingredienteOption = $this->Ingrediente->getIngredientOptionDropDown();
           $this->view->ingredienteOption = $ingredienteOption;
           $categoriaIngredienteRec = $this->CategoriaIngrediente->getRecords();
           $this->view->categoriaIngredienteRec = $categoriaIngredienteRec ;
           $categoriaIngredienteOption = $this->CategoriaIngrediente->getOptionDropDown();
           $this->view->categoriaIngredienteOption = $categoriaIngredienteOption ;
           $ingredienteEmpresaRec = $this->IngredienteEmpresa->getRecords($this->empresaId);
           $this->view->ingredienteEmpresa = $ingredienteEmpresaRec ;
           $this->view->title = 'Empresa';
           $this->view->headline = $m[$msg];
           $this->view->action = 'edit';
           $this->view->empresaId = $empresaId;
           $this->_helper->viewRenderer('index');
      }
      public function do_upload()
      {
          $adapter = new Zend_File_Transfer_Adapter_Http();
          $adapter->setDestination('logo');
          $adapter->addValidator('Extension', false, 'jpg,png,jpeg,gif,xps');
          $adapter->addValidator('Size', false, 2000000);
          if (!$adapter->receive()) {
              $messages = $adapter->getMessages();
              $this->_helper->viewRenderer('index');
              $this->errorMessage = implode("\n", $messages);
              return false;
          } else {
              $file = $adapter->getFileInfo();
              $name = $file['userfile']['name'];
              $d=file_get_contents($file['userfile']['tmp_name']);
              unlink($file['userfile']['tmp_name']);
              return $d;
          }
      }
      public function deleteAction()
      {
          $empresaId = $this->empresaId;
          $ingredienteId= $formData['ingredienteId']? $formData['ingredienteId']:$this->_getParam('id','');;
          $r=$this->ItensDeUmLanche->getRecords($empresaId,$ingredienteId);
          if(!empty($r)){
              $this->_helper->redirector->gotoUrl($this->caminho . "/edit/ingrediente/$ingredienteId/msg/1");

          }
          else{
          $this->IngredienteEmpresa->deleteRecords($empresaId,$ingredienteId);
          $this->_helper->redirector->gotoUrl($this->caminho . "/gridView");
          }
      }
      public function gridviewAction()
      {
          $record = $this->IngredienteEmpresa->getRecords($this->empresaId);
          $page=$this->_getParam('page',1);
          $paginator = Zend_Paginator::factory($record);
          $paginator->setItemCountPerPage(2);
          $paginator->setCurrentPageNumber($page);
          $this->view->paginator=$paginator;
      }

      public function getImageAction(){
          $this->_helper->layout->disableLayout();
          $this->_helper->viewRenderer->setNoRender(true);
          $empresaId = $this->_getParam('empresa', '');
          $ingredienteId = $this->_getParam('ingrediente', '');
          $image=$this->IngredienteEmpresa->getImageData($ingredienteId,$empresaId);
          header('Content-type: image/jpeg/png/gif/jpg');
          echo base64_decode($image);

      }

        public function categriaAction($ingredienteId,$cod_tipo_ingrediente)
      {
          $ingredienteId= $this->_getParam('ing','');
          $cod_tipo_ingrediente= $this->_getParam('tipoing','');
          $ingredienteEmpresaRec = $this->IngredienteEmpresa->getRecords($this->empresaId);
          $categoriaIngredienteEmpresaAssocair = $this->CategoriaIngredienteEmpresa->getRecordsAssocair($ingredienteId,$this->empresaId,$cod_tipo_ingrediente);
          $i=0;
          foreach($ingredienteEmpresaRec as $k=>$v) {
              if(in_array($v[cod_ingrediente],$categoriaIngredienteEmpresaAssocair)){
                  $checked='checked';
              }else{
                  $checked='';
              }
            $resp.="<td> <input type='checkbox' name='cod_ingrediente[]' value='$v[cod_ingrediente]' $checked> $v[nome]   </td>";
            if($i>=4){
                $resp.='</tr><tr>';
                $i=0;
              }
             $i++;
          }
          echo $resp;
          exit;

      }
  }
?>