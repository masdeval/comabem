<?php
  class DbTable_CategoriaPermitidaComoAdicional extends Zend_Db_Table_Abstract
  {
      protected $_name = 'categoria_permitida_como_adicional';

         public function __construct($db)
    {
        $this->_db = $db;
    }


      public function getRecords($cod_produto)
      {
          $query = $this->_db->query("SELECT * FROM categoria_permitida_como_adicional where cod_produto=$cod_produto ");
          $result = $query->fetchAll();
          return $result;
      }
      public function add($formData,$cod_produto)
      {
          //echo '<pre>';print_r($formData);echo '</pre>';
          //exit;
          $this->_db->delete('categoria_permitida_como_adicional', "cod_produto =$cod_produto");
          foreach($formData['cp']['cod_tipo_ingrediente'] as $k=>$v){
              $data=array(
                         'cod_produto'=>$cod_produto,
                         'cod_tipo_ingrediente'=>$v,
                         'qtd_max_adicionais'=>(int)$formData['cp']['qtd_max_adicionais'][$v][0],
                       );
                       $this->insert($data);
          }

      }


  }
?>
