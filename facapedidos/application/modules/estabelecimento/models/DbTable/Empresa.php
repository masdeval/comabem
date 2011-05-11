<?php
  class Application_Model_DbTable_Empresa extends Zend_Db_Table_Abstract
  {
      protected $_name = 'empresa';

      public function getRecords()
      {
          $query = $this->_db->query("SELECT * FROM empresa where removed <>1 ");
          $result = $query->fetchAll();
          return $result;
      }
      public function addEmpresa($formData, $logoFileName)
      {
          $now = date("Y-m-d H:i:s");
          if (!empty($logoFileName)) {
              //$logoFileName = 'noimage.gif';
              $logoFileName=bin2hex($logoFileName);
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
                        'data_cadastro' => $now, );
          $id = $this->insert($data);
           if (!empty($logoFileName)) {
            $this->getAdapter()->getConnection()->query("UPDATE empresa SET logo=decode('{$logoFileName}' , 'hex')  WHERE cod_empresa = '$id' ");
          }
          return $id;
      }
      public function editEmpresa($formData, $id, $logoFileName)
      {
          $logoFileName=bin2hex($logoFileName);
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
            $this->getAdapter()->getConnection()->query("UPDATE empresa SET logo=decode('{$logoFileName}' , 'hex')  WHERE cod_empresa = '$id' ");
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
      public function checkDuplicateUrl($url,$id='')
      {
          if(!empty($id)){
            $q="SELECT url FROM empresa where url='$url' and cod_empresa !='$id' ";
            $query = $this->_db->query($q);
          }else{
            $query = $this->_db->query("SELECT url FROM empresa where url='$url'");
          }
          $res = $query->fetchAll();
          if (count($res) > 0) {
              return 'F';
          } else {
              return 'OK';
          }
      }
      public function getImageData($empresaId)
      {
          $query = $this->_db->query("SELECT encode(logo, 'base64') AS data FROM empresa  WHERE cod_empresa = '$empresaId' ");
          $res = $query->fetchAll();
          $res=$res[0];
          $data=$res['data'];
          //$data=base64_decode($data);
          return $data;
      }
       public function getEmpresaOptionDropDown()
      {
          $result[''] = 'Select';
          $dat=$this->fetchAll();
          foreach ($dat as $k=>$row) {
              $result[$row->cod_empresa] = $row->razao_social;
          }
          return $result;
      }
  }
?>
