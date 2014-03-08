<?php
  class DbTable_ItensDeUmLanche extends Zend_Db_Table_Abstract
  {
      protected $_name = 'ingrediente_empresa_produto';

    public function __construct($db)
    {
        $this->_db = $db;
    }


      public function getRecords($empresaId,$ingredienteId)
      {
          $query = $this->_db->query("SELECT * FROM ingrediente_empresa_produto WHERE cod_empresa=$empresaId AND cod_ingrediente=$ingredienteId");

          $result = $query->fetchAll();
          return $result;
      }
       public function getRecordsProduto($cod_empresa,$cod_produto)
      {
          $query = $this->_db->query("SELECT * FROM ingrediente_empresa_produto WHERE cod_empresa=$cod_empresa AND cod_produto=$cod_produto");

          $result = $query->fetchAll();
          return $result;
      }
       public function add($formData,$cod_produto,$cod_empresa)
      {
          $this->_db->delete('ingrediente_empresa_produto', "cod_produto =$cod_produto and cod_empresa=$cod_empresa");
          foreach($formData['ie']['cod_ingrediente'] as $k=>$v){
              if(empty($v)){
                  continue;
              }
              $data=array(
                         'cod_produto'=>$cod_produto,
                         'cod_empresa'=>$cod_empresa,
                         'cod_ingrediente'=>$v,
                         'preco'=>(float)$formData['ie']['preco'][$v],
                         'valor_calorico'=>(float)$formData['ie']['valor_calorico'][$v],
                       );
                       $this->insert($data);
          }
      }

      public function getPreco($cod_produto){
           $query = $this->_db->query("SELECT SUM(preco) as total FROM ingrediente_empresa_produto WHERE cod_produto=$cod_produto");

          $result = $query->fetchAll();
          return $result[0]['total'];
      }

      public function getCalorias($cod_produto){
           $query = $this->_db->query("SELECT SUM(valor_calorico) as total FROM ingrediente_empresa_produto WHERE cod_produto=$cod_produto");

          $result = $query->fetchAll();
          return $result[0]['total'];
      }
  }
?>
