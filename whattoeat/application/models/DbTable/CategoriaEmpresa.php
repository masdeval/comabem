<?php
  class DbTable_CategoriaEmpresa extends Zend_Db_Table_Abstract
  {
      protected $_name = 'categoria_empresa';

      public function getRecords($cod_empresa)
      {
          $query = $this->_db->query("SELECT * FROM categoria_empresa where cod_empresa = ".$cod_empresa);
          $result = $query->fetchAll();
          return $result;
      }
      public function getOptionDropDown($cod_empresa)
      {
          $result[''] = 'Select';

	  $query = $this->_db->query("SELECT * from categoria_empresa where cod_empresa = ".$cod_empresa);
          $dat=$query->fetchAll();
          foreach ($dat as $k=>$row) {
              $result[$row['cod_categoria_empresa']] = $row['nome'];
          }
          return $result;
      }
      
      public function add($data)
      {
	$id = $this->insert($data);

	return $id;


      }

  }
?>
