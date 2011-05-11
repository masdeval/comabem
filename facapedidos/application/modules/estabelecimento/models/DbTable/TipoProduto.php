<?php

class Application_Model_DbTable_TipoProduto extends Zend_Db_Table_Abstract
{

    protected $_name = 'tipo_produto';
    public function getCodTipoProductoDropDown()
      {
          $dat=$this->fetchAll();
          foreach ($dat as $k=>$row) {
              $result[$row->cod_tipo_produto] = $row->nome;
          }
          return $result;
      }


}

