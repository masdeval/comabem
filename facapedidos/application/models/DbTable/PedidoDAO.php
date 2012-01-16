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

    public function cadastrarPedido($endereco, $carrinho, $detalhesPedido, $cliente, Pedido $pedidoObject)
    {
	$pedidoEmpresaDB = new DbTable_PedidoEmpresaDAO($this->_db);
	$itensPedidoDB = new DbTable_ItensPedidoDAO($this->_db);
	$pedidoPersonalizadoDB = new DbTable_PedidoPersonalizadoDAO($this->_db);
	$saboresPizzaDB = new DbTable_SaboresPizzaDAO($this->_db);
	$ingredienteEmpresaDB = new DbTable_IngredienteEmpresa($this->_db);

	$this->_db->beginTransaction();
	try
	{
	    /*TODO Melhorar o timezone para obter valor de acordo com localizacao do usuario*/
	    date_default_timezone_set("America/Sao_Paulo");
	    $now = date("Y-m-d H:i:s");
	    $data = array('cod_cliente' => $cliente->getId(),
		'data' => $now,
		'rua' => $endereco['rua'],
		'numero' => (int) $endereco['numero'],
		'complemento' => $endereco['complemento'],
		'telefone' => $endereco['telefone'],
		'status_pedido' => 0,//indica um pedido recem criado
	    );

	    $id_pedido = $this->insert($data);

	    //Inicio da criacao do objeto Pedido que sera usado para efetuar uma transacao de pagamento
	    $pedidoObject->setId($id_pedido);


	    //obtendo pedidos
	    foreach ($detalhesPedido as $key_empresa => $tamanhos)
	    {
		$data = array('cod_pedido' => $id_pedido,
		    'cod_empresa' => $key_empresa,
		    'entregar' => ($tamanhos['entregar'] == "1") ? 'true' : 'false',
		    'notificacaoSMS' => ($tamanhos['sms'] == "1") ? 'true' : 'false',
		    'observacao' => $tamanhos['observacao'],
		);

		$pedidoEmpresaDB->add($data);


		foreach ($tamanhos as $key_tamanho => $detalhes)
		{
		    if (!is_numeric($key_tamanho))
			continue;

		    $data = array('cod_tamanho_produto' => $key_tamanho,
			'cod_pedido' => $id_pedido,
			'cod_empresa' => $key_empresa,
			'quantidade' => $detalhes['quantidade'],
		    );

		    $itensPedidoDB->add($data);
		    //Cria um objeto Item que representa um produto
		    //Se a quantidade for > 1 sera criado um item para cada uma delas
		    //Achei melhor fazer isso ja que dois itens do mesmo produto podem ter precos diferentes
		    //de acordo com os adicionais que tiverem
		    for($k = 0; $k < $detalhes['quantidade']; $k++)
		    {
			$item = new ItemPedido();
			$item->setId($key_tamanho);
			$item->setIndice($k+1);//esse indice serve para diferenciar dois produtos iguais escolhidos
			$item->setQuantidade(1); //sempre sera 1
			$item->setNome($carrinho[$key_empresa][$key_tamanho]['nome_produto']);
			$item->setValor($carrinho[$key_empresa][$key_tamanho]['preco']);
			$pedidoObject->addItem(clone $item);
		    }

		    //Obtem os adicionais caso existam
		    $adicionais = $detalhes['adicionais'];
		    if (count($adicionais) > 0)
		    {
			//Esta em um dos produtos (pode haver mais que um dependendo da quantidade escolhida)
			foreach ($adicionais as $indice => $cod_ingredientes)
			{
			    $somaAdicional = 0.0;
			    //Varre todos os ingredientes adicionais para um determinado item ($indice)
			    foreach ($cod_ingredientes as $cod_ingrediente)
			    {
				$data = array('cod_tamanho_produto' => $key_tamanho,
				    'cod_pedido' => $id_pedido,
				    'cod_empresa' => $key_empresa,
				    'cod_ingrediente' => $cod_ingrediente,
				    'indice' => $indice,
				);

				$pedidoPersonalizadoDB->add($data);

				//Vai somando os custos de cada adicional para um item
				$somaAdicional += $ingredienteEmpresaDB->getPrecoAdicional($cod_ingrediente, $key_empresa);
				
			    }
			    //Terminou de varrer os adicionais escolhidos para um item
			    //O preco desse item deve ser acrescido desse valor
			    $item = $pedidoObject->getItem($key_tamanho, $indice);
			    $item->setValor($somaAdicional + $item->getValor());
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

    public function alterarStatusPedido($codPedido, $status)
    {
	$data = array(
	    "status_pedido" => $status,
	);
	$where[] = "cod_pedido = $codPedido";
	$t = $this->update($data, $where);
 
    }

}

?>
