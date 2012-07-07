<?php

class Estabelecimento_TabelaIngredienteCompartilhadaController extends Zend_Controller_Action
{

    public $Ingrediente;

    public function init()
    {
        $this->Ingrediente = new DbTable_Ingrediente();
        $this->_helper->layout()->setLayout('tela_cadastro_layout');
    }

    public function indexAction()
    {
        $this->view->ingredientesOption = $this->Ingrediente->getIngredientOptionDropDown();
    }

    public function addAction()
    {
        $formData = $this->getRequest()->getPost();
        $ingredienteId = $formData['ingredienteId'];

        if (!empty($formData['flagRemoverImagem']))
            $fileName = "remover";

        if (!empty($ingredienteId)) //eh uma edicao
        {

            if (!empty($_FILES['userfile']['name']))
            {

                // try
                {
                    $fileName = $this->do_upload();
                }// catch (Exception $e)
                {
                    // $this->view->headline = "Problema ao fazer upload da imagem. " . $e->getMessage();
                    // $this->errorAction();
                    // return;
                }
            }

            // try
            {
                //   $this->db->beginTransaction();
                 $this->Ingrediente->editRecord($formData, $ingredienteId, $fileName);
                //   $this->db->commit();
            } //catch (Exception $e)
            {
                /*    $this->db->rollBack();
                  $this->view->headline = "Problema ao editar registro. " . $e->getMessage();
                  $this->errorAction();
                  return; */
            }
            //   $this->editAction($ingredienteId);
        } else //eh uma insercao
        {
            if (!empty($_FILES['userfile']['name']))
            {
                $fileName = $this->do_upload();
            }

            //try
            {
                $this->Ingrediente->addRecord($formData, $fileName);
                // $this->db->commit();
            }// catch (Exception $e)
            {
                /* $this->db->rollBack();
                  $this->view->headline = "Problema ao editar registro. " . $e->getMessage();
                  $this->_forward("index");
                  return; */
            }
            //Se chegou aqui esse ingredienteId foi realmente inserido
            //$this->editAction($ingredienteId);
        }

        $this->editAction($ingredienteId);
    }

    public function editAction($ingredienteId = '')
    {
        if (empty($ingredienteId))
            $ingredienteId = $this->getRequest()->getPost('ingredienteId');

       $this->view->formData = $this->Ingrediente->getSingleData($ingredienteId);
       $this->view->ingredientesOption = $this->Ingrediente->getIngredientOptionDropDown();

       $this->_helper->viewRenderer('index');

    }

    public function do_upload()
    {
        $adapter = new Zend_File_Transfer_Adapter_Http();
        //$adapter->setDestination('logo');
        $adapter->addValidator('Extension', false, 'jpg,png,jpeg,gif,xps');
        $adapter->addValidator('Size', false, 2000000);
        if (!$adapter->receive())
        {
            $messages = $adapter->getMessages();
            throw new Exception(implode("\n", $messages));
            return;

            //$messages = $adapter->getMessages();
            //$this->_helper->viewRenderer('index');
            //$this->errorMessage = implode("\n", $messages);
            //return false;
        } else
        {
            $file = $adapter->getFileInfo();
            $name = $file['userfile']['name'];
            $d = file_get_contents($file['userfile']['tmp_name']);
            unlink($file['userfile']['tmp_name']);
            return $d;
        }
    }

    /*  public function gridviewAction()
      {
      $record = $this->Ingrediente->getRecords($this->empresaId);
      $page = $this->_getParam('page', 1);
      $paginator = Zend_Paginator::factory($record);
      $paginator->setItemCountPerPage(20);
      $paginator->setCurrentPageNumber($page);
      $this->view->paginator = $paginator;
      } */

    public function getImageAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        $ingredienteId = $this->_getParam('ingrediente', '');
        $image = $this->Ingrediente->getImageData($ingredienteId);
        header('Content-type: image/jpeg/png/gif/jpg');
        echo base64_decode($image);
    }

}

?>