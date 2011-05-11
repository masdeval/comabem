<?php
  class Application_Model_DbTable_TiposProdutosEmpresa extends Zend_Db_Table_Abstract
  {
      protected $_name = 'tipos_produtos_empresa';
     protected $_sequence = array( 'cod_tipo_produto', 'cod_empresa');
      public function getRecords($cod_empresa)
      {
          $query = $this->_db->query("SELECT * FROM tipos_produtos_empresa where  cod_empresa =$cod_empresa ");
          $res = $query->fetchAll();
          foreach ($res as $k => $row) {
              $result[] = $row['cod_tipo_produto'];
          }
          return $result;
      }
      public function addRecord($empID, $formData)
      {
          foreach ($formData['cod_tipo_produto'] as $k => $v) {
              $data = array('cod_tipo_produto' => (int)$v,
                            'cod_empresa' => $empID, );
              $this->_db->insert('tipos_produtos_empresa', $data);
          }
      }
      public function editRecord($empID, $formData)
      {
          $this->_db->delete('tipos_produtos_empresa', "cod_empresa = $empID");

          foreach ($formData['cod_tipo_produto'] as $k => $v) {
              $data = array('cod_tipo_produto' => (int)$v,
                            'cod_empresa' => $empID, );
              $this->_db->insert('tipos_produtos_empresa', $data);
          }
      }
      public function deleteRecords($empresaId)
      {
          $this->_db->delete('tipos_produtos_empresa', "cod_empresa = $empresaId");
      }
  }
?>