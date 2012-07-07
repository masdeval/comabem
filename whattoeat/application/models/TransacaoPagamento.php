<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TransacaoPagamento
 *
 * @author masdeval
 */
class TransacaoPagamento {
    //put your code here

    private $codPedido;
    private $status;

    public function getCodPedido()
    {
	return $this->codPedido;
    }

    public function setCodPedido($cod)
    {
	$this->codPedido = $cod;
    }

    public function getStatus()
    {
	return $this->status;
    }

    public function setStatus($status)
    {
	$this->status = $status;
    }

}
?>
