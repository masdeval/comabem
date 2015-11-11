<?php

class DbTable_FotoProduto extends Zend_Db_Table_Abstract
{

    protected $_name = 'foto_produto';

    public function __construct($db)
    {
        $this->_db = $db;
    }

    public function getRecords($cod_produto)
    {
        $query = $this->_db->query("SELECT * FROM foto_produto where cod_produto=$cod_produto ");
        $result = $query->fetchAll();
        return $result;
    }

    public function add($formData, $fileData, $cod_produto)
    {

        if (!empty($fileData))
        {
            $fileData = bin2hex($fileData);
        
            $data = array('cod_produto' => $cod_produto,
            );
            $id = $this->insert($data);
            $stm = $this->_db->prepare("UPDATE foto_produto SET foto=decode(:1 , 'hex')  WHERE cod_foto = :2 ");
            $stm->bindParam(':1' , $fileData, PDO::PARAM_LOB);
            $stm->bindParam(':2' , $id, PDO::PARAM_INT);
            $stm->execute();            
            
        }
        if (!empty($formData['cod_foto']))
        {
            foreach ($formData['cod_foto'] as $k => $v)
            {
                $this->_db->delete('foto_produto', "cod_foto =$v");
            }
        }
        return $id;
    }

    public function getSingleData($id)
    {
        $query = $this->_db->query("SELECT * FROM produto where cod_produto='$id'");
        $result = $query->fetchAll();
        $result = $result[0];
        return $result;
    }


    public function getImageData($id)
    {
        $query = $this->_db->query("SELECT encode(foto, 'base64') AS data FROM foto_produto  WHERE cod_foto = '$id' ");
        $res = $query->fetchAll();
        $res = $res[0];
        $data = $res['data'];
        //$data=base64_decode($data);
        return $data;
    }

}

?>
