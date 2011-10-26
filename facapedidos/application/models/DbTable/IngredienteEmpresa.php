<?php

class DbTable_IngredienteEmpresa extends Zend_Db_Table_Abstract
{

    protected $_name = 'ingrediente_empresa';

    public function __construct($db)
    {
        $this->_db = $db;
    }


    /*
     * Retorna os ingredientes que uma empresa ainda nao customizou.
     *
     */
     public function getIngredientesAindaNaoCustomizadosDropDown($empresaId)
    {

        $query = $this->_db->query("SELECT cod_ingrediente,nome FROM ingrediente where cod_ingrediente not in (SELECT I.cod_ingrediente FROM ingrediente I , ingrediente_empresa IE  WHERE  (IE.cod_ingrediente=I.cod_ingrediente) and IE.cod_empresa=$empresaId and IE.removed=0) ORDER BY  nome ");
        $dat = $query->fetchAll();
        foreach ($dat as $k => $row)
        {
            $result[$row['cod_ingrediente']] = $row['nome'];
        }
        return $result;
    }

    /*
     * Retorna os ingredientes que uma empresa ja customizou.
     *
     */

    public function getIngredientesJaCustomizadosDropDown($empresaId)
    {

        $query = $this->_db->query("SELECT I.cod_ingrediente, I.nome FROM ingrediente I , ingrediente_empresa IE  WHERE  (IE.cod_ingrediente=I.cod_ingrediente) and IE.cod_empresa=$empresaId and IE.removed=0  ORDER BY  nome ");
        $dat = $query->fetchAll();
        foreach ($dat as $k => $row)
        {
            $result[$row['cod_ingrediente']] = $row['nome'];
        }
        return $result;
    }


    public function getRecords($code_empresa)
    {

        $query = $this->_db->query("SELECT IE.*,E.razao_social,I.nome FROM ingrediente_empresa IE LEFT JOIN empresa E ON (IE.cod_empresa=E.cod_empresa) LEFT JOIN ingrediente I ON (IE.cod_ingrediente=I.cod_ingrediente) WHERE IE.cod_empresa=$code_empresa and IE.removed=0 ORDER BY  I.nome ");
        $result = $query->fetchAll();
        return $result;
    }

    /*  public function getAllRecords()
      {

      $query = $this->_db->query("SELECT IE.*,E.razao_social,I.nome FROM ingrediente_empresa IE LEFT JOIN empresa E ON (IE.cod_empresa=E.cod_empresa) LEFT JOIN ingrediente I ON (IE.cod_ingrediente=I.cod_ingrediente) WHERE IE.removed=0 ORDER BY  I.nome ");
      $result = $query->fetchAll();
      return $result;
      } */

    public function getSingleData($ingredienteId, $empresaId)
    {
        $query = $this->_db->query("SELECT * FROM ingrediente_empresa where cod_ingrediente='$ingredienteId' AND cod_empresa=$empresaId and removed=0");
        $result = $query->fetchAll();
        $result = $result[0];
        return $result;
    }

    public function addRecord($formData, $cod_ingrediente, $cod_empresa, $logoFileName)
    {
        $now = date("Y-m-d H:i:s");
        $data = array('cod_ingrediente' => $cod_ingrediente,
            'cod_empresa' => $cod_empresa,
            'descricao' => $formData['descricao'],
            'preco_quando_adicional' => (float) $formData['preco_quando_adicional'],
        );
        $id = $this->insert($data);

        $logoFileName = bin2hex($logoFileName);
        if (!empty($logoFileName))
        {
            $this->_db->query("UPDATE ingrediente_empresa SET imagem=decode('{$logoFileName}' , 'hex')  WHERE cod_ingrediente = $cod_ingrediente AND cod_empresa=$cod_empresa ");
        }

        return $id;
    }

    public function editRecord($formData, $cod_ingrediente, $cod_empresa, $logoFileName)
    {
        $data = array('cod_ingrediente' => $cod_ingrediente,
            'cod_empresa' => $cod_empresa,
            'descricao' => $formData['descricao'],
            'preco_quando_adicional' => (float) $formData['preco_quando_adicional'],
        );


        if ($logoFileName == "remover")
        {
            //Mesmo pegando a conexao dessa maneira a trasacao funciona corretamente
            $this->getAdapter()->getConnection()->query("UPDATE ingrediente_empresa SET imagem=NULL  WHERE cod_ingrediente = $cod_ingrediente AND cod_empresa=$cod_empresa ");
        } else
        {
            $logoFileName = bin2hex($logoFileName);
            if (!empty($logoFileName))
            {
                $this->getAdapter()->getConnection()->query("UPDATE ingrediente_empresa SET imagem=decode('{$logoFileName}' , 'hex')  WHERE cod_ingrediente = $cod_ingrediente AND cod_empresa=$cod_empresa ");
            }
        }

        $where[] = "cod_ingrediente = $cod_ingrediente";
        $where[] = "cod_empresa = $cod_empresa";
        $t = $this->_db->update('ingrediente_empresa', $data, $where);

        
        return $t;
    }

    public function getImageData($ingredienteId, $empresaId)
    {

        $query = $this->_db->query("SELECT encode(imagem, 'base64') AS data FROM ingrediente_empresa  WHERE cod_ingrediente = '$ingredienteId' and cod_empresa=$empresaId ");
        $res = $query->fetchAll();
        $res = $res[0];
        $data = $res['data'];
        //$data=base64_decode($data);
        return $data;
    }

    public function checkDuplicateRec($empresaId, $ingredienteId)
    {
        $query = $this->_db->query("SELECT cod_ingrediente FROM ingrediente_empresa WHERE cod_empresa=$empresaId AND cod_ingrediente=$ingredienteId");
        $result = $query->fetchAll();
        if (!empty($result))
        {
            return false;
        } else
        {
            return true;
        }
    }

    public function deleteRecords($empresaId, $ingredienteId)
    {
        $data['removed'] = 1;
        $where[] = "cod_empresa = $empresaId";
        $where[] = "cod_ingrediente = $ingredienteId";
        $t = $this->_db->update('ingrediente_empresa', $data, $where);
    }

}

?>
