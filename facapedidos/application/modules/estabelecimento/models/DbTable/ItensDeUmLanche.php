<?php
  class Application_Model_DbTable_ItensDeUmLanche extends Zend_Db_Table_Abstract
  {
      protected $_name = 'itens_de_um_lanche';

      public function getRecords($empresaId,$ingredienteId)
      {
          $query = $this->_db->query("SELECT * FROM itens_de_um_lanche WHERE cod_empresa=$empresaId AND cod_ingrediente=$ingredienteId");

          $result = $query->fetchAll();
          return $result;
      }

  }
?>
