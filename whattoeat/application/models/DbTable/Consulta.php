<?php

class DbTable_Consulta extends Zend_Db_Table_Abstract {

    protected $_name = 'consulta';

    public function __construct($db) {
        $this->_db = $db;
    }

    

    public function addConsulta($ip, $pais, $cidade, $criterios, $tipo_produto, $caloria, $produto_especial,$latitude,$longitude) {
     
        $data = array('ip' => $ip,
	    'data' => date("Y-m-d H:i:s"),
	    'pais' => $pais,
	    'cidade' => $cidade,
            'criterios' => $criterios,
            'tipo_produto' => $tipo_produto,
            'caloria' => (double) $caloria,
            'produtos_especiais' => $produto_especial,
            'latitude' => $latitude,
            'longitude' => $longitude
	);

        $this->insert($data);

    }

   

}

?>
