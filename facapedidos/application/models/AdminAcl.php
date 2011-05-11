<?php


class AdminAcl extends Zend_Acl{
	
	public function __construct(){
		
		//Papeis = Roles = Grupos
		$this->addRole(new Zend_Acl_Role("guest"));//Visitantes
		$this->addRole(new Zend_Acl_Role("atendente"),"guest");//gerenciar pedidos 
		$this->addRole(new Zend_Acl_Role("admin"));//faz tudo
		
		//Recursos
		$this->add(new Zend_Acl_Resource("estabelecimento:index"));
		$this->add(new Zend_Acl_Resource("estabelecimento:auth"));
	
		
		//Privilegios
		$this->allow("guest","estabelecimento:auth","index");
		
		$this->allow("admin");
		$this->deny("admin","estabelecimento:auth","index");
		
		
	}

}