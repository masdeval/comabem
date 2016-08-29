berto<?php

class DbTable_Empresa extends Zend_Db_Table_Abstract {

    protected $_name = 'empresa';

    public function __construct($db) {
        $this->_db = $db;
    }

    public function getRecords() {
        $query = $this->_db->query("SELECT * FROM empresa where removed <>1 ");
        $result = $query->fetchAll();
        return $result;
    }

    public function addEmpresa($formData, $logoFileName) {

        date_default_timezone_set($formData['timezone']);
        $now = date("Y-m-d H:i:s");
        $data = array('razao_social' => $formData['razao_social'],
            'cnpj' => $formData['cnpj'],
            'rua' => $formData['rua'],
            'numero' => (int) $formData['numero'],
            'cep' => $formData['cep'],
            'complemento' => $formData['complemento'],
            'valor_minimo_entrega' => (float) $formData['valor_minimo_entrega'],
            'nome_fantasia' => $formData['nome_fantasia'],
            'telefone1' => $formData['telefone1'],
            'telefone2' => $formData['telefone2'],
            'bairro' => $formData['bairro'],
            'email' => $formData['email'],
            'url' => preg_replace('/\s+/', '', $this->cleanURI(trim($formData['razao_social']))),
            'desativada' => (int) $formData['desativada'],
            'cod_cidade' => (int) $formData['cod_cidade'],
            'data_cadastro' => $now,
            'timezone' => $formData['timezone'],
            'website' => $formData['website'],
   
        );
        $id = $this->insert($data);


        if (!empty($logoFileName)) {
            $logoFileName = bin2hex($logoFileName);
            $stm = $this->_db->prepare("UPDATE empresa SET logo=decode(:1 , 'hex')  WHERE cod_empresa = :2 ");
            $stm->bindParam(':1', $logoFileName, PDO::PARAM_LOB);
            $stm->bindParam(':2', $id, PDO::PARAM_INT);
            $stm->execute();
        }
        return $id;
    }

    public function cleanURI($input) {
        $map = array(
            'á' => 'a',
            'à' => 'a',
            'ã' => 'a',
            'â' => 'a',
            'é' => 'e',
            'ê' => 'e',
            'í' => 'i',
            'ó' => 'o',
            'ô' => 'o',
            'õ' => 'o',
            'ú' => 'u',
            'ü' => 'u',
            'ç' => 'c',
            'Á' => 'A',
            'À' => 'A',
            'Ã' => 'A',
            'Â' => 'A',
            'É' => 'E',
            'Ê' => 'E',
            'Í' => 'I',
            'Ó' => 'O',
            'Ô' => 'O',
            'Õ' => 'O',
            'Ú' => 'U',
            'Ü' => 'U',
            'Ç' => 'C'
        );
        return ereg_replace(
                '[^a-z0-9-]', '', ereg_replace(
                        ' +', '-',
                        //strtr(utf8_decode(utf8_encode($input)),'ÀÁÃÂÉÊÍÓÕÔÚÜÇàáãâéêíóõôúüç','AAAAEEIOOOUUCaaaaeeiooouuc')
                        strtr(
                                strtolower(($input)), $map
                        )
                )
        );
    }

    public function editEmpresa($formData, $id, $logoFileName) {
        $data = array('razao_social' => $formData['razao_social'],
            'cnpj' => $formData['cnpj'],
            'rua' => $formData['rua'],
            'numero' => (int) $formData['numero'],
            'cep' => $formData['cep'],
            'complemento' => $formData['complemento'],
            'valor_minimo_entrega' => (float) $formData['valor_minimo_entrega'],
            'nome_fantasia' => $formData['nome_fantasia'],
            'telefone1' => $formData['telefone1'],
            'telefone2' => $formData['telefone2'],
            'bairro' => $formData['bairro'],
            'email' => $formData['email'],
            'url' => preg_replace('/\s+/', '', $this->cleanURI(trim($formData['razao_social']))),
            'desativada' => (int) $formData['desativada'],
            'cod_cidade' => (int) $formData['cod_cidade'],
            'timezone' => $formData['timezone'],
            'website' => $formData['website'],
     
        );


        if (!empty($logoFileName)) {
            if ($logoFileName == "remover") {
                $this->_db->query("UPDATE empresa SET logo=NULL  WHERE cod_empresa = '$id' ");
            } else {
                $logoFileName = bin2hex($logoFileName);
                $stm = $this->_db->prepare("UPDATE empresa SET logo=decode(:1 , 'hex')  WHERE cod_empresa = :2 ");
                $stm->bindParam(':1', $logoFileName, PDO::PARAM_LOB);
                $stm->bindParam(':2', $id, PDO::PARAM_INT);
                $stm->execute();
            }
        }
        $where[] = "cod_empresa = $id";
        $t = $this->_db->update('empresa', $data, $where);
        return $t;
    }

