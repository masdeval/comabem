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
class EnviaSMSComtele extends EnviaSMS {

    function enviarSMS($fone, $msg)
    {

	$url_operadora = "http://webapi.comtele.com.br/api/api_fuse_connection.php";
	$url_pedido = "http://webapi.comtele.com.br/api/api_fuse_connection.php?fuse=get_id&user=60303&pwd=ytdsa303";

	$client = new Zend_Http_Client($url_pedido);
    	$response = $client->request('GET');
	$id = $response->getBody();

	$client = new Zend_Http_Client($url_operadora);
	$fone = $this->getDDD($fone).$this->getTelefone($fone);
	$client->setParameterGet(array('fuse'=>'send_msg','id'=>$id,'from'=>'christian',
		'number'=> $fone,'msg'=>$msg));
	try {

	    	$response = $client->request('GET');

	} catch (HttpException $ex) {
	    echo $ex;
	}  

    }


}
?>
