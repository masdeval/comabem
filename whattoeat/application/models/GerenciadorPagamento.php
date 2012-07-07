<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of GerenciadorPagamento
 *
 * @author masdeval
 */
abstract class GerenciadorPagamento {
    //put your code here

    abstract public  function enviaPagamento(Pedido $pedido);

    abstract public function getStatusPagamento($codigo);

}
?>
