<?php

class Estabelecimento_EmpresaController extends Zend_Controller_Action
{

    public $TbCidade;
    public $TipoProduto;
    public $Empresa;
    public $Produto;
    public $TiposProdutosEmpresa;
    public $HorarioFuncionamento;
    public $FuncionarioHasEmpresa;
    public $errorMessage;
    public $caminho;
    public $session;
    public $db;
    public $empresaId; //empresa que o usuario logado que instanciou esta classe pertence

    public function init()
    {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->session = new Zend_Session_Namespace('estabelecimento');
        if (isset($this->session->user))
        {
            $this->empresaId = $this->session->user->empresa;
        }

        $this->_helper->layout()->setLayout('header');
        $this->Empresa = new DbTable_Empresa($this->db);
        $this->TbCidade = new DbTable_TbCidade();
        $this->TipoProduto = new DbTable_TipoProduto();
        $this->Produto = new DbTable_Produto($this->db);
        $this->TiposProdutosEmpresa = new DbTable_TiposProdutosEmpresa($this->db);
        $this->HorarioFuncionamento = new DbTable_HorarioFuncionamento($this->db);
        $this->FuncionarioHasEmpresa = new DbTable_FuncionarioHasEmpresa($this->db);
        $this->view->pageTitle = 'Empresa';
        $this->caminho = $this->getRequest()->getModuleName() . "/" . $this->getRequest()->getControllerName();
    }

    public function errorAction()
    {
        $formId = $this->getRequest()->getPost('emorFrom');
        $this->editAction();
        //Este switch é para tentar recuperar os formularios com o ultimo dado que o usuario inseriu antes do erro
        switch ($formId)
        {
            case 1:
                $this->view->formData = $this->getRequest()->getPost();
                break;
            case 3:
                $this->view->formData3 = $this->getRequest()->getPost();
                break;
        }
        $this->_helper->viewRenderer('index');
    }

    public function indexAction()
    { 
        $this->view->empresaId = $this->empresaId; //dessa maneira garanto que sempre exista um id de empresa setado na tela
        $this->view->cidadeOption = $this->TbCidade->getCidadeDropDown();
        $this->view->cod_tipo_produto = $this->TipoProduto->getCodTipoProductoDropDown();
        $this->editAction();//so nesse caso de empresa que precisa ter essa chamada
    }

    public function addAction()
    {                
        $formData = $this->getRequest()->getPost();
        $id = $formData['empresaId']; //se tem Id é uma edicao

        if ($formData['emorFrom'] == 1)//formulario de empresa
        {
	    $fileName = "";
            if (!empty($formData['flagRemoverImagem']))
                $fileName = "remover";

            if (!empty($id)) //edicao de empresa
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
                    $this->Empresa->editEmpresa($formData, $id, $fileName);
                    $this->db->commit();
                } catch (Exception $e)
                {
                    $this->db->rollBack();

                    if ($e->getCode() == 23505) //Unique violation
                    {
                        $this->view->headline = "CNPJ ou URL duplicados. Favor verificar.";
                        $this->editAction();
                        return;
                    } else
                    {
                        $this->view->headline = $e->getMessage();
                        $this->errorAction();
                        return;
                    }
                }
                //$this->view->action = 'edit';
                $this->editAction();
                //$this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$id");
            } else  //insercao de empresa
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

                try
                {
                    $this->db->beginTransaction();
                    $id = $this->Empresa->addEmpresa($formData, $fileName);
                    if(isset($this->session->user))
                    {
                        $this->FuncionarioHasEmpresa->insertRecord($this->session->user->id, $id, 1);
                        $this->session->user->empresa= $id;
                    }                    
                    $this->db->commit();
                    $this->empresaId = $id;
                } catch (Exception $e)
                {
                    $this->db->rollBack();
                    if ($e->getCode() == 23505) //Unique violation
                    {
                        $this->view->headline = "CNPJ ou URL duplicados. Favor verificar.";
                        $this->_forward("index");
                        return;
                    } else
                    {
                        $this->view->headline = $e->getMessage();
                        $this->_forward("index");
                        return;
                    }
                }
                
