<?php
  class DbTable_Ingrediente extends Zend_Db_Table_Abstract
  {
      protected $_name = 'ingrediente';

       public function getIngredientOptionDropDown()
      {
          $result[''] = 'Select';
          $dat=$this->fetchAll();
          foreach ($dat as $k=>$row) {
              $result[$row->cod_ingrediente] = $row->nome;
          }
          return $result;
      }
  }
?>
