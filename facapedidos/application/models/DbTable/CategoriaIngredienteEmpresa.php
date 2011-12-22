<?php

class DbTable_CategoriaIngredienteEmpresa extends Zend_Db_Table_Abstract
{

    protected $_name = 'categoria_ingrediente_empresa';

    public function __construct($db)
    {
        $this->_db = $db;
    }

  
    public function getRecords($ingredienteId, $empresaId)
    {
        $query = $this->_db->query("SELECT cod_categoria_empresa FROM categoria_ingrediente_empresa WHERE cod_empresa=$empresaId AND cod_ingrediente=$ingredienteId");
        $result = $query->fetchAll();
        foreach ($result as $k => $v)
        {
            $res[] = $v['cod_categoria_empresa'];
        }
        return $res;
    }

    public function updateRecord($formData, $ingredienteId, $empresaId)
    {
        $this->deleteRecord($ingredienteId, $empresaId);
        foreach ((array)$formData['cod_categoria_empresa'] as $k => $v)
        {
            //if ($this->checkDuplicateRec($empresaId, $ingredienteId, $v))
            {
                $data = array(
                    'cod_categoria_empresa' => $v,
                    'cod_ingrediente' => $ingredienteId,
                    'cod_empresa' => $empresaId,
                );
                $id = $this->insert($data);
            }
        }

    }

    public function associarCategoria($formData, $empresaId)
    {
        $cod_categria_empresa = $formData['cod_categoria_empresa'];
        $this->delete("cod_empresa=$empresaId and cod_categoria_empresa=$cod_categria_empresa");

        foreach ($formData['cod_ingrediente'] as $k => $v)
        {
            //if ($this->checkDuplicateRec($empresaId, $v, $formData['cod_categoria_empresa']))
            {
                $data = array(
                    'cod_categoria_empresa' => $formData['cod_categoria_empresa'],
                    'cod_ingrediente' => $v,
                    'cod_empresa' => $empresaId,
                );
                $id = $this->insert($data);
            } //else
            {
               // continue;
            }
        }
        
    }

    /* Verifica se na tabela categoria_ingrediente_empresa ja existe um ingrediente classificado nessa categoria */
    /* Caso já exista retorna false, se nao true. */

    public function checkDuplicateRec($empresaId, $ingredienteId, $cod_categoria_empresa)
    {
        $query = $this->_db->query("SELECT cod_categoria_empresa FROM categoria_ingrediente_empresa WHERE cod_empresa=$empresaId AND cod_ingrediente=$ingredienteId AND cod_categoria_empresa=$cod_categoria_empresa ");
        $result = $query->fetchAll();
        if (!empty($result))
        {
            return false;
        } else
        {
            return true;
        }
    }

    public function deleteRecord($ingredienteId, $empresaId)
    {
        $this->delete("cod_ingrediente=$ingredienteId AND cod_empresa=$empresaId ");
    }


    /*
     * Retorna a lista de ingredientes de uma empresa que foi associado com uma determinada categoria
     * $cod_categoria_empresa
     */
    public function getRecordsAssocair($empresaId, $cod_categoria_empresa)
    {
        $query = $this->_db->query("SELECT cod_ingrediente FROM categoria_ingrediente_empresa WHERE cod_empresa=$empresaId  AND cod_categoria_empresa=$cod_categoria_empresa ");

        $result = $query->fetchAll();
        $res[] = '';
        foreach ($result as $k => $v)
        {
            $res[] = $v['cod_ingrediente'];
        }
        return $res;
    }

}

?>
