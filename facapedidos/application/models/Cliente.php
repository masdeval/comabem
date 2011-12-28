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
    private $telefone;


    public function __construct($id, $nome, $email, $telefone = '')
    {
	$this->id = $id;
	$this->nomeCompleto = $nome;
	$aux = split(" ",$nome);
	$this->nomeExibicao = $aux[0];
	$this->email = $email;
	$this->telefone = $telefone;
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

    public function getTelefone()
    {
	return $this->telefone;
    }

    public function getEmail()
    {
	return $this->email;
    }
}
?>
