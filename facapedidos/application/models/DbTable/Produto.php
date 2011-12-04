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
	    'fator_de_ajuste' => (float) $formData['fator_de_ajuste'],
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
	    'fator_de_ajuste' => (float) $formData['fator_de_ajuste'],
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

    public function deleteRecords($id)
    {
	$data['removed'] = 1;
	$where[] = "cod_produto = $id";
	$t = $this->_db->update('produto', $data, $where);
    }

    public function consultaQBE($produtos, $caloria, $tipos_produto)
    {
	$select = "select P.cod_produto, P.nome , FP.cod_foto, TP.preco, TP.descricao as tamanho, Tipo.nome as tipo,
		    E.nome_fantasia as nome_empresa ";

	//pode ser que nao haja foto de um produto, por isso o LEFT JOIN
	$from = "from produto P LEFT JOIN foto_produto FP ON (P.cod_produto = FP.cod_produto) ,
	tamanho_produto TP, tipo_produto Tipo, empresa E ";

	$where = "where P.removed <> 1 and TP.removed  <> 1 AND P.disponivel = true AND
	P.cod_produto = TP.cod_produto AND
	P.cod_tipo_produto = Tipo.cod_tipo_produto AND P.cod_empresa = E.cod_empresa ";

	$order_by = " ORDER BY P.cod_produto";
	$i = 0;
	if (!empty($produtos))
	{
	    /* ORDER BY (CASE WHEN TransType = 9 THEN 0
	      WHEN TransType = 3 THEN 1
	      WHEN TransType = 1 THEN 2
	      WHEN TransType = 4 THEN 3
	      WHEN TransType = 2 THEN 4 END) */

	    $order_by = "ORDER BY (CASE ";
	    //cria a clausula order by de forma a garantir que o resultado da consulta siga
	    //a ordem retornada pelo Lucene (que é a ordem dos codigos em $produtos)
	    //Isso é necessário para garantir a ordem de relevancia do retorno do Lucene
	    $produtosArray = explode(",", $produtos);
	    foreach ($produtosArray as $produto)
	    {
		$order_by .= " WHEN P.cod_produto = " . $produto . " THEN " . $i;
		$i++;
	    }
	    $order_by .= " END)";

	    //cria a sequencia de variaveis  para poder usar prepared statements
	    $ids = " ";
	    for ($i = 1; $i <= sizeof($produtosArray); $i++)
	    {
		$ids .= " :" . $i;
		if ($i < sizeof($produtosArray))
		{
		    $ids.=",";
		}
	    }

	    $where .= " and  P.cod_produto in ( " . $ids . " ) ";
	}

	if (!empty($caloria))
	{
	    $where .= " and P.valor_calorico < :" . $i;
	}

	if (!empty($tipos_produto))
	{
	    $ids = " ";
	    for ($k = 1; $k <= sizeof($tipos_produto); $k++)
	    {
		$ids .= " :" . ++$i;
		if ($k < sizeof($tipos_produto))
		{
		    $ids.=",";
		}
	    }
	    $where .= " and P.cod_tipo_produto in ( " . $ids . " ) ";
	}

	$stm = $this->_db->prepare($select . $from . $where . $order_by );

	//    ********* Bind de parametros ********** 

	$j = 0;
	if (!empty($produtos))
	{
	    for ($j = 1; $j <= sizeof($produtosArray); $j++)
	    {
		$stm->bindParam(':' . $j, $produtosArray[$j - 1], PDO::PARAM_INT);
	    }
	}

	if (!empty($caloria))
	{
	    $stm->bindParam(':' . $j, $caloria, PDO::PARAM_INT);
	}

	if (!empty($tipos_produto))
	{
	    for ($k = 1; $k <= sizeof($tipos_produto); $k++)
	    {
		$stm->bindParam(':'.++$j, $tipos_produto[$k-1], PDO::PARAM_INT);
	    }
	}

	$stm->execute();
	return $stm->fetchAll(PDO::FETCH_ASSOC);
	//return $stm;
    }

}

?>
