<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Cliente
 *
 * @author masdeval
 */
class Cliente {
    //put your code here

    private $id;
    private $nomeExibicao;
    private $nomeCompleto;
    private $email;
    private $celular;
    private $ddd;


    public function __construct($id, $nome, $email, $telefone)
    {
	$this->id = $id;
	$this->nomeCompleto = $nome;
	$aux = explode(" ",$nome);
	$this->nomeExibicao = $aux[0];
	$this->email = $email;
	$this->celular = $telefone;
    }

    public function getId()
    {
	return $this->id;
    }

    public function getNomeExibicao()
    {
	return $this->nomeExibicao;
    }

    public function getNomeCompleto()
    {
	return $this->nomeCompleto;
    }

    public function getTelefoneCelularSemDDD()
    {
	return substr($this->celular,5);
    }

    public function getTelefoneCelular()
    {
	return $this->celular;
    }

    public function getDDD()
    {
	return substr($this->celular,1,2);
    }

    public function getEmail()
    {
	return $this->email;
    }
}
?>
