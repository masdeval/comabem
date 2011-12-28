<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Carrinho
 *
 * @author masdeval
 */
class Carrinho
{

    //put your code here

    private $empresas = array();

    public function _construct()
    {

    }

    public function getCarrinho()
    {
	return $this->empresas;
    }

    public function addProduto($cod_empresa, $cod_tamanho_produto, $nome_empresa, $nome_produto, $preco, $tamanho)
    {
	if (!array_key_exists($cod_empresa, $this->empresas))//este é o primeiro produto adicionado dessa empresa
	{
	    $this->empresas[$cod_empresa]['nome_empresa'] = $nome_empresa;
	    $this->empresas[$cod_empresa][$cod_tamanho_produto] = array(
		"nome_produto" => $nome_produto,
		"preco" => $preco,
		"tamanho" => $tamanho,
		"quantidade" => (int) 1,
	    );
	}
	else if (!array_key_exists($cod_tamanho_produto, $this->empresas[$cod_empresa])) //novo produto adicionado em uma empresa ja utilizada
	{
	    $this->empresas[$cod_empresa][$cod_tamanho_produto] = array(
		"nome_produto" => $nome_produto,
		"preco" => $preco,
		"tamanho" => $tamanho,
		"quantidade" => (int) 1,
	    );
	}
	else
	{
	    $this->empresas[$cod_empresa][$cod_tamanho_produto]['quantidade']++;
	}
    }

    public function deleteProduto($cod_empresa, $cod_tamanho_produto)
    {
	if (array_key_exists($cod_empresa, $this->empresas))
	{

	    if (array_key_exists($cod_tamanho_produto, $this->empresas[$cod_empresa]))
	    {
		if ($this->empresas[$cod_empresa][$cod_tamanho_produto]['quantidade'] == 1) //remove o produto
		{
		    unset($this->empresas[$cod_empresa][$cod_tamanho_produto]);
		    //precisa verificar se existe mais algum produto para essa empresa
		    if(sizeof($this->empresas[$cod_empresa]) == 1) //nesse caso sobrou apenas o array empresas[$cod_empresa]['nome_empresa']
			    unset($this->empresas[$cod_empresa]);
		}
		else
		{
		    $this->empresas[$cod_empresa][$cod_tamanho_produto]['quantidade']--;
		}
	    }
	}
    }

    public function alterarQuantidadeProduto($cod_empresa, $cod_tamanho_produto, $quantidade)
    {
	if (array_key_exists($cod_empresa, $this->empresas))
	{

	    if (array_key_exists($cod_tamanho_produto, $this->empresas[$cod_empresa]))
	    {
		if ($quantidade == 0) //remove o produto
		{
		    unset($this->empresas[$cod_empresa][$cod_tamanho_produto]);
		    //precisa verificar se existe mais algum produto para essa empresa
		    if(sizeof($this->empresas[$cod_empresa]) == 1) //nesse caso sobrou apenas o array empresas[$cod_empresa]['nome_empresa']
			    unset($this->empresas[$cod_empresa]);
		}
		else
		{
		    $this->empresas[$cod_empresa][$cod_tamanho_produto]['quantidade'] = $quantidade;
		}
	    }
	}


    }

}

?>
