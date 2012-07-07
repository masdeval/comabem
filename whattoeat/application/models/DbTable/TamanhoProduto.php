<?php

class DbTable_TamanhoProduto extends Zend_Db_Table_Abstract
{

    protected $_name = 'tamanho_produto';

    public function __construct($db)
    {
        $this->_db = $db;
    }

    public function getRecords($tamanhoId)
    {
        $query = $this->_db->query("SELECT * FROM tamanho_produto WHERE cod_tamanho_produto=$tamanhoId AND removed=0");

        $result = $query->fetchAll();
        return $result[0];
    }

    public function add($formData, $cod_produto)
    {

        $tamanhoId = $formData['tamanhoId'];
        if (empty($tamanhoId)) //eh uma adicao
        {
            $data = array(
                'cod_produto' => $cod_produto,
                'descricao' => $formData['descricao'],
                'preco' => (float) $formData['preco'],
                'numero_sabores_pizza' => (int) $formData['numero_sabores_pizza'],
                'removed' => 0,
            );
            $tid = $this->insert($data);
        } else
        {
            $data = array(
                'cod_produto' => $cod_produto,
                'descricao' => $formData['descricao'],
                'preco' => (float) $formData['preco'],
                'numero_sabores_pizza' => (int) $formData['numero_sabores_pizza'],
            );

            $where[] = "cod_tamanho_produto= $tamanhoId";
            $t = $this->_db->update('tamanho_produto', $data, $where);
            $tid = $tamanhoId;
        }
        return $tid;
    }

    public function deleteRecords($id)
    {
        $data['removed'] = 1;
        $where[] = "cod_tamanho_produto = $id";
        $t = $this->_db->update('tamanho_produto', $data, $where);
        $data['removed'] = 1;
        $where[] = "cod_tamanho_produto = $id";
        $t = $this->_db->update('promocao', $data, $where);
    }

    public function getDropDown($cod_produto)
    {
        $query = $this->_db->query("SELECT cod_tamanho_produto,descricao FROM tamanho_produto where  cod_produto =$cod_produto AND removed=0 ");
        $res = $query->fetchAll();
        $result[''] = 'Select To edit';
        foreach ($res as $k => $row)
        {
            $result[$row['cod_tamanho_produto']] = $row['descricao'];
        }
        return $result;
    }

}

?>
