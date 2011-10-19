<?php

class DbTable_FuncionarioHasEmpresa  extends Zend_Db_Table_Abstract
{

    protected $_name = 'funcionario_has_empresa';

    public function __construct($db)
    {
        $this->_db = $db;
    }

    public function getRecord($cod_funcionario)
      {
          $query = $this->_db->query("SELECT * FROM funcionario_has_empresa where cod_funcionario='$cod_funcionario'");
          $result = $query->fetchAll();
          $result = $result[0];
          return $result;
      }
       public function insertRecord($cod_funcionario,$cod_empresa)
      {
          $data = array(
                        'cod_funcionario' => $cod_funcionario,
                        'cod_empresa' => $cod_empresa,
                       );

          $id = $this->insert($data);
          return $id;
      }
      public function updateRecord($cod_funcionario,$cod_empresa)
      {
             $this->deleteRecords($cod_funcionario);
             $data = array(
                        'cod_funcionario' => $cod_funcionario,
                        'cod_empresa' => $cod_empresa,
                       );

          $id = $this->insert($data);
          return $id;
      }
       public function deleteRecords($cod_funcionario)
      {
          $where[] = "cod_funcionario = $cod_funcionario";
          $this->delete($where);
         // $this->delete('funcionario_entregador', "cod_funcionario = $cod_funcionario");
      }


}

