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
    public $session;
    public $db;
    public $empresaId; //empresa que o usuario logado que instanciou esta classe pertence

    public function init()
    {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->session = new Zend_Session_Namespace('default');
        if (isset($this->session->user))
        {
            $this->empresaId = $this->session->user->empresa;
        }

        $this->_helper->layout()->setLayout('tela_cadastro_layout');

        $this->Empresa = new DbTable_Empresa($this->db);
        $this->TbCidade = new DbTable_TbCidade();
        $this->TipoProduto = new DbTable_TipoProduto();
        $this->TiposProdutosEmpresa = new DbTable_TiposProdutosEmpresa($this->db);
        $this->HorarioFuncionamento = new DbTable_HorarioFuncionamento($this->db);
        $this->Ingrediente = new DbTable_Ingrediente();
        $this->CategoriaEmpresa = new DbTable_CategoriaEmpresa();
        $this->CategoriaIngredienteEmpresa = new DbTable_CategoriaIngredienteEmpresa($this->db);
        $this->IngredienteEmpresa = new DbTable_IngredienteEmpresa($this->db);
        $this->ItensDeUmLanche = new DbTable_ItensDeUmLanche($this->db);
        $this->view->pageTitle = 'Ingredientes';
        $this->caminho = $this->getRequest()->getModuleName() . "/" . $this->getRequest()->getControllerName();
    }

    public function indexAction()
    {
        $this->view->empresaId = $this->empresaId;
        $this->view->ingredienteJaCustomizadoOption = $this->IngredienteEmpresa->getIngredientesJaCustomizadosDropDown($this->empresaId);
        $this->view->ingredienteAindaNaoCustomizadoOption = $this->IngredienteEmpresa->getIngredientesAindaNaoCustomizadosDropDown($this->empresaId);
        $this->view->categoriaIngredienteRec = $this->CategoriaEmpresa->getRecords($this->empresaId);
        $this->view->categoriaIngredienteOption = $this->CategoriaEmpresa->getOptionDropDown($this->empresaId);
        $this->view->ingredienteEmpresa = $this->IngredienteEmpresa->getRecords($this->empresaId);
    }

    public function errorAction()
    {
        $this->editAction();
        $this->view->formData = $this->getRequest()->getPost();
        $this->_helper->viewRenderer('index');
    }

    public function addAction()
    {
        $formData = $this->getRequest()->getPost();
        $ingredienteId = $formData['ingredienteId'];
        $this->view->ingredienteId = $ingredienteId;

        if ($formData['emorFrom'] == 1)
        {
            if (!empty($formData['flagRemoverImagem']))
                $fileName = "remover";

            //A tela de ingrediente eh a unica que precisou de um controle baseado nessa flag
            //Como aqui a chave eh composta formada por duas chaves estrangeiras (id_ingrediente,id_emrpesa), sempre o id_ingrediente
            //eh enviado pois, tanto na tela de edicao como na de insercao de novo, um id_ingrediente esta disponivel
            if ($formData['action'] == 'edit') //eh uma edicao
            {

                if (!empty($_FILES['userfile']['name']))
                {

                    try
                    {
                        $fileName = $this->do_upload();
                    } catch (Exception $e)
                    {
                        $this->view->headline = "Problema ao fazer upload da imagem. " . $e->getMessage();
                        $this->errorAction();
                        return;
                    }
                }

                try
                {
                    $this->db->beginTransaction();
                    $this->CategoriaIngredienteEmpresa->updateRecord($formData, $ingredienteId, $this->empresaId);
                    $this->IngredienteEmpresa->editRecord($formData, $ingredienteId, $this->empresaId, $fileName);
                    $this->db->commit();
                } catch (Exception $e)
                {
                    $this->db->rollBack();
                    $this->view->headline = "Problema ao editar registro. " . $e->getMessage();
                    $this->errorAction();
                    return;
                }
                $this->editAction($ingredienteId);
            } else //eh uma insercao
            {
                if (!empty($_FILES['userfile']['name']))
                {
                    try
                    {
                        $fileName = $this->do_upload();
                    } catch (Exception $e)
                    {
                        $this->view->headline = "Problema ao fazer upload da imagem. " . $e->getMessage();
                        $this->_forward("index");
                        return;
                    }
                }


                /*if (!$this->IngredienteEmpresa->checkDuplicateRec($this->empresaId, $ingredienteId))
                {
                    $this->view->headline = "Esse ingrediente já está cadastrado!";
                    $this->_forward("index");
                    return;
                }*/
                try
                {
                    $this->db->beginTransaction();
                    //Se o ingrediente já existe significa que já tinha sido customizado uma vez, foi removido, e sua flag marcada para removido,                    
                    if ($this->IngredienteEmpresa->checkDuplicateRec($this->empresaId, $ingredienteId))
                    {
                        $data['removed'] = 0;
                        $where[] = "cod_empresa = $this->empresaId";
                        $where[] = "cod_ingrediente = $ingredienteId";
                        $t =  $this->db->update('ingrediente_empresa', $data, $where);        
                    }
                    else
                    {
                        $this->IngredienteEmpresa->addRecord($formData, $ingredienteId, $this->empresaId, $fileName);
                    }
                    $this->CategoriaIngredienteEmpresa->updateRecord($formData, $ingredienteId, $this->empresaId);
                    $this->db->commit();
                } catch (Exception $e)
                {
                    $this->db->rollBack();
                    $this->view->headline = "Problema ao inserir registro. " . $e->getMessage();
                    $this->_forward("index");
                    
                }
                //Se chegou aqui esse ingredienteId foi realmente inserido
                $this->editAction($ingredienteId);
            }
        }
        else if ($formData['emorFrom'] == 2) //tela de, dado uma categoria, associa-la com varios ingredientes de uma so vez
        {
            try
            {
                $this->db->beginTransaction();
                $id = $this->CategoriaIngredienteEmpresa->associarCategoria($formData, $this->empresaId);
                $this->db->commit();
            } catch (Exception $e)
            {
                $this->db->rollBack();
                $this->view->headline = "Problema ao editar registro. " . $e->getMessage();
                $this->errorAction();
                return;
            }

            $this->_helper->redirector->gotoUrl($this->caminho . "/gridView");
        }
	//Cadastrar nova categoria
	else if ($formData['emorFrom'] == 3 || $formData['emorFrom'] == 4)
        {
	    $this->_helper->viewRenderer('index');

	    try
	    {
		$this->CategoriaEmpresa->add($this->getRequest()->getPost('categoria'));
		$this->editAction();
	    }
	    catch(Exception $e)
	    {
               $this->view->headline = "Problema ao inserir nova categoria. " . $e->getMessage();
	       $this->errorAction();
               return;
	    }
	}

    }

    public function editAction($ingredienteId = '')
    {
	$empresaId = $this->empresaId;
        $this->view->ingredienteJaCustomizadoOption = $this->IngredienteEmpresa->getIngredientesJaCustomizadosDropDown($this->empresaId);
        $this->view->ingredienteAindaNaoCustomizadoOption = $this->IngredienteEmpresa->getIngredientesAindaNaoCustomizadosDropDown($this->empresaId);
        $this->view->categoriaIngredienteRec = $this->CategoriaEmpresa->getRecords($empresaId);
        $this->view->categoriaIngredienteOption = $this->CategoriaEmpresa->getOptionDropDown($empresaId);
        $this->_helper->viewRenderer('index');
        $this->view->empresaId = $empresaId;

        if (empty($ingredienteId))
            $ingredienteId = $this->getRequest()->getPost('ingredienteId');

	if(empty ($ingredienteId))
	    return;

	$categoriaIngredienteEmpresa = $this->CategoriaIngredienteEmpresa->getRecords($ingredienteId, $empresaId);
	$this->view->categoriaIngredienteEmpresa = $categoriaIngredienteEmpresa;
        $formData = $this->IngredienteEmpresa->getSingleData($ingredienteId, $empresaId);
        $this->view->formData = $formData;       
        $this->view->action = 'edit';
        $this->view->ingredienteId = $ingredienteId;
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

    public function deleteAction()
    {
        $empresaId = $this->empresaId;
        $ingredienteId = $this->getRequest()->getPost('ingredienteId');

        $r = $this->ItensDeUmLanche->getRecords($empresaId, $ingredienteId);
        if (!empty($r))
        {
            $this->view->headline = "Este ingrediente está associado a algum produto e por isso não pode ser excluído!";
            $this->errorAction();
            return;
        } else
        {
            try
            {
                $this->IngredienteEmpresa->deleteRecords($empresaId, $ingredienteId);
            } catch (Exception $e)
            {
                $this->errorAction();
                return;
            }
            $this->_helper->redirector->gotoUrl($this->caminho . "/gridView");
        }
    }

    public function gridviewAction()
    {
        $record = $this->IngredienteEmpresa->getRecords($this->empresaId);
        $page = $this->_getParam('page', 1);
        $paginator = Zend_Paginator::factory($record);
        $paginator->setItemCountPerPage(20);
        $paginator->setCurrentPageNumber($page);
        $this->view->paginator = $paginator;
    }

    public function getImageAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        $empresaId = $this->_getParam('empresa', '');
        $ingredienteId = $this->_getParam('ingrediente', '');
        $image = $this->IngredienteEmpresa->getImageData($ingredienteId, $empresaId);
        header('Content-type: image/jpeg/png/gif/jpg');
        echo base64_decode($image);
    }

    public function getImageOriginalAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        $ingredienteId = $this->_getParam('ingrediente', '');
        $image = $this->Ingrediente->getImageData($ingredienteId);
        header('Content-type: image/jpeg/png/gif/jpg');
        echo base64_decode($image);
    }


    /*
     * Na tela de ingredientes existe uma aba onde eh possivel observar, dada uma categoria, quais ingredientes
     * customizados pela empresa estao nesta categoria. Quando o combobox para escolher a categoria eh acionado
     * esta funcao eh chamada via ajax para povoar a tela.
     */

    public function categoriaAction()
    {
        $cod_categoria_empresa = $this->_getParam('tipoing', '');
        $ingredienteEmpresaRec = $this->IngredienteEmpresa->getRecords($this->empresaId);
        $categoriaIngredienteEmpresaAssocair = $this->CategoriaIngredienteEmpresa->getRecordsAssocair($this->empresaId, $cod_categoria_empresa);
        $i = 0;
        $resp = "<tr> ";

        foreach ($ingredienteEmpresaRec as $k => $v)
        {
            if (in_array($v['cod_ingrediente'], $categoriaIngredienteEmpresaAssocair))
            {
                $checked = 'checked';
            } else
            {
                $checked = '';
            }
            $resp.="<td> <input type='checkbox' name='cod_ingrediente[]' value='".$v['cod_ingrediente']."' $checked>". $v['nome']."  </td>";
            if ($i >= 5)
            {
                $resp.='</tr><tr>';
                $i = 0;
            }
            $i++;
        }
        $resp.="</tr>";
        echo $resp;
        exit;
    }

}

?>