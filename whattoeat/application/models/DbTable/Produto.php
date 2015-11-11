<?php

class DbTable_Produto extends Zend_Db_Table_Abstract
{

    protected $_name = 'produto';

    public function __construct($db)
    {
	$this->_db = $db;
    }

    public function getRecords($empresaId)
    {
	$query = $this->_db->query("SELECT P.*,TP.nome as tipo FROM produto P JOIN tipo_produto TP ON (P.cod_tipo_produto=TP.cod_tipo_produto) where P.removed <>1 and P.cod_empresa = $empresaId");
	$result = $query->fetchAll();
	return $result;
    }

    public function getNomeProdutosByTipo($empresaId, $listaTipoProduto)
    {
	$query = $this->_db->query("SELECT P.nome FROM produto P JOIN tipo_produto TP ON (P.cod_tipo_produto=TP.cod_tipo_produto) where P.removed <>1
              and cod_empresa = $empresaId and  TP.cod_tipo_produto in ($listaTipoProduto)");
	$result = $query->fetchAll();
	return $result;
    }

    public function add($formData, $cod_empresa)
    {

	$data = array('nome' => $formData['nome'],
	    'cod_tipo_produto' => $formData['cod_tipo_produto'],
	    'cod_empresa' => $cod_empresa,
	    'descricao' => $formData['descricao'],
	    'tempo_preparo_minutos' => (int) $formData['tempo_preparo_minutos'],
	    'valor_calorico' => (float) $formData['valor_calorico'],
	    'numero_max_adicionais' => (int) $formData['numero_max_adicionais'],
	    'cobrado_por_quilo' => $formData['cobrado_por_quilo'],
	    'disponivel' => $formData['disponivel'],
	);
	$id = $this->insert($data);

	return $id;
    }

    public function edit($formData, $cod_empresa, $cod_produto)
    {

	$data = array('nome' => $formData['nome'],
	    'cod_tipo_produto' => $formData['cod_tipo_produto'],
	    'cod_empresa' => $cod_empresa,
	    'descricao' => $formData['descricao'],
	    'tempo_preparo_minutos' => (int) $formData['tempo_preparo_minutos'],
	    'valor_calorico' => (float) $formData['valor_calorico'],
	    'numero_max_adicionais' => (int) $formData['numero_max_adicionais'],
	    'cobrado_por_quilo' => $formData['cobrado_por_quilo'],
	    'disponivel' => $formData['disponivel'],
	);


	$where[] = "cod_produto = $cod_produto";
	$t = $this->_db->update('produto', $data, $where);
	return $t;
    }

    public function getSingleData($id)
    {
	$query = $this->_db->query("SELECT P.*,TP.nome as tipo FROM produto P JOIN tipo_produto TP ON (P.cod_tipo_produto=TP.cod_tipo_produto) where P.cod_produto='$id'");
	$result = $query->fetchAll();
	$result = $result[0];
	return $result;
    }
  
    /* Retorna os ingredientes de um produto */
    public function getIngredientes($id)
    {
	$query = $this->_db->query("SELECT I.nome FROM produto P,  ingrediente_empresa_produto IEP, ingrediente I  "
               
                . " where (P.cod_produto=IEP.cod_produto) and (I.cod_ingrediente = IEP.cod_ingrediente) and P.cod_produto='$id'");
	$result = $query->fetchAll();
	$result = $result[0];
	return $result;
    }
    

    public function deleteRecords($id)
    {
	$data['removed'] = 1;
	$where[] = "cod_produto = $id";
	$t = $this->_db->update('produto', $data, $where);
    }

    public function consultaQBE($produtos, $caloria, $tipos_produto, $cod_empresa='')
    {

	$select = "select P.cod_produto, P.nome , P.descricao, FP.cod_foto, TP.cod_tamanho_produto, TP.preco, TP.descricao as tamanho,
	    Tipo.nome as tipo,E.razao_social as razao_social, E.cod_empresa, E.url, E.timezone, Promo.preco_promocional ";

	//pode ser que o estabelecimento nao funcione nesse dia da semana, por isso o LEFT JOIN
	//LEFT JOIN horario_funcionamento HF ON (P.cod_empresa = HF.cod_empresa) ,

	//pode ser que nao haja foto de um produto, por isso o LEFT JOIN
	$from = "from produto P LEFT JOIN foto_produto FP ON (P.cod_produto = FP.cod_produto),
	tamanho_produto TP LEFT JOIN promocao Promo ON (TP.cod_tamanho_produto = Promo.cod_tamanho_produto
	and Promo.data_inicio <= now() and Promo.data_fim >= now() and Promo.removed = 0 )
	, tipo_produto Tipo, empresa E ";

	$where = "where P.removed <> 1 and TP.removed  <> 1 AND P.disponivel = true AND
	P.cod_produto = TP.cod_produto AND E.desativada = false AND E.removed = 0 AND
	P.cod_tipo_produto = Tipo.cod_tipo_produto AND P.cod_empresa = E.cod_empresa ";

	$i = 1;
	if (!empty($cod_empresa))
	{
	    $where .= " AND E.cod_empresa = :" . $i;
	    $i++;
	}

	//preciso ordenar aqui para garantir que todos os produtos que forem retornados mais de uma vez
	//por terem varios tamanhos aparecam juntos no resultado
	$order_by = " ORDER BY P.cod_produto";

	if (!empty($produtos))
	{
	    /* ORDER BY (CASE WHEN TransType = 9 THEN 0
	      WHEN TransType = 3 THEN 1
	      WHEN TransType = 1 THEN 2
	      WHEN TransType = 4 THEN 3
	      WHEN TransType = 2 THEN 4 END) */

	    $order_by = " ORDER BY (CASE ";
	    //cria a clausula order by de forma a garantir que o resultado da consulta siga
	    //a ordem retornada pelo Lucene (que é a ordem dos codigos em $produtos)
	    //Isso é necessário para garantir a ordem de relevancia do retorno do Lucene
	    $produtosArray = explode(",", $produtos);
	    $k = 0;
	    foreach ($produtosArray as $produto)
	    {
		$order_by .= " WHEN P.cod_produto = " . $produto . " THEN " . $k;
		$k++;
	    }
	    $order_by .= " END)";

	    //cria a sequencia de variaveis  para poder usar prepared statements
	    $ids = " ";
	    for ($k = 1; $k <= sizeof($produtosArray); $k++)
	    {
		$ids .= " :" . $i;
		$i++;
		if ($k < sizeof($produtosArray))
		{
		    $ids.=",";
		}
	    }

	    $where .= " and  P.cod_produto in ( " . $ids . " ) ";
	}

	if (!empty($caloria))
	{
	    $where .= " and P.valor_calorico < :" . $i;
	    $i++;
	}

	if (!empty($tipos_produto))
	{
	    $ids = " ";
	    for ($k = 1; $k <= sizeof($tipos_produto); $k++)
	    {
		$ids .= " :" . $i;
		$i++;
		if ($k < sizeof($tipos_produto))
		{
		    $ids.=",";
		}
	    }
	    $where .= " and P.cod_tipo_produto in ( " . $ids . " ) ";
	}

	$stm = $this->_db->prepare($select . $from . $where . $order_by);

	//    ********* Bind de parametros **********
	//date('l') retorna o dia da semana - > achei que ia precisar disso
	//$stm->bindParam(':0', date('l') , PDO::PARAM_STR);

	$j = 1;
	if (!empty($cod_empresa))
	{
	    $stm->bindParam(':' . $j, $cod_empresa, PDO::PARAM_INT);
	    $j++;
	}

	if (!empty($produtos))
	{
	    for ($k = 1; $k <= sizeof($produtosArray); $k++)
	    {
		$stm->bindParam(':' . $j, $produtosArray[$k - 1], PDO::PARAM_INT);
		$j++;
	    }
	}

	if (!empty($caloria))
	{
	    $stm->bindParam(':' . $j, $caloria, PDO::PARAM_INT);
	    $j++;
	}

	if (!empty($tipos_produto))
	{
	    for ($k = 1; $k <= sizeof($tipos_produto); $k++)
	    {
		$stm->bindParam(':' . $j++, $tipos_produto[$k - 1], PDO::PARAM_INT);
	    }
	}

	$stm->execute();
	return $stm->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
     * Obtem todas as informacoes de um produto necessarias para configuracao do pedido
     */

    public function configuracaoProduto($cod_produto)
    {
	$select = " SELECT Tipo_Produto.nome as tipo_produto, Produto.tempo_preparo_minutos, Produto.cobrado_por_quilo, Produto.descricao, Produto.numero_max_adicionais, Categoria_Empresa.nome as categoria_adicional, " .
		" Categoria_Permitida_Como_Adicional.qtd_max_adicionais , Ingrediente.nome as nome_ingrediente, Ingrediente.cod_ingrediente, " .
		" Ingrediente_Empresa.preco_quando_adicional ";


	$from = " from Produto LEFT JOIN Categoria_Permitida_Como_Adicional ON (Produto.cod_produto = Categoria_Permitida_Como_Adicional.cod_produto)
	LEFT JOIN Categoria_Empresa ON (Categoria_Permitida_Como_Adicional.cod_categoria_empresa = Categoria_Empresa.cod_categoria_empresa)
	LEFT JOIN Categoria_Ingrediente_Empresa ON (Categoria_Empresa.cod_categoria_empresa =
	Categoria_Ingrediente_Empresa.cod_categoria_empresa)
	LEFT JOIN Ingrediente_Empresa ON (Categoria_Ingrediente_Empresa.cod_ingrediente = Ingrediente_Empresa.cod_ingrediente)
	LEFT JOIN Ingrediente ON (Ingrediente_Empresa.cod_ingrediente = Ingrediente.cod_ingrediente ), Tipo_produto";

	$where = " WHERE Tipo_Produto.cod_tipo_produto = Produto.cod_tipo_produto AND Produto.cod_produto = :1 ";


	$order_by = " order by Categoria_Empresa.nome ";

	$stm = $this->_db->prepare($select . $from . $where . $order_by);

	$stm->bindParam(':1', $cod_produto, PDO::PARAM_INT);

	$stm->execute();
	return $stm->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getSaboresPizza($cod_empresa)
    {

	$query = " select produto.nome, produto.cod_produto
            from produto , tipo_produto
            where produto.cod_tipo_produto = tipo_produto.cod_tipo_produto
            and cod_empresa = :1 and tipo_produto.nome = 'Pizza'";

	$stm = $this->_db->prepare($query);

	$stm->bindParam(':1', $cod_empresa, PDO::PARAM_INT);

	$stm->execute();
	return $stm->fetchAll(PDO::FETCH_ASSOC);
    }

}

?>
