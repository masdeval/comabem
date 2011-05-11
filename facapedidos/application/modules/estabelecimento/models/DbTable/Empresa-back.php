<?php
  class Application_Model_DbTable_Empresa extends Zend_Db_Table_Abstract
  {
      protected $_name = 'empresa';

      public function getRecords($offset = 0, $recordPerPage = 20)
      {
          $query = $this->_db->query("SELECT * FROM empresa where removed <>1 Limit 20 Offset 0");
          $result = $query->fetchAll();
          return $result;
      }
      public function addEmpresa($formData, $logoFileName)
      {
          $now = date("Y-m-d H:i:s");
          if (empty($logoFileName)) {
              $logoFileName = 'noimage.gif';
          }
          $data = array('razao_social' => $formData['razao_social'],
                        'cnpj' => $formData['cnpj'],
                        'rua' => $formData['rua'],
                        'numero' => (int)$formData['numero'],
                        'cep' => $formData['cep'],
                        'complemento' => $formData['complemento'],
                        'valor_minimo_entrega' => (float)$formData['valor_minimo_entrega'],
                        'nome_fantasia' => $formData['nome_fantasia'],
                        'telefone1' => $formData['telefone1'],
                        'telefone2' => $formData['telefone2'],
                        'bairro' => $formData['bairro'],
                        'email' => $formData['email'],
                        'url' => $formData['url'],
                        'desativada' => (int)$formData['desativada'],
                        'cod_cidade' => (int)$formData['cod_cidade'],
                        'logo' => $logoFileName,
                        'data_cadastro' => $now, );
          $id = $this->insert($data);
          return $id;
      }
      public function editEmpresa($formData, $id, $logoFileName)
      {
          $now = date("Y-m-d H:i:s");
          $data = array('razao_social' => $formData['razao_social'],
                        'cnpj' => $formData['cnpj'],
                        'rua' => $formData['rua'],
                        'numero' => (int)$formData['numero'],
                        'cep' => $formData['cep'],
                        'complemento' => $formData['complemento'],
                        'valor_minimo_entrega' => (float)$formData['valor_minimo_entrega'],
                        'nome_fantasia' => $formData['nome_fantasia'],
                        'telefone1' => $formData['telefone1'],
                        'telefone2' => $formData['telefone2'],
                        'bairro' => $formData['bairro'],
                        'email' => $formData['email'],
                        'url' => $formData['url'],
                        'desativada' => (int)$formData['desativada'],
                        'cod_cidade' => (int)$formData['cod_cidade'], );
          if (!empty($logoFileName)) {
              $data['logo'] = $logoFileName;
          }
          $where[] = "cod_empresa = $id";
          $t = $this->_db->update('empresa', $data, $where);
          return $t;
      }
      public function getSingleData($id)
      {
          $query = $this->_db->query("SELECT * FROM empresa where cod_empresa='$id'");
          $result = $query->fetchAll();
          $result = $result[0];
          return $result;
      }
      public function deleteRecords($id)
      {
          $data['removed'] = 1;
          $where[] = "cod_empresa = $id";
          $t = $this->_db->update('empresa', $data, $where);
      }
      public function checkDuplicateUrl($url)
      {
          $query = $this->_db->query("SELECT url FROM empresa where url='$url'");
          $res = $query->fetchAll();
          if (count($res) > 0) {
              return 'F';
          } else {
              return 'OK';
          }
      }
  }
?>
