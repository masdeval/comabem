<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of User
 *
 * @author christian
 */
class Application_Model_User  //implements Zend_Acl_Role_Interface
{
  //contents of the class here

  //this method is for the role interface:
  //public function getRoleId() {
    //return 'user-' . $this->_name;
  //}
 
    //put your code here

    //public $roles = array();
    public $name;
    public $id;
    public $resources;
    public $empresa;
 
    public function _construct($name, $id, $resources){

        $this->id = $id;
        $this->roles = $roles;
        $this->name = $name;
    }
    
    public function getResources(){

        return $resources;
    }
}
?>
