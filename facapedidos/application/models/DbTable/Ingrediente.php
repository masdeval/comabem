<?php

class DbTable_Ingrediente extends Zend_Db_Table_Abstract
{

    protected $_name = 'ingrediente';


    public function getSingleData($ingredienteId)
    {
        $query = $this->_db->query("SELECT * FROM ingrediente where cod_ingrediente='$ingredienteId' ");
        $result = $query->fetchAll();
        $result = $result[0];
        return $result;
    }


    public function getIngredientOptionDropDown()
    {
        $dat = $this->fetchAll();
        foreach ($dat as $k => $row)
        {
            $result[$row->cod_ingrediente] = $row->nome;
        }
        return $result;
    }

    public function getImageData($ingredienteId)
    {

        $query = $this->_db->query("SELECT encode(imagem, 'base64') AS data FROM ingrediente  WHERE cod_ingrediente = '$ingredienteId' ");
        $res = $query->fetchAll();
        $res = $res[0];
        $data = $res['data'];
        //$data=base64_decode($data);
        return $data;
    }

    public function editRecord($formData, $ingredienteId, $logoFileName)
    {
     
        $logoFileName = bin2hex($logoFileName);
        if (!empty($logoFileName))
        {
            if ($logoFileName == "remover")
            {
                //Mesmo pegando a conexao dessa maneira a trasacao funciona corretamente
                $this->getAdapter()->getConnection()->query("UPDATE ingrediente SET imagem=NULL  WHERE cod_ingrediente = $ingredienteId ");
            } else
            {
                $this->_db->query("UPDATE ingrediente SET imagem=decode('{$logoFileName}' , 'hex')  WHERE cod_ingrediente = $ingredienteId ");
            }
        }

        return $id;
    }

}

?>
