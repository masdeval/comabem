<?php

//define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../application'));

class LuceneManager {

    static function criaDocumentoProduto($empresaId, $produtoId, $produto) {
        $DbTable_Empresa = new DbTable_Empresa(Zend_Db_Table::getDefaultAdapter());
        $DbTable_Produto = new DbTable_Produto(Zend_Db_Table::getDefaultAdapter());
        Zend_Search_Lucene_Search_QueryParser::setDefaultEncoding("UTF-8");
        Zend_Search_Lucene_Analysis_Analyzer::setDefault(new Zend_Search_Lucene_Analysis_Analyzer_Common_Utf8_CaseInsensitive());

        $empresa = $DbTable_Empresa->getSingleData($empresaId);
        $ingredientes = $DbTable_Produto->getIngredientes($produtoId);


        $doc = new Zend_Search_Lucene_Document();
        //cria ou abre o indice
        try {
            //tenta abrir
            $index = new Zend_Search_Lucene(APPLICATION_PATH . DIRECTORY_SEPARATOR . 'lucene' . DIRECTORY_SEPARATOR . 'index');
        } catch (Exception $e) {
            //se nao conseguir, cria um indice novo
            $index = new Zend_Search_Lucene(APPLICATION_PATH . DIRECTORY_SEPARATOR . 'lucene' . DIRECTORY_SEPARATOR . 'index', true);
        }
        //remove o produto para nao gerar entradas duplicadas
        $hit = $index->find("cod_produto:" . $produtoId);
        if (count($hit) > 0) {
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
        
        //desfriao de empresa
        //nome da empresa
        $aux = mb_detect_encoding(($empresa['razao_social']));
        $aux = iconv($aux, "UTF-8//TRANSLIT", strtolower($empresa['razao_social']));
        $doc->addField(Zend_Search_Lucene_Field::Text('nome_empresa', $aux, "UTF-8"));
        //endereco da emrpesa
        $aux = mb_detect_encoding(($empresa['rua']));
        $aux = iconv($aux, "UTF-8//TRANSLIT", strtolower($empresa['rua']));
        $doc->addField(Zend_Search_Lucene_Field::Text('rua_empresa', $aux, "UTF-8"));

         
        //descricao do produto
        $aux = mb_detect_encoding(($produto['descricao']));
        $aux = iconv($aux, "UTF-8//TRANSLIT", strtolower($produto['descricao'])); //converte uma string em iso-8859-1 para UTF-8
        $doc->addField(Zend_Search_Lucene_Field::Text('descricao', $aux, "UTF-8"));
        //nome do produto
        $aux = mb_detect_encoding(($produto['nome']));
        $aux = iconv($aux, "UTF-8//TRANSLIT", strtolower($produto['nome']));
        $doc->addField(Zend_Search_Lucene_Field::Text('nome_produto', $aux, "UTF-8"));
        
        //Adiciona os ingredientes do produto
        foreach ($ingredientes as $value) {

            $aux = mb_detect_encoding(($value));
            $aux = iconv($aux, "UTF-8//TRANSLIT", strtolower($value));
            $doc->addField(Zend_Search_Lucene_Field::Text('nome_ingrediente', $aux, "UTF-8"));
        }

        // Field is tokenized and indexed, but is not stored in the index.
        //$doc->addField(Zend_Search_Lucene_Field::UnStored('contents','My document content'));

        $index->addDocument($doc);
        $index->optimize();
    }

    static function search($criterios) {
        Zend_Search_Lucene::setResultSetLimit(30);
        Zend_Search_Lucene_Search_QueryParser::setDefaultEncoding("UTF-8");
        Zend_Search_Lucene_Analysis_Analyzer::setDefault(new Zend_Search_Lucene_Analysis_Analyzer_Common_Utf8());


        $index = Zend_Search_Lucene::open(APPLICATION_PATH . DIRECTORY_SEPARATOR . 'lucene' . DIRECTORY_SEPARATOR . 'index');


        $array_criterios = explode(" ", $criterios);

        $query = " ";
        foreach ($array_criterios as $item) {
            $item = trim(strtolower($item));
            $item = str_replace("-", " ", $item); //deu problema busca fuzzy usando -
            //$item = (utf8_decode($item));
            //$item = mb_convert_encoding($item,"utf-8","iso-8859-1");
            $query .= $item . "~0.8 ";
            // $query .= new Zend_Search_Lucene_Search_Query_Fuzzy(new Zend_Search_Lucene_Index_Term($item), 0.4);
        }

        $resultado = $index->find($query);
        return $resultado;
    }

    static function searchDefault($empresa_oferece) {

        Zend_Search_Lucene::setResultSetLimit(30);
        Zend_Search_Lucene_Search_QueryParser::setDefaultEncoding("UTF-8");
        Zend_Search_Lucene_Analysis_Analyzer::setDefault(new Zend_Search_Lucene_Analysis_Analyzer_Common_Utf8());


        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        /*  $sql =    "select P.cod_produto, P.nome , P.descricao, P.valor_calorico, P.valor_calorico_aproximado,FP.cod_foto, TP.cod_tamanho_produto, TP.preco, TP.descricao as tamanho,
          Tipo.nome as tipo,E.razao_social as razao_social, E.cod_empresa, E.rua, E.numero, E.complemento, E.bairro, E.url, E.timezone,
          E.telefone1, E.telefone2, E.email, E.website, Promo.preco_promocional from produto P LEFT JOIN foto_produto FP ON (P.cod_produto = FP.cod_produto),
          tamanho_produto TP LEFT JOIN promocao Promo ON (TP.cod_tamanho_produto = Promo.cod_tamanho_produto
          and Promo.data_inicio <= now() and Promo.data_fim >= now() and Promo.removed = 0 )
          , tipo_produto Tipo, empresa E where P.removed <> 1 and TP.removed  <> 1 AND P.disponivel = true AND
          P.cod_produto = TP.cod_produto AND E.desativada = false AND E.removed = 0 AND
          P.cod_tipo_produto = Tipo.cod_tipo_produto AND P.cod_empresa = E.cod_empresa limit 5"; */

        $select = "select P.cod_produto, P.nome , P.descricao, P.valor_calorico, P.valor_calorico_aproximado,FP.cod_foto, TP.cod_tamanho_produto, TP.preco, TP.descricao as tamanho,
	    Tipo.nome as tipo,E.razao_social as razao_social, E.cod_empresa, E.rua, E.numero, E.complemento, E.bairro, E.url, E.timezone, 
            E.telefone1, E.telefone2, E.email, E.website, Promo.preco_promocional ";


        $from = "from produto P LEFT JOIN foto_produto FP ON (P.cod_produto = FP.cod_produto),
	tamanho_produto TP LEFT JOIN promocao Promo ON (TP.cod_tamanho_produto = Promo.cod_tamanho_produto
	and Promo.data_inicio <= now() and Promo.data_fim >= now() and Promo.removed = 0 )
	, tipo_produto Tipo, empresa E ";

        $where = "where P.removed <> 1 and TP.removed <> 1 AND P.disponivel = true AND
	P.cod_produto = TP.cod_produto AND E.desativada = false AND E.removed = 0 AND
	P.cod_tipo_produto = Tipo.cod_tipo_produto AND P.cod_empresa = E.cod_empresa ";

        $limit = "limit 5";


        $i = 1;

        if (!empty($empresa_oferece)) {
            $where .= " and ( ";
            for ($k = 0; $k < sizeof($empresa_oferece); $k++) {
                if ($empresa_oferece[$k] == 'diabetico') {
                    $where .= "P.atende_diabetico = 'true' or ";
                    $i++;
                } else if ($empresa_oferece[$k] == 'pouco_sal') {
                    $where .= "P.pouco_sal = 'true' or ";
                    $i++;
                } else if ($empresa_oferece[$k] == 'sem_glutem') {
                    $where .= "P.sem_glutem = 'true' or ";
                    $i++;
                } else if ($empresa_oferece[$k] == 'lactose') {
                    $where .= "P.intolerancia_lactose = 'true' or ";
                    $i++;
                } else if ($empresa_oferece[$k] == 'organico') {
                    $where .= "P.organicos = 'true' or ";
                    $i++;
                }
            }
            $where .= " FALSE) ";
        }



        $sql = $select . $from . $where . $limit;
        $stmt = $db->query($sql);
        $resultado = $stmt->fetchAll();

        return $resultado;
    }

    static function recriateLuceneDatabase(){
        
        $db = Zend_Db_Table::getDefaultAdapter();
        $dbProduto = new DbTable_Produto($db);
        $dbEmpresa = new DbTable_Empresa($db);
        
        $empresas = $dbEmpresa->fetchAll();
        foreach($empresas as $empresa)
        {
            $produtos = $dbProduto->getRecords($empresa['cod_empresa']);
            foreach($produtos as $produto)
            {
                LuceneManager::criaDocumentoProduto($empresa['cod_empresa'], $produto['cod_produto'], $produto);
            }
            
        }
    }
    
}

?>
