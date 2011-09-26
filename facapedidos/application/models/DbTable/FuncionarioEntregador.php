<?php
  class DbTable_FuncionarioEntregador extends Zend_Db_Table_Abstract
  {
      protected $_name = 'funcionario_entregador';

      public function __construct($db)
      {
          $this->_db = $db;
      }

       public function getRecords($cod_funcionario)
      {
          $query = $this->_db->query("SELECT * FROM funcionario_entregador where  cod_funcionario =$cod_funcionario ");
          $res = $query->fetchAll();
          $result=$res[0];

          return $result;
      }
      public function addRecord($formData,$cod_funcionario)
      {
          echo '<pre>';print_r($formData);echo '</pre>';
          exit;
         $data = array(
                        'cod_funcionario' => $cod_funcionario,
                        'modelo_moto' => $formData['modelo_moto'],
                        'consumo' =>(float) $formData['consumo'],
                        'total_km' =>(float) $formData['total_km'],
                        'total_acidentes' =>(int)$formData['total_acidentes'],
                         );


          $id = $this->insert($data);
          return $id;
      }
      public function editRecord($formData,$cod_funcionario)
      {
          $this->deleteRecords($cod_funcionario);
           $data = array(
                        'cod_funcionario' => $cod_funcionario,
                        'modelo_moto' => $formData['modelo_moto'],
                        'consumo' =>(float) $formData['consumo'],
                        'total_km' =>(float) $formData['total_km'],
                        'total_acidentes' =>(int)$formData['total_acidentes'],
                         );

          $id = $this->insert($data);
          return $id;
      }
      public function deleteRecords($cod_funcionario)
      {
          $this->_db->delete('funcionario_entregador', "cod_funcionario = $cod_funcionario");
      }
  }
?>