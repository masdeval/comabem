<?php

class DbTable_TiposProdutosEmpresa extends Zend_Db_Table_Abstract {

    protected $_name = 'tipos_produtos_empresa';
    protected $_sequence = array('cod_tipo_produto', 'cod_empresa');

    public function getRecords($cod_empresa) {
        $query = $this->_db->query("SELECT * FROM tipos_produtos_empresa where  cod_empresa =$cod_empresa ");
        $res = $query->fetchAll();
        foreach ($res as $k => $row) {
            $result[] = $row['cod_tipo_produto'];
        }
        return $result;
    }

    public function addRecord($empID, $formData) {
        foreach ($formData['cod_tipo_produto'] as $k => $v) {
            $data = array('cod_tipo_produto' => (int) $v,
                'cod_empresa' => $empID,);
            $this->_db->insert('tipos_produtos_empresa', $data);
        }
    }

    public function editRecord($empID, $formData) {

        /* Uma empresa pode trabalhar com varios tipos de produtos e isso é controlado nessa tabela.
         * Essa tabela possui uma chave composta formada por COD_TIPO_PRODUTO E COD_EMPRESA.
         * Quando os produtos de uma empresa sao cadastrados deve-se informar qual é o seu tipo. É apresentada 
         * uma lista apenas com os tipos de produto da empresa em questao.
         * 
         * Obs: Nao é permitido remover um tipo de produto de uma empresa caso já exista algum produto dessa
         * empresa relacionado com o tipo que pretende-se excluir. (integridade referencial)
         */

        $this->_db->delete('tipos_produtos_empresa', "cod_empresa = $empID");
     
        //O conteudo desse array são os codigos de tipos de produtos que devem permanecer cadastrados
        foreach ($formData['cod_tipo_produto'] as $k => $v) {
            $data = array('cod_tipo_produto' => (int) $v,
                'cod_empresa' => $empID,);
            $this->_db->insert('tipos_produtos_empresa', $data);
        }

    }

    public function deleteRecords($empresaId) {
        $this->_db->delete('tipos_produtos_empresa', "cod_empresa = $empresaId");
    }

    public function getCodTipoProductoDropDown($cod_empresa) {
        $query = $this->_db->query("SELECT TP.nome,TP.cod_tipo_produto FROM tipos_produtos_empresa TPE LEFT JOIN tipo_produto TP ON (TPE.cod_tipo_produto=TP.cod_tipo_produto) where  TPE.cod_empresa =$cod_empresa ");
        $res = $query->fetchAll();
        foreach ($res as $k => $row) {
            $result[$row[cod_tipo_produto]] = $row['nome'];
        }
        return $result;
    }

}

?>