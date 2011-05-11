<?php

class Application_Model_AclFactory {
    
   public function createUserAcl(Application_Model_User $user) {
 
      $acl = new Zend_Acl();
      //Como num esquema de acl temos q informar o que ten acesso a que
      //diremos q o usuario tem acesso a alguns recursos por isso o usuario
      //? transformado em uma role
      $acl->addRole(new Zend_Acl_Role($user->id));
      //nao precisa adicionar todas as roles, s? preciso saber num determinado 
      //momento quais recursos um usuario tem acesso
      //$this->_createRoles($acl, $user);
      
      foreach ((array)$user->resources as $resource) {
            $acl->addResource(new Zend_Acl_Resource($resource['name']));
            $acl->allow($user->id, $resource['name']);
      }

      //$this->_setPrivileges($acl, $privileges);

      return $acl;
}

/*private function _createRoles(Zend_Acl $acl, User $user) {
  //add groups first so user can inherit them
  foreach($user->getRoles() as $group) {
    $acl->addRole(new Zend_Acl_Role($group));
  }

 // $acl->addRole($user, $user->getRoles());
}


private function _setPrivileges($acl, $privileges) {
  foreach($privileges as $privilege) {
    $role = $privilege->getRole();
    $resource = $privilege->getResource();
    //the user's roles should already exist so we can
    //ignore the ones that don't
    if(!$acl->hasRole($role)) {
      continue;
    }

    if($privilege->getMode() == 'allow')
      $acl->allow($role, $resource);
    else
      $acl->deny($role, $resource);
  }
}*/

}
?>
