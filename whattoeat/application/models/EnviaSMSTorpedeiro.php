<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of EnviaSMS
 *
 * @author masdeval
 */
class EnviaSMSTorpedeiro extends EnviaSMS {
 
    protected $url_operadora = "http://services.torpedeiro.com/http/sendmsg";
    protected $username = "masdeval";
    protected $password = "";

  // "http://services.torpedeiro.com/http/sendmsg?
    //username=xxxxx&passwd=xxxxx&to=551188888888&content=Mensagem+teste"

    function enviarSMS($fone, $msg)
    {

	$client = new Zend_Http_Client($url_operadora);
	$client->setParameterGet(array('username' => $username,'passwd'=>$password,'to'=>'55'+$this->getDDD($fone)+$this->getTelefone($fone),'content'=>$msg));
	try {

	    	$response = $client->request('GET');

	} catch (HttpException $ex) {
	    echo $ex;
	    return false;
	}

    }


}
?>
