<?php
  class DbTable_CategoriaIngrediente extends Zend_Db_Table_Abstract
  {
      protected $_name = 'categoria_ingrediente';

      public function getRecords()
      {
          $query = $this->_db->query("SELECT * FROM categoria_ingrediente");
          $result = $query->fetchAll();
          return $result;
      }
      public function getOptionDropDown()
      {
          $result[''] = 'Select';
          $dat=$this->fetchAll();
          foreach ($dat as $k=>$row) {
              $result[$row->cod_tipo_ingrediente] = $row->nome;
          }
          return $result;
      }
  }
?>
