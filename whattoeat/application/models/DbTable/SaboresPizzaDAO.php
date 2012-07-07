<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of SaboresPizzaDAO
 *
 * @author masdeval
 */

class DbTable_SaboresPizzaDAO extends Zend_Db_Table_Abstract
{

    protected $_name = 'sabores_pizza';

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
