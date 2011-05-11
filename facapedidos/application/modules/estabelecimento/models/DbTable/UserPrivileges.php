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
class Application_Model_DbTable_UserPrivileges extends Zend_Db_Table_Abstract {
    //put your code here


      public function getRolesFromUser($id)
      {
          $query = $this->_db->query("SELECT cod_role FROM privilege where cod_funcionario = '$id'");
          $result = $query->fetchAll();
          return $result;
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
