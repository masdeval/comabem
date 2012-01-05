<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Pedido
 *
 * @author masdeval
 */
class DbTable_PedidoDAO extends Zend_Db_Table_Abstract
{

    //put your code here

    protected $_name = 'pedido';

    public function cadastrarPedido($endereco, $pedido, $cliente)
    {
	$PedidoEmpresaDB = new DbTable_PedidoEmpresaDAO($this->_db);
	$ItensPedidoDB = new DbTable_ItensPedidoDAO($this->_db);
	$PedidoPersonalizadoDB = new DbTable_PedidoPersonalizadoDAO($this->_db);
	$SaboresPizzaDB = new DbTable_SaboresPizzaDAO($this->_db);

	$this->_db->beginTransaction();
	try
	{
	    $now = date("Y-m-d H:i:s");
	    $data = array('cod_cliente' => $cliente->getId(),
		'data' => $now,
		'rua' => $endereco['rua'],
		'numero' => (int) $endereco['numero'],
		'complemento' => $endereco['complemento'],
		'telefone' => $endereco['telefone'],
	    );

	    $id_pedido = $this->insert($data);

	    //obtendo pedidos

	    foreach ($pedido as $key_empresa => $tamanhos)
	    {
		$data = array('cod_pedido' => $id_pedido,
		    'cod_empresa' => $key_empresa,
		    'entregar' => ($tamanhos['entregar'] == "1") ? 'true' : 'false',
		    'notificacaoSMS' => ($tamanhos['sms'] == "1") ? 'true' : 'false',
		    'observacao' => $tamanhos['observacao'],
		);

		$PedidoEmpresaDB->add($data);

		foreach ($tamanhos as $key_tamanho => $detalhes)
		{
		    if ($key_tamanho == 'entregar' || $key_tamanho == 'sms' || $key_tamanho == 'observacao')
			continue;

		    $data = array('cod_tamanho_produto' => $key_tamanho,
			'cod_pedido' => $id_pedido,
			'cod_empresa' => $key_empresa,
			'quantidade' => $detalhes['quantidade'],
		    );

		    $ItensPedidoDB->add($data);

		    //obtem os adicionais caso existam
		    $adicionais = $detalhes['adicionais'];
		    if (count($adicionais) > 0)
		    {
			foreach ($adicionais as $indice => $cod_ingredientes)
			{
			    foreach ($cod_ingredientes as $cod_ingrediente)
			    {
				$data = array('cod_tamanho_produto' => $key_tamanho,
				    'cod_pedido' => $id_pedido,
				    'cod_empresa' => $key_empresa,
				    'cod_ingrediente' => $cod_ingrediente,
				    'indice' => $indice,
				);

				$PedidoPersonalizadoDB->add($data);
			    }
			}
		    }

		    //obtem os sabores pizza caso existam
		    $adicionais = $detalhes['sabores_pizza'];
		    if (count($adicionais) > 0)
		    {
			foreach ($adicionais as $indice => $cod_pizzas)
			{
			    foreach ($cod_pizzas as $cod_pizza)
			    {
				$data = array('cod_outro_sabor_pizza' => $cod_pizza,
				    'cod_pedido' => $id_pedido,
				    'cod_empresa' => $key_empresa,
				    'cod_tamanho_produto' => $key_tamanho,
				    'indice' => $indice,
				);

				$SaboresPizzaDB->add($data);
			    }
			}
		    }

		}
	    }

	    $this->_db->commit();
	    return $id_pedido;
	}
	catch (Exception $e)
	{
	    $this->_db->rollback();
	    throw new Exception($e);
	}
    }

}

?>
