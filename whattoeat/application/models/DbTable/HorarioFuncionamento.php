<?php

class DbTable_HorarioFuncionamento extends Zend_Db_Table_Abstract
{

    protected $_name = 'horario_funcionamento';

    public function __construct($db)
    {
	$this->_db = $db;
    }

    public function getRecords($cod_empresa)
    {
	$query = $this->_db->query("SELECT * FROM horario_funcionamento where  cod_empresa =$cod_empresa ");
	$res = $query->fetchAll();
	foreach ($res as $k => $row)
	{
	    $result[$row['dia_da_semana']]['hora_inicio'] = $row['hora_inicio'];
	    $result[$row['dia_da_semana']]['hora_fim'] = $row['hora_fim'];
	}
	return $result;
    }

    public function addRecord($empID, $formData)
    {
	$data = $formData['val'];
	foreach ($data as $k => $v)
	{

	    if (empty($v['hora_inicio']) || empty($v['hora_fim']))
	    {
		$v['hora_inicio'] = null;
		$v['hora_fim'] = null;
	    }

	    $data = array('hora_inicio' => $v['hora_inicio'],
		'hora_fim' => $v['hora_fim'],
		'dia_da_semana' => $k,
		'cod_empresa' => $empID,);
	    $this->_db->insert('horario_funcionamento', $data);
	}
    }

    public function editRecord($empID, $formData)
    {
	$this->_db->delete('horario_funcionamento', "cod_empresa =$empID");
	$data = $formData['val'];
	foreach ($data as $k => $v)
	{
	    if (empty($v['hora_inicio']) || empty($v['hora_fim']))
	    {
		$v['hora_inicio'] = null;
		$v['hora_fim'] = null;
	    }
	    $data = array('hora_inicio' => $v['hora_inicio'],
		'hora_fim' => $v['hora_fim'],
		'dia_da_semana' => $k,
		'cod_empresa' => $empID,);
	    $this->_db->insert('horario_funcionamento', $data);
	}
    }

    public function deleteRecords($empID)
    {
	$this->_db->delete('horario_funcionamento', "cod_empresa =$empID");
    }

}

?>