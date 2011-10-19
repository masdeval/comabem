<?php
  class DbTable_Produto extends Zend_Db_Table_Abstract
  {
      protected $_name = 'produto';

         public function __construct($db)
    {
        $this->_db = $db;
    }


      public function getRecords($empresaId)
      {
          $query = $this->_db->query("SELECT P.*,TP.nome as tipo FROM produto P JOIN tipo_produto TP ON (P.cod_tipo_produto=TP.cod_tipo_produto) where P.removed <>1 and P.cod_empresa = $empresaId");
          $result = $query->fetchAll();
          return $result;
      }

      public function getNomeProdutosByTipo($empresaId, $listaTipoProduto)
      {
          $query = $this->_db->query("SELECT P.nome FROM produto P JOIN tipo_produto TP ON (P.cod_tipo_produto=TP.cod_tipo_produto) where P.removed <>1
              and cod_empresa = $empresaId and  TP.cod_tipo_produto in ($listaTipoProduto)");
          $result = $query->fetchAll();
          return $result;

      }

      public function add($formData,$cod_empresa)
      {

          $data = array('nome' => $formData['nome'],
                        'cod_tipo_produto' => $formData['cod_tipo_produto'],
                        'cod_empresa' => $cod_empresa,
                        'descricao' => $formData['descricao'],
                        'tempo_preparo_minutos' => (int)$formData['tempo_preparo_minutos'],
                        'valor_calorico' => (float)$formData['valor_calorico'],
                        'numero_max_adicionais' => (int)$formData['numero_max_adicionais'],
                        'fator_de_ajuste' => (float)$formData['fator_de_ajuste'],
                        'cobrado_por_quilo' => $formData['cobrado_por_quilo'],
                        'disponivel' => $formData['disponivel'],
                        );
          $id = $this->insert($data);

          return $id;
      }
      public function edit($formData,$cod_empresa, $cod_produto)
      {

          $data = array('nome' => $formData['nome'],
                        'cod_tipo_produto' => $formData['cod_tipo_produto'],
                        'cod_empresa' => $cod_empresa,
                        'descricao' => $formData['descricao'],
                        'tempo_preparo_minutos' => (int)$formData['tempo_preparo_minutos'],
                        'valor_calorico' => (float)$formData['valor_calorico'],
                        'numero_max_adicionais' => (int)$formData['numero_max_adicionais'],
                        'fator_de_ajuste' => (float)$formData['fator_de_ajuste'],
                        'cobrado_por_quilo' => $formData['cobrado_por_quilo'],
                        'disponivel' => $formData['disponivel'],
                        );


          $where[] = "cod_produto = $cod_produto";
          $t = $this->_db->update('produto', $data, $where);
          return $t;
      }
      public function getSingleData($id)
      {
          $query = $this->_db->query("SELECT P.*,TP.nome as tipo FROM produto P JOIN tipo_produto TP ON (P.cod_tipo_produto=TP.cod_tipo_produto) where P.cod_produto='$id'");
          $result = $query->fetchAll();
          $result = $result[0];
          return $result;
      }
      public function deleteRecords($id)
      {
          $data['removed'] = 1;
          $where[] = "cod_produto = $id";
          $t = $this->_db->update('produto', $data, $where);
      }



  }
?>
