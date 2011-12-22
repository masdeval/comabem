<?php

define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../application'));

class LuceneManager
{

    static function criaDocumentoProduto($empresaId, $produtoId,$produto)
    {
	$DbTable_Empresa = new DbTable_Empresa(Zend_Db_Table::getDefaultAdapter());

	$empresa = $DbTable_Empresa->getSingleData($empresaId);

	Zend_Search_Lucene_Analysis_Analyzer::setDefault(new Zend_Search_Lucene_Analysis_Analyzer_Common_Utf8_CaseInsensitive() );
	$doc = new Zend_Search_Lucene_Document();
	//cria ou abre o indice
	try
	{
	    //tenta abrir
	    $index = new Zend_Search_Lucene(APPLICATION_PATH . DIRECTORY_SEPARATOR . 'lucene' . DIRECTORY_SEPARATOR . 'index');
	}
	catch (Exception $e)
	{
	    //se nao conseguir, cria um indice novo
	    $index = new Zend_Search_Lucene(APPLICATION_PATH . DIRECTORY_SEPARATOR . 'lucene' . DIRECTORY_SEPARATOR . 'index', true);
	}
	//remove o produto para nao gerar entradas duplicadas
	$hit = $index->find("cod_produto:".$produtoId);
	if(count($hit) > 0)
	{
	    $index->delete($hit[0]->id);
	}
	
	//cria um novo documento
	// Field is indexed and stored within the index.
	//Esse campo sera importante para recuperar exatamente esse documento quando precisar
	$doc->addField(Zend_Search_Lucene_Field::Keyword('cod_produto', $produtoId));

	// Field is not indexed, but is stored in the index.
	//$doc->addField(Zend_Search_Lucene_Field::UnIndexed('created', time()));
	$doc->addField(Zend_Search_Lucene_Field::UnIndexed('cod_empresa', $empresaId));
	
	// Binary String valued Field that is not tokenized nor indexed,
	// but is stored in the index.
	//$doc->addField(Zend_Search_Lucene_Field::Binary('icon',$iconData));

	// Field is tokenized and indexed, and is stored in the index.
	//descricao do produto
	$doc->addField(Zend_Search_Lucene_Field::Text('descricao', utf8_decode($produto['descricao'])),"UTF-8");
	//nome do produto
	$doc->addField(Zend_Search_Lucene_Field::Text('nome_produto', utf8_decode($produto['nome'])),"UTF-8");
	//nome da empresa
	$doc->addField(Zend_Search_Lucene_Field::Text('nome_empresa', utf8_decode($empresa['nome_fantasia'])),"UTF-8");

	// Field is tokenized and indexed, but is not stored in the index.
	//$doc->addField(Zend_Search_Lucene_Field::UnStored('contents','My document content'));

	$index->addDocument($doc);
	$index->optimize();
    }

    static function search($criterios)
    {
	Zend_Search_Lucene::setResultSetLimit(30);
	Zend_Search_Lucene_Search_QueryParser::setDefaultEncoding('utf-8');
	Zend_Search_Lucene_Analysis_Analyzer::setDefault(new Zend_Search_Lucene_Analysis_Analyzer_Common_Utf8_CaseInsensitive() );

	try
	{
	    $index = Zend_Search_Lucene::open(APPLICATION_PATH . DIRECTORY_SEPARATOR . 'lucene' . DIRECTORY_SEPARATOR . 'index');
	}
	catch(Exception $e)
	{
	    exit;
	}
	$array_criterios = explode(" ",$criterios);

	$query = " ";
	foreach( $array_criterios as $item)
	{
	    $item = trim($item);
	    //$item = (utf8_decode($item));
	    //$item = mb_convert_encoding($item,"utf-8","iso-8859-1");
	    $query .= $item."~0.5 ";
	}

	return $index->find($query);

    }

}

?>