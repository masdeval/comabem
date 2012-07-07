<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Privileges
 *
 * @author christian
 */
class DbTable_UserPrivileges extends Zend_Db_Table_Abstract {
    //put your code here


      public function getUserRole($id)
      {
          $query = $this->_db->query("SELECT role.nome FROM privilege,role where privilege.cod_funcionario = '$id' and ".
                  " role.cod_role = privilege.cod_role ");
          $result = $query->fetchAll();
          return $result[0]['nome'];
      }
   
      public function getResourcesFromUser($id)
      {
          $query = $this->_db->query("SELECT resource.name FROM privilege,role,role_has_resource,resource where ".
                 " privilege.cod_funcionario = '$id' and privilege.cod_role = role.cod_role and ".
                 " role.cod_role = role_has_resource.cod_role and ".
                 " role_has_resource.cod_resource = resource.cod_resource "                 
                  );
          
          $result = $query->fetchAll();
          return $result;
      }

}
?>