    public function getSingleData($id) {
        $query = $this->_db->query("SELECT * FROM empresa where cod_empresa='$id' and removed <> 1");
        $result = $query->fetchAll();
        $result = $result[0];
        return $result;
    }

    public function deleteRecords($id) {
        $data['removed'] = 1;
        $where[] = "cod_empresa = $id";
        $t = $this->_db->update('empresa', $data, $where);
    }

    public function checkDuplicateUrl($url, $id = '') {
        if (!empty($id)) {
            $q = "SELECT url FROM empresa where url='$url' and cod_empresa !='$id' ";
            $query = $this->_db->query($q);
        } else {
            $query = $this->_db->query("SELECT url FROM empresa where url='$url'");
        }
        $res = $query->fetchAll();
        if (count($res) > 0) {
            return 'F';
        } else {
            return 'OK';
        }
    }

    public function getImageData($empresaId) {
        $query = $this->_db->query("SELECT encode(logo, 'base64') AS data FROM empresa  WHERE cod_empresa = '$empresaId' ");
        $res = $query->fetchAll();
        $res = $res[0];
        $data = $res['data'];
        //$data=base64_decode($data);
        return $data;
    }

    public function getEmpresaOptionDropDown() {
        $result[''] = 'Select';
        $dat = $this->fetchAll();
        foreach ($dat as $k => $row) {
            $result[$row->cod_empresa] = $row->razao_social;
        }
        return $result;
    }

    public function getTipoProdutoAssociadoAProduto($cod_empresa) {
        $query = $this->_db->query("SELECT TP.nome,TP.cod_tipo_produto FROM tipos_produtos_empresa TPE, tipo_produto TP, produto P where TPE.cod_tipo_produto=TP.cod_tipo_produto and P.cod_tipo_produto = TPE.cod_tipo_produto and TPE.cod_empresa = $cod_empresa ");
        $res = $query->fetchAll();
        foreach ($res as $k => $row) {
            $result[$row[cod_tipo_produto]] = $row['nome'];
        }
        return $result;
    }

    public function checkUrlExist($url) {

        if (!empty($url)) {
            $query = $this->_db->query("SELECT razao_social, cod_empresa, removed FROM empresa where url='$url'");
        }
        $res = $query->fetchAll();
        if (count($res) > 0 && $res[0]['removed'] == 0) {
            return $res[0];
        } else {
            return false;
        }
    }

    public function getTimezone($id) {
        $query = $this->_db->query("SELECT timezone FROM empresa where cod_empresa='$id' and removed <> 1");
        $result = $query->fetchAll();
        $result = $result[0]['timezone'];
        return $result;
    }

    /*
     * Retorna se um estabelecimento esta aberto ou fechado num determinado dia e hora
     */

    public function isAberto($cod_empresa, $dia_da_semana, $hora) {
        $query = $this->_db->query("SELECT e.cod_empresa, hora_inicio, hora_fim, desativada
	                          FROM empresa e, horario_funcionamento hf
				  WHERE e.cod_empresa = hf.cod_empresa and
				  hf.dia_da_semana = '" . $dia_da_semana . "' and
				  e.cod_empresa = " . $cod_empresa);
        $res = $query->fetchAll();


        if (count($res) <= 0 || $res[0]['desativada'] == true) {
            return false;
        } else {
            if (strtotime($hora) >= strtotime($res[0]['hora_inicio']) && strtotime($hora) <= strtotime($res[0]['hora_fim'])) {
                return true;
            } else {
                return false;
            }
        }
    }

}

?>
