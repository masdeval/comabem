<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Cliente
 *
 * @author masdeval
 */

class DbTable_ClienteDAO extends Zend_Db_Table_Abstract
{

      protected $_name = 'cliente';

    public function add($formData)
    {

	/*$data = array('nome' => $formData['nome'],
	    'email' => $formData['email'],
	    'senha' => $formData['senha'],
	    'celular' => $formData['celular'],
	    'data_cadastro' => now(),
	 
	);*/

	$id = $this->insert($formData);

	return $id;
    }

     public function getRecords()
    {
	$query = $this->_db->query("SELECT * from cliente");
	$result = $query->fetchAll();
	return $result;
    }

    public function getClienteByEmail($email)
    {
	$query = $this->_db->query("SELECT * from cliente where email = '".$email."'" );
	$result = $query->fetchAll();
	return $result[0];
	
    }

    public function isMailDuplicado($email)
    {

	$result = $this->getClienteByEmail($email);

	if(count($result) > 0)
	    return true;
	else
	    return false;
    }

    public function validaCliente($email, $senha)
    {
	//verifica se email confere
	$cliente = $this->getClienteByEmail($email);
	if(count($cliente) <= 0)//email nao encontrado
	    return 2;

	//verifica se senha confere
	$query = $this->_db->query(" select nome from cliente where email = '".$email."' and senha = '".$senha."'");
	$result = $query->fetchAll();
	if(count($result) <= 0)//senha nao confere
	    return 3;

	return new Cliente($cliente['cod_cliente'], $cliente['nome'], $cliente['email'], $cliente['telefone']);
    }

}
?>
