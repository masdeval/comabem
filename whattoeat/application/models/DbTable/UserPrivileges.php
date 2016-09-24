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
    protected $_name = 'privilege';

    public function __construct($db) {
        $this->_db = $db;
    }

    public function getUserRole($id) {
        
        $query = $this->_db->query("SELECT role.nome FROM privilege,role where privilege.cod_funcionario = $id and " .
                " role.cod_role = privilege.cod_role ");
        $result = $query->fetchAll();
        
        return $result[0]['nome'];       
    }

    public function getResourcesFromUser($id) {
        $query = $this->_db->query("SELECT resource.name FROM privilege,role,role_has_resource,resource where " .
                " privilege.cod_funcionario = '$id' and privilege.cod_role = role.cod_role and " .
                " role.cod_role = role_has_resource.cod_role and " .
                " role_has_resource.cod_resource = resource.cod_resource "
        );

        $result = $query->fetchAll();
        return $result;
    }

    public function addUserPrivilege($role,$user)
    {
        $data['cod_role'] = $role;
        $data['cod_funcionario'] = $user;
        $t = $this->_db->insert($this->_name,$data);
    }
}

?>
