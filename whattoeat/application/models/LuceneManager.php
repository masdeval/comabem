<?php

//define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../application'));

class LuceneManager
{

    static function criaDocumentoProduto($empresaId, $produtoId, $produto)
    {        
	$DbTable_Empresa = new DbTable_Empresa(Zend_Db_Table::getDefaultAdapter());
        $DbTable_Produto = new DbTable_Produto(Zend_Db_Table::getDefaultAdapter());
        Zend_Search_Lucene_Search_QueryParser::setDefaultEncoding("UTF-8");
        Zend_Search_Lucene_Analysis_Analyzer::setDefault(new Zend_Search_Lucene_Analysis_Analyzer_Common_Utf8_CaseInsensitive() );
        
	$empresa = $DbTable_Empresa->getSingleData($empresaId);
        $ingredientes = $DbTable_Produto->getIngredientes($produtoId);

	
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
        $aux = mb_detect_encoding(($produto['descricao']));
        $aux = iconv($aux,"UTF-8//TRANSLIT",strtolower($produto['descricao']));//converte uma string em iso-8859-1 para UTF-8
	$doc->addField(Zend_Search_Lucene_Field::Text('descricao', $aux,"UTF-8"));
	//nome do produto
        $aux = mb_detect_encoding(($produto['nome']));
        $aux = iconv($aux,"UTF-8//TRANSLIT",strtolower($produto['nome']));
	$doc->addField(Zend_Search_Lucene_Field::Text('nome_produto', $aux,"UTF-8"));
	//nome da empresa
        $aux = mb_detect_encoding(($produto['nome_fantasia']));
        $aux = iconv($aux,"UTF-8//TRANSLIT",strtolower($empresa['nome_fantasia']));
	$doc->addField(Zend_Search_Lucene_Field::Text('nome_empresa', $aux,"UTF-8"));
        
        //Adiciona os ingredientes do produto
        foreach ($ingredientes as $value) {
            
            $aux = mb_detect_encoding(($value));
            $aux = iconv($aux,"UTF-8//TRANSLIT",strtolower($value));
            $doc->addField(Zend_Search_Lucene_Field::Text('nome_ingrediente', $aux,"UTF-8"));
                        
        }

	// Field is tokenized and indexed, but is not stored in the index.
	//$doc->addField(Zend_Search_Lucene_Field::UnStored('contents','My document content'));

	$index->addDocument($doc);
	$index->optimize();
    }

    static function search($criterios)
    { 
	Zend_Search_Lucene::setResultSetLimit(30);
	Zend_Search_Lucene_Search_QueryParser::setDefaultEncoding("UTF-8");        
        Zend_Search_Lucene_Analysis_Analyzer::setDefault(new Zend_Search_Lucene_Analysis_Analyzer_Common_Utf8());

		
	$index = Zend_Search_Lucene::open(APPLICATION_PATH . DIRECTORY_SEPARATOR . 'lucene' . DIRECTORY_SEPARATOR . 'index');
	
	
	$array_criterios = explode(" ",$criterios);

	$query = " ";
	foreach( $array_criterios as $item)
	{
	    $item = trim(strtolower($item));
	    //$item = (utf8_decode($item));
	    //$item = mb_convert_encoding($item,"utf-8","iso-8859-1");
	    $query .= $item."~0.5 ";
           // $query .= new Zend_Search_Lucene_Search_Query_Fuzzy(new Zend_Search_Lucene_Index_Term($item), 0.4);
	}

        $resultado = $index->find($query);
	return $resultado;

    }

}

?>