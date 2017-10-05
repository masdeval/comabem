<?php

class DbTable_TbCidade extends Zend_Db_Table_Abstract
{

    protected $_name = 'tb_cidade';
    public function getCidadeDropDown()
      {
          $result[''] = 'Select';
          $dat=$this->fetchAll();
          foreach ($dat as $k=>$row) {
              $result[$row->cod_cidade] = $row->nome;
          }
          return $result;
      }

      
    public function getCidadeByEstadoDropDown($estado)
      {        
          
          $query = $this->_db->query("SELECT * from tb_cidade where cod_estado = ".$estado);          
          $dat=$query->fetchAll();
          
          foreach ($dat as $k=>$row) {
              $result[$row['cod_cidade']] = $row['nome'];
          }
          return ($result);
      }
      
}

