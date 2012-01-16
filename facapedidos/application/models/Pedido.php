<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Uma abstracao de pedido com os dados suficientes para serem utilizados por um player de pagamento online.
 *
 * @author masdeval
 */
class Pedido
{

    private $itens =  array();
    private $cliente;
    private $id;

    public function __construct($id = '', Cliente $cliente = null, Array $itens = null)
    {
	if(!empty($id))
	    $this->id = $id;

	if ($cliente)
	    $this->cliente = $cliente;

	if ($itens)
	    $this->itens = $itens;
    }

    public function getId()
    {
	return $this->id;
    }

    public function setId($id)
    {
	$this->id = $id;
    }

    public function getItens()
    {
	return $this->itens;
    }

    public function getItem($id, $indice)
    {
	return $this->itens[$id][$indice];
    }


    public function addItem(ItemPedido $item)
    {
	$this->itens[$item->getId()][$item->getIndice()] = $item;
    }

    public function setItens(array $itens)
    {
	$this->itens = $itens;
    }

    public function getCliente()
    {
	return $this->cliente;
    }

    public function setCliente(Cliente $cliente)
    {
	$this->cliente = $cliente;
    }

    public function calcularTotal()
    {
	$x = 0.0;
	$keys = array_keys($this->itens);
	foreach($keys as $key)
	{
	    foreach($this->itens[$key] as $item)
	    {
		$x += $item->getValor();
	    }
	    	    
	}

	return $x;
    }

}

?>
