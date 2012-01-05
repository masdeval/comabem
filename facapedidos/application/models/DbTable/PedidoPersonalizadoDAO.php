<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PedidoPersonalizadoDAO
 *
 * @author masdeval
 */
class DbTable_PedidoPersonalizadoDAO extends Zend_Db_Table_Abstract
{
    //put your code here

   protected $_name = 'pedido_personalizado';

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
