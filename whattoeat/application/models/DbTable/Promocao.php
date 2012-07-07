<?php

class DbTable_Promocao extends Zend_Db_Table_Abstract
{

    protected $_name = 'promocao';

    public function __construct($db)
    {
	$this->_db = $db;
    }

    public function getRecords($cod_tamanho_produto)
    {
	$query = $this->_db->query("SELECT P.* FROM promocao P JOIN tamanho_produto TP ON (P.cod_tamanho_produto=TP.cod_tamanho_produto)  where P.cod_tamanho_produto =$cod_tamanho_produto AND P.removed <>1 AND TP.removed <>1");
	$result = $query->fetchAll();
	return $result;
    }

    public function add($formData, $cod_produto, $tamanhoId)
    {
	$data = array('cod_produto' => $cod_produto,
	    'preco_promocional' => $formData['preco_promocional'],
	    'anuncio' => $formData['anuncio'],
	    'cod_tamanho_produto' => $tamanhoId,
	);
	if (!empty($formData['data_inicio']))
	{
	    list($day, $month, $year) = explode('/', $formData['data_inicio']);
	    $data_nascimento = "$year-$month-$day";
	    $data['data_inicio'] = $data_nascimento;
	}
	if (!empty($formData['data_fim']))
	{
	    list($day, $month, $year) = explode('/', $formData['data_fim']);
	    $data_nascimento = "$year-$month-$day";
	    $data['data_fim'] = $data_nascimento;
	}
	$id = $this->insert($data);

	return $id;
    }

    public function edit($formData, $cod_promocao, $cod_produto)
    {

	$data = array('cod_produto' => $cod_produto,
	    'preco_promocional' => $formData['preco_promocional'],
	    'anuncio' => $formData['anuncio'],
	);
	if (!empty($formData['data_inicio']))
	{
	    list($day, $month, $year) = explode('/', $formData['data_inicio']);
	    $data_nascimento = "$year-$month-$day";
	    $data['data_inicio'] = $data_nascimento;
	}
	if (!empty($formData['data_fim']))
	{
	    list($day, $month, $year) = explode('/', $formData['data_fim']);
	    $data_nascimento = "$year-$month-$day";
	    $data['data_fim'] = $data_nascimento;
	}


	$where[] = "cod_promocao = $cod_promocao";
	$t = $this->_db->update('promocao', $data, $where);
	return $t;
    }

    public function deleteRecords($id)
    {
	$data['removed'] = 1;
	$where[] = "cod_promocao = $id";
	$t = $this->_db->update('promocao', $data, $where);
    }

    /*
     * Verifica se uma data de promocao coincide com outra promocao ativa no mesmo periodo
     * para o mesmo produto.
     */

    public function isPromocaoSobreposta($cod_tamanho_produto, $data_inicio, $data_fim)
    {
	$query = "select cod_produto from promocao where cod_tamanho_produto = :1 " .
		" and removed = 0 ".  //a promocao deve estar ativa
		" and ((data_inicio between :2 AND :3) OR (data_fim between :2 AND :3)) ";

	$stm = $this->_db->prepare($query);
	$stm->bindParam(':1', $cod_tamanho_produto, PDO::PARAM_INT);
	$stm->bindParam(':2', $data_inicio, PDO::PARAM_STR);
	$stm->bindParam(':3', $data_fim, PDO::PARAM_STR);

	$stm->execute();
	$resultado =  $stm->fetchAll(PDO::FETCH_ASSOC);

	if(count($resultado) > 0)
	    return true;

	$query1 = "select cod_produto from promocao where cod_tamanho_produto = :1 " .
		" and removed = 0 ".  //a promocao deve estar ativa
		" and ((:2 between data_inicio AND data_fim) OR (:3 between data_inicio AND data_fim)) ";

	$stm = $this->_db->prepare($query1);
	$stm->bindParam(':1', $cod_tamanho_produto, PDO::PARAM_INT);
	$stm->bindParam(':2', $data_inicio, PDO::PARAM_STR);
	$stm->bindParam(':3', $data_fim, PDO::PARAM_STR);

	$stm->execute();
	$resultado =  $stm->fetchAll(PDO::FETCH_ASSOC);

	if(count($resultado) > 0)
	    return true;


	return false;
    }

}

?>
