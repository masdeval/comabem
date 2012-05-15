<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PagSeguroAdapter
 *
 * @author masdeval
 */
require_once('domain/PagSeguroPaymentRequest.class.php');

class PagSeguroAdapter extends GerenciadorPagamento
{

    //put your code here

    public function enviaPagamento(Pedido $pedido)
    {
	$paymentRequest = new PagSeguroPaymentRequest();
	$paymentRequest->setCurrency("BRL");
	//relaciona o numero do pedido aa transacao de pagamento que sera criada no PagSeguro
	$paymentRequest->setReference($pedido->getId());
	//informando dados do comprador
	$paymentRequest->setSenderName($pedido->getCliente()->getNomeCompleto());
	$paymentRequest->setSenderEmail($pedido->getCliente()->getEmail());
	$paymentRequest->setSenderPhone($pedido->getCliente()->getDDD(), str_replace("-", "", $pedido->getCliente()->getTelefoneCelularSemDDD()));
	//setando os itens
	$keys = array_keys($pedido->getItens());
	$itens = $pedido->getItens();
	foreach ($keys as $key)
	{
	    //$key é o cod_tamanho_produto que é único na aplicacao
	    foreach ($itens[$key] as $indice => $item)
	    {
		$paymentRequest->addItem($item->getId(), $item->getNome(), 1, $item->getValor());
	    }
	}
	//obtem a URL para qual o usuario deve ser direcionado para efetuar o pagamento
	$url = $paymentRequest->register(PagSeguroConfig::getAccountCredentials());
	header('Location: ' . $url);
    }


    public function getStatusPagamento($codigo)// código de notificação ou da transacao
    {
	/* Obtendo o objeto Transaction a partir do código de notificação */
	try
	{
	    $transaction = PagSeguroNotificationService::checkTransaction(PagSeguroConfig::getAccountCredentials(),$codigo);
	}
	catch(Exception $e)
	{}
	if(empty($transaction))//tenta buscar usando o $codigo como codigo de uma transacao e nao apenas de uma notificacao
	{
	    try
	    {
		$transaction = PagSeguroTransactionSearchService::searchByCode(PagSeguroConfig::getAccountCredentials(),$codigo);
	    }
	    catch(Exception $e)
	    {

	    }
	}
	if(empty($transaction)) 
	    return;
	
	/*
	 Esses sao os tipos de transacao retornados pelo PagSeguro.

	Representa o tipo da transação recebida. Os valores mais comuns para este campo e seus respectivos resultados são descritos abaixo.

	Código	Significado
	1	Pagamento: a transação foi criada por um comprador fazendo um pagamento. Este é o tipo mais comum de transação que você irá receber.
	2	Transferência: a transação é uma transferência direta recebida de outro usuário do PagSeguro. É possível bloquear transferências diretas de outros usuários.
	3	Adição de fundos: a transação indica que você adicionou fundos a sua conta PagSeguro.
	4	Cobrança: a transação corresponde a uma cobrança que você enviou a outro usuário PagSeguro e que foi paga por ele.
	5	Bônus: a transação corresponde a um bônus recebido do PagSeguro.

	*/

	/*
	 *
	 Esses sao os Status da transação retornados pelo PagSeguro.

	Informa o código representando o status da transação, permitindo que você decida se deve liberar ou não os produtos ou serviços adquiridos. Os valores possíveis estão descritos no diagrama de status de transações e são apresentados juntamente com seus respectivos códigos na tabela abaixo.

	Código	Significado
	1	Aguardando pagamento: o comprador iniciou a transação, mas até o momento o PagSeguro não recebeu nenhuma informação sobre o pagamento.
	2	Em análise: o comprador optou por pagar com um cartão de crédito e o PagSeguro está analisando o risco da transação.
	3	Paga: a transação foi paga pelo comprador e o PagSeguro já recebeu uma confirmação da instituição financeira responsável pelo processamento.
	4	Disponível: a transação foi paga e chegou ao final de seu prazo de liberação sem ter sido retornada e sem que haja nenhuma disputa aberta.
	5	Em disputa: o comprador, dentro do prazo de liberação da transação, abriu uma disputa.
	6	Devolvida: o valor da transação foi devolvido para o comprador.
	7	Cancelada: a transação foi cancelada sem ter sido finalizada.
	 */


	//Obtem da transacao o status do pagamento para atualizar a tabela pedido
	if($transaction->getType()->getValue() == 1)//verifica se eh uma transacao de pagamento
	{
	    $status = $transaction->getStatus()->getValue();
	    $cod_pedido = $transaction->getReference();
	    $transacao = new TransacaoPagamento();
	    $transacao->setCodPedido((int)$cod_pedido);

	    //Faz a conversao do codigo de status retornado pelo PagSeguro para o codigo dessa aplicacao
	    if($status == 1 || $status == 2)
	    {
		$transacao->setStatus(StatusPagamentoEnum::$EM_ANALISE);
	    }
	    else if($status == 3 || $status == 4)
	    {
		$transacao->setStatus(StatusPagamentoEnum::$CONCLUIDO);
	    }
	    else if($status == 5 || $status == 6 || $status == 7)
	    {
		$transacao->setStatus(StatusPagamentoEnum::$RECUSADO);
	    }
	    return $transacao;

	}

    }




}
?>
