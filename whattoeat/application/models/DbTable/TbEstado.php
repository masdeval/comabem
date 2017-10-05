<?php

class DbTable_TbEstado extends Zend_Db_Table_Abstract
{

    protected $_name = 'tb_estado';
    public function getEstadoDropDown()
      {
          $result['0'] = 'Select';
          $dat=$this->fetchAll();
          foreach ($dat as $k=>$row) {
              $result[$row->cod_estado] = $row->uf;
          }
          return $result;
      }


}

