<?php

class DbTable_RecadoCliente extends Zend_Db_Table_Abstract
{

    protected $_name = 'recado_cliente';

   /* public function __construct($db)
    {
        $this->_db = $db;
    }*/

    public function getRecords($cod_empresa)
    {
        $query = $this->_db->query("SELECT * FROM recado_cliente where cod_empresa=$cod_empresa ");
        $result = $query->fetchAll();
        return $result;
    }

    public function registraSolicitacaoLojaAberta($cod_empresa, $data, $hora)
    {
	$data = array('data' => $data,
	    'hora' => $hora,
	    'texto' => "",
	    'cod_empresa' => (int) $cod_empresa,	    
	  );
	try
	{
	    $id = $this->insert($data);
	    return "Ok";
	}
	catch(Exception $e)
	{
	    return "Fail";
	}
	
    }


}

?>
