<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Um item de pedido que sera enviado a um playe de pagamento.
 *
 * @author masdeval
 */
class ItemPedido {

	public $id;
	private $nome;
	private $quantidade;
	private $valor;
	private $indice;

	/**
	 *
	 * Initializes a new instance of the Item class
	 * @param array $data
	 */
	public function __construct(Array $data = null) {
		if ($data) {
			if (isset($data['id'])) {
				$this->id = $data['id'];
			}
			if (isset($data['nome'])) {
				$this->nome = $data['nome'];
			}
			if (isset($data['quantidade'])) {
				$this->quantidade = $data['quantidade'];
			}
			if (isset($data['valor'])) {
				$this->valor = $data['valor'];
			}
			if (isset($data['indice'])) {
				$this->indice = $data['indice'];
			}

		}
	}


	/**
	 * @return the product identifier
	 */
	public function getId() {
		return $this->id;
	}

	/**
	 * Sets the product identifier
	 * @param String $id
	 */
	public function setId($id) {
		$this->id = $id;
	}

	/**
	 * @return the product description
	 */
	public function getnome() {
		return $this->nome;
	}

	/**
	 * Sets the product description
	 * @param String $description
	 */
	public function setnome($description) {
		$this->nome = $description;
	}

	/**
	 * @return the quantity
	 */
	public function getQuantidade() {
		return $this->quantidade;
	}

	/**
	 * Sets the quantity
	 * @param String $quantity
	 */
	public function setQuantidade($quantity) {
		$this->quantidade = $quantity;
	}

	/**
	 * @return the unit amount for this item
	 */
	public function getValor() {
		return (float) $this->valor;
	}

	/**
	 * sets the unit amount fot this item
	 * @param String $amount
	 */
	public function setValor( $amount) {
		$this->valor =  (float) $amount;
	}

	public function getIndice(){
	    return $this->indice;
	}

	public function setIndice($i)
	{
	    $this->indice = (int) $i;
	}
}
?>
