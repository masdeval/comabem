<?php


class AdminAcl extends Zend_Acl{
	
	public function __construct(){
		
		/* Role geral */
		$this->addRole(new Zend_Acl_Role("geral"));
                //Recursos de GERAL
		$this->add(new Zend_Acl_Resource("estabelecimento:error"));
	        $this->add(new Zend_Acl_Resource("estabelecimento:auth")); //login
                //Privilegios de geral
	        $this->allow("geral","estabelecimento:error");
                $this->allow("geral","estabelecimento:auth");

                /*Role gerente*/
                $this->addRole(new Zend_Acl_Role("gerente"),"geral");
                //Recursos de gerente
               	$this->add(new Zend_Acl_Resource("estabelecimento:index"));
                $this->add(new Zend_Acl_Resource("estabelecimento:empresa"));
		$this->add(new Zend_Acl_Resource("estabelecimento:ingredients"));
	        $this->add(new Zend_Acl_Resource("estabelecimento:funcionario"));
	        $this->add(new Zend_Acl_Resource("estabelecimento:produto"));
	        $this->add(new Zend_Acl_Resource("estabelecimento:pedidos"));
           
                //Privilegios de gerente
		$this->allow("gerente","estabelecimento:empresa");
                $this->allow("gerente","estabelecimento:ingredients");
                $this->allow("gerente","estabelecimento:funcionario");
                $this->allow("gerente","estabelecimento:produto");
                $this->allow("gerente","estabelecimento:index");
		$this->allow("gerente","estabelecimento:pedidos");

                /*Role Admin*/
		$this->addRole(new Zend_Acl_Role("admin"),"gerente");
                //Recursos de administrador
               	$this->add(new Zend_Acl_Resource("estabelecimento:tabelaIngredienteCompartilhada"));
   		$this->allow("admin");
		
	}

}