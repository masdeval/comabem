<?php

class DbTable_Funcionario extends Zend_Db_Table_Abstract
{

    protected $_name = 'funcionario';

    public function __construct($db)
    {
        $this->_db = $db;
    }

    public function getRecords($cod_empresa)
    {
        $query = $this->_db->query("SELECT F.*,E.razao_social as empresa FROM funcionario F LEFT JOIN funcionario_has_empresa FHE ON (F.cod_funcionario=FHE.cod_funcionario) LEFT JOIN empresa E ON (FHE.cod_empresa=E.cod_empresa) where E.cod_empresa = '$cod_empresa' and F.removed <> '1'");
        $result = $query->fetchAll();
        return $result;
    }

    
    public function addFuncionario($formData)
    {
        $now = date("Y-m-d H:i:s");
        $data = array(
            //'cod_empresa' => $formData['cod_empresa'],
            'nome' => $formData['nome'],
            'cpf' => $formData['cpf'],
            'email' => $formData['email'],
            'observacao' => $formData['observacao'],
            'telefone_residencial' => $formData['telefone_residencial'],
            'telefone_comercial' => $formData['telefone_comercial'],
            'celular' => $formData['celular'],
            'endereco' => $formData['endereco'],
            'numero' => $formData['numero'],
            'bairro' => $formData['bairro'],
            'complemento' => $formData['complemento'],
            'cep' => $formData['cep'],
            'senha' => $formData['senha'],
            'data_cadastro' => $now,);

        if (!empty($formData['data_nascimento']))
        {
            list($day, $month, $year) = explode('/', $formData['data_nascimento']);
            $data_nascimento = "$year-$month-$day";
            $data['data_nascimento'] = $data_nascimento;
        }
        $id = $this->insert($data);
        return $id;
    }

    public function editFuncionario($formData, $id)
    {
        $data = array(
            //'cod_empresa' => $formData['cod_empresa'],
            'nome' => $formData['nome'],
            'cpf' => $formData['cpf'],
            'email' => $formData['email'],
            'observacao' => $formData['observacao'],
            'telefone_residencial' => $formData['telefone_residencial'],
            'telefone_comercial' => $formData['telefone_comercial'],
            'celular' => $formData['celular'],
            'endereco' => $formData['endereco'],
            'numero' => $formData['numero'],
            'bairro' => $formData['bairro'],
            'complemento' => $formData['complemento'],
            'cep' => $formData['cep'],
            'senha' => $formData['senha'],
        );

        if (!empty($formData['data_nascimento']))
        {
            list($day, $month, $year) = explode('/', $formData['data_nascimento']);
            $data_nascimento = "$year-$month-$day";
            $data['data_nascimento'] = $data_nascimento;
        }

        $where[] = "cod_funcionario = $id";

        $t = $this->_db->update('funcionario', $data, $where);
        return $t;
    }

    public function getSingleData($id)
    {
        $query = $this->_db->query("SELECT * FROM funcionario where cod_funcionario='$id' and removed <> '1' ");
        $result = $query->fetchAll();
        $result = $result[0];
        return $result;
    }

    public function deleteRecords($id)
    {
        //$this->_db->delete('funcionario', "cod_funcionario =$id");
        $data['removed'] = 1;
        $where[] = "cod_funcionario = $id";
        $t = $this->_db->update('funcionario', $data, $where);
    }

    public function checkEntregaRelation($cod_funcionario)
    {
        $query = $this->_db->query("SELECT cod_funcionario FROM entrega WHERE cod_funcionario=$cod_funcionario");
        $result = $query->fetchAll();
        if (count($result) > 0)
        {
            return true;
        } else
        {
            return false;
        }
    }

    public function getEmpresa($cod_funcionario)
    {

        $query = $this->_db->query("SELECT cod_empresa FROM funcionario_has_empresa WHERE cod_funcionario=$cod_funcionario");
        $result = $query->fetchAll();
        if (count($result) > 0)
            return $result[0]['cod_empresa'];
        else
            return 0;
    }

    public function checkDuplicateCPF($cpf, $id='')
    {
        if (!empty($id))
        {
            $q = "SELECT cpf FROM funcionario where cpf='$cpf' and cod_funcionario !='$id'";
            $query = $this->_db->query($q);
        } else
        {
            $query = $this->_db->query("SELECT cpf FROM funcionario where cpf='$cpf'");
        }
        $res = $query->fetchAll();
        if (count($res) > 0)
        {
            return 'F';
        } else
        {
            return 'OK';
        }
    }

}

?>
