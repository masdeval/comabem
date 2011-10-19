<?php
  class DbTable_CategoriaIngredienteEmpresa extends Zend_Db_Table_Abstract
  {
      protected $_name = 'categoria_ingrediente_empresa';

    public function __construct($db)
    {
        $this->_db = $db;
    }


      public function getRecords($ingredienteId,$empresaId)
      {
          $query = $this->_db->query("SELECT cod_tipo_ingrediente FROM categoria_ingrediente_empresa WHERE cod_empresa=$empresaId AND cod_ingrediente=$ingredienteId");
          $result = $query->fetchAll();
          foreach($result as $k=>$v){
              $res[]=$v['cod_tipo_ingrediente'];
          }
          return $res;
      }
      public function updateRecord($formData, $ingredienteId,$empresaId){
          $this->deleteRecord($ingredienteId,$empresaId);
          foreach($formData['cod_tipo_ingrediente'] as $k=>$v){
              if($this->checkDuplicateRec($empresaId,$ingredienteId,$v)){
               $data = array(
                         'cod_tipo_ingrediente' => $v,
                         'cod_ingrediente' =>$ingredienteId,
                        'cod_empresa' => $empresaId,
                         );
           $id = $this->insert($data);
              }
          }

      }
      public function associarCategoria($formData,$empresaId){
         foreach($formData['cod_ingrediente'] as $k=>$v){
             if($this->checkDuplicateRec($empresaId,$v,$formData['cod_tipo_ingrediente'])){
               $data = array(
                         'cod_tipo_ingrediente' => $formData['cod_tipo_ingrediente'],
                         'cod_ingrediente' => $v,
                         'cod_empresa' => $empresaId,
                         );
           $id = $this->insert($data);
          }
          else{
              continue;
          }
         }
      }
      public function checkDuplicateRec($empresaId,$ingredienteId,$cod_tipo_ingrediente){
          $query = $this->_db->query("SELECT cod_tipo_ingrediente FROM categoria_ingrediente_empresa WHERE cod_empresa=$empresaId AND cod_ingrediente=$ingredienteId AND cod_tipo_ingrediente=$cod_tipo_ingrediente ");
          $result = $query->fetchAll();
          if(!empty($result)){
              return false;
          }
          else{
              return true;
          }

      }
      public function deleteRecord($ingredienteId,$empresaId){
          $this->delete("cod_ingrediente=$ingredienteId AND cod_empresa=$empresaId ");

      }
      public function getOptionDropDown()
      {

      }
  }
?>