                $this->editAction();
                //$this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$id");
            }
        }
        if ($formData['emorFrom'] == 2) //formulario de tipo produto
        {

            $empresaId = $formData['empresaId']; //e se for vazio
            if (!empty($empresaId))
            {
                try
                {
                    $this->db->beginTransaction();
                    $this->TiposProdutosEmpresa->editRecord($empresaId, $formData);
                    $this->getRequest()->setParam("id", $empresaId);
                    $this->db->commit();
                    $this->editAction();
                } catch (Exception $e)
                {
                    $this->db->rollBack();
                    $this->view->headline = "Problema ao inserir registro. " . $e->getMessage();
                    $this->errorAction();
                    return;
                }
            } else
            {
                $this->view->headline = "Por favor, selecione uma empresa primeiro.";
                $this->_forward("index");
            }
        }
        if ($formData['emorFrom'] == 3)
        {
            $empresaId = $formData['empresaId'];
            if (!empty($empresaId))
            {
                try
                {
                    $this->db->beginTransaction();
                    $this->HorarioFuncionamento->editRecord($empresaId, $formData);
                    $this->db->commit();
                    $this->editAction();
                    //$this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$empresaId");
                } catch (Exception $e)
                {
                    $this->db->rollBack();
                    $this->view->headline = "Problema ao inserir registro. " . $e->getMessage();
                    $this->errorAction();
                    return;
                }
            } else
            {
                $this->view->headline = "Por favor, selecione uma empresa primeiro.";
                $this->_forward("index");
            }
        }
    }

    /* Uma empresa pode trabalhar com varios tipos de produtos e isso é controlado nessa tabela.
     * Essa tabela possui uma chave composta formada por COD_TIPO_PRODUTO E COD_EMPRESA.
     * Quando os produtos de uma empresa sao cadastrados deve-se informar qual é o seu tipo. É apresentada
     * uma lista apenas com os tipos de produto da empresa em questao.
     * 
     * Obs: Nao é permitido remover um tipo de produto de uma empresa caso já exista algum produto dessa
     * empresa relacionado com o tipo que pretende-se excluir. (integridade referencial)
     */

    /* Nao preciso mais fazer a validacao aqui, no momento de salvar. Estou fazendo quando usuario interage na tela

      public function trataEdicaoDeTiposDeProdutos($empresaId, $formData)
      {
      try
      {
      //Primeiro verifica-se se esta tentando remover um tipo de produto para o qual já existe um produto associado
      //Obtem uma lista de tipos de produtos da empresa que realmente estao associados a algum produto
      $tipos_produtos_atual = $this->Empresa->getTipoProdutoAssociadoAProduto($empresaId);
      //Cria um array com a nova lista de produtos que deve ficar cadastrada (veio na ultima submissao do formulario)
      $i = 0;
      foreach ($formData['cod_tipo_produto'] as $k => $v)
      {
      $nova_lista_tipo_produtos[$i] = $v;
      $i++;
      }
      //Os cod_tipo_produto em $tipos_produtos_atual que nao estao em $nova_lista_tipo_produtos
      //sao os que devem ser removidos. Avisar o usuario para primeiramente remover ou alterar os
      //produtos já associados com o tipo de produto a ser removido. array_dif ira retornar
      //tudo que esta em $tipos_produtos_atual mas não está em $nova_lista_tipo_produtos
      $comparacao = array_diff(array_keys($tipos_produtos_atual), $nova_lista_tipo_produtos);
      //Obs: tive que usar a funcao array_keys pois a funcao usada acima
      //retorna o array com os indices sendo os cod_tipo_produtos
      //
      //Se $comparacao nao esta vazio, entao esta tentando remover indevidamente um tipo de produto dessa empresa que está
      //associado com algum produto
      if (!empty($comparacao))
      {
      //Agora avisar o usuario
      //
      //Obtenho os nomes dos produtos dessa empresa que estao relacionados aos tipos produtos
      //que serao excluidos, ou seja, os tipos contidos em $comparacao
      $produtos = $this->Produto->getNomeProdutosByTipo($empresaId, implode(',', $comparacao));
      //Obtenho os nomes dos tipos de produtos que deseja-se excluir
      $nomes_tipos_produtos = '';
      foreach ($comparacao as $indice)
      {
      $nomes_tipos_produtos = $nomes_tipos_produtos . " " . $tipos_produtos_atual[$indice];
      }

      $this->getRequest()->setParam("msg", "Você está tentando remover os tipos de produtos: " . $nomes_tipos_produtos .
      ".  Estes tipos já foram associados com os produtos: " . implode(',', $produtos[0]) . ". Favor remover o produto ou associá-lo com outro tipo antes de proceder com a exclusão.");

      return;
      } else
      {

      $this->TiposProdutosEmpresa->editRecord($empresaId, $formData);
      }
      } catch (Exception $e)
      {

      throw $e;
      }
      }

     */

    public function checkTipoProdutoDeletionAction()
    {
        $empresaId = $this->_getParam('empresaId', '');
        $idTipoProduto = $this->_getParam('idTipoProduto', ''); //tipo de produto que esta sendo removido
        //da empresa e que deve ser confrontado com a tabela produto para saber se já não está associado a algum
        //produto desta empresa
        //Preciso saber se existe algum produto na tabela produto que esteja relacionado com a empresa e com
        //o tipo de produto a ser removido em questao
        $produtos = $this->Produto->getNomeProdutosByTipo($empresaId, $idTipoProduto);

        if (!empty($produtos)) //significa que há produto relacionado com o tipo produto e nao pode permitir a exclusao
        {
            //Agora avisar o usuario
            echo "Este tipo está associado com os produtos: " . implode(',', $produtos[0]) . " Antes de removê-lo você precisa primeiro excluir o(s) produto(s) ou alterar seu tipo.";

            exit;
        }

        echo "OK";
        exit;
    }

    public function editAction()
    {
        $empresaId = $this->empresaId; //$this->getRequest()->getPost('empresaId');
        $this->view->empresaId = $empresaId;

        $formData = $this->Empresa->getSingleData($empresaId);
        $formData2 = $this->TiposProdutosEmpresa->getRecords($empresaId);
        $formData3 = $this->HorarioFuncionamento->getRecords($empresaId);
        if(empty($formData3)){$formData3 = array();}
        $this->view->formData = $formData;
        $this->view->formData2 = $formData2;
        $this->view->formData3 = $formData3;

        $cidadeOption = $this->TbCidade->getCidadeDropDown();
        $cod_tipo_produto = $this->TipoProduto->getCodTipoProductoDropDown();
        $this->view->cod_tipo_produto = $cod_tipo_produto;
        $this->view->cidadeOption = $cidadeOption;
        $this->view->title = 'Empresa';
        //$this->view->action = 'edit';
        
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

    public function deleteAction()
    {
        $empresaId = $this->empresaId;  //$this->getRequest()->getPost('empresaId');
        try
        {
            $this->db->beginTransaction();

            /*
             *           * Nao remove tudo relacionado a empresa. Apenas marca uma flag dizendo que na tabela master
             * EMPRESA o registro foi removido

              $this->TiposProdutosEmpresa->deleteRecords($empresaId);
              $this->HorarioFuncionamento->deleteRecords($empresaId);
             */
            $this->Empresa->deleteRecords($empresaId); //seta a flag removed = 1
            $this->db->commit();
        } catch (Exception $e)
        {
            $this->db->rollBack();
            $this->view->headline = "Erro ao remover o registro! " . $e->getMessage();
            $this->errorAction();
            return;
        }
        $this->_helper->redirector->gotoUrl($this->caminho . "/gridView");
    }

    public function gridviewAction()
    {
        $record = $this->Empresa->getRecords();
        $page = $this->_getParam('page', 1);
        $paginator = Zend_Paginator::factory($record);
        $paginator->setItemCountPerPage(20);
        $paginator->setCurrentPageNumber($page);
        $this->view->paginator = $paginator;
    }

    public function deleteTiposDeProdutosAction()
    {
        $empresaId = $this->empresaId; //$this->getRequest()->getPost('empresaId');
        $this->TiposProdutosEmpresa->deleteRecords($empresaId);
        //$this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$empresaId");
        $this->editAction();
    }

    public function deleteHorarioAction()
    {
        $empresaId = $this->empresaId; //$this->getRequest()->getPost('empresaId');
        $this->HorarioFuncionamento->deleteRecords($empresaId);
        //$this->_helper->redirector->gotoUrl($this->caminho . "/edit/id/$empresaId");
        $this->editAction();
    }

    public function checkUrlAction()
    {
        $url = $this->_getParam('url', '');
        $id = $this->_getParam('id', '');
        $status = $this->Empresa->checkDuplicateUrl($url, $id);
        echo $status;
        exit;
    }

    public function getImageAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        $empresaId = $this->empresaId;  //$this->_getParam('id', '');
        $image = $this->Empresa->getImageData($empresaId);
        header('Content-type: image/jpeg/png/gif/jpg');
        echo base64_decode($image);
    }

}

?>
