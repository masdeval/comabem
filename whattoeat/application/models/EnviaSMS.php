<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author masdeval
 * /
 */
abstract class EnviaSMS {
    //put your code here

    /*
     * Envia um SMS. Retorna true se com sucesso ou false caso contrário.
     *
     */
    abstract function enviarSMS($fone, $msg);


    /*
     * Recebe um telefone celular no formato (99) 9999-9999 e retorna apenas o DDD
     *
     */

    function getDDD($fone)
    {
	return substr($fone,1,2);
    }

    /*
     * Recebe um telefone celular no formato (99) 9999-9999 e retona apenas a parte numerica correspondente ao numero.
     */
    function getTelefone($fone)
    {
	$fone = substr($fone,5);
	$fone = str_replace("-", '', $fone);
	return trim($fone);
    }
}
?>
