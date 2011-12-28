<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PedidoEmpresaDAO
 *
 * @author masdeval
 */
class DbTable_PedidoEmpresaDAO extends Zend_Db_Table_Abstract
{

    //put your code here

    protected $_name = 'pedido_empresa';

    public function __construct($db)
    {
	$this->_db = $db;
    }

    public function add($data)
    {

	$this->insert($data);

    }

}

?>
