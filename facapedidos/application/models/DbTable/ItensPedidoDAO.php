<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ItensPedidoDAO
 *
 * @author masdeval
 */
class DbTable_ItensPedidoDAO extends Zend_Db_Table_Abstract
{
    protected $_name = 'itens_pedido';

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
