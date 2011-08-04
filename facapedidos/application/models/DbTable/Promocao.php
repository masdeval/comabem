<?php
  class DbTable_Promocao extends Zend_Db_Table_Abstract
  {
      protected $_name = 'promocao';

      public function getRecords($cod_tamanho_produto)
      {
          $query = $this->_db->query("SELECT P.* FROM promocao P JOIN tamanho_produto TP ON (P.cod_tamanho_produto=TP.cod_tamanho_produto)  where P.cod_tamanho_produto =$cod_tamanho_produto AND P.removed <>1 AND TP.removed <>1");
          $result = $query->fetchAll();
           
          return $result;
      }
      public function add($formData,$cod_produto,$tamanhoId)
      {
         if(!empty($formData['data_inicio']) && !empty($formData['data_fim']) && !empty($formData['preco_promocional'])){
          $data = array('cod_produto' => $cod_produto,
                        'preco_promocional' => $formData['preco_promocional'],
                        'anuncio' =>  $formData['anuncio'],
                        'cod_tamanho_produto' =>  $tamanhoId,

                        );
        if(!empty($formData['data_inicio'])){
          list($day,$month,$year)=explode('/',$formData['data_inicio']);
          $data_nascimento="$year-$month-$day";
          $data['data_inicio']=$data_nascimento;
          }
          if(!empty($formData['data_fim'])){
          list($day,$month,$year)=explode('/',$formData['data_fim']);
          $data_nascimento="$year-$month-$day";
          $data['data_fim']=$data_nascimento;
          }
          $id = $this->insert($data);

          return $id;
         }else{
             return false;
         }
      }
      public function edit($formData,$cod_promocao, $cod_produto)
      {
           if(!empty($formData['data_inicio']) && !empty($formData['data_fim']) && !empty($formData['preco_promocional'])){


           $data = array('cod_produto' => $cod_produto,
                        'preco_promocional' => $formData['preco_promocional'],
                        'anuncio' =>  $formData['anuncio'],

                        );
        if(!empty($formData['data_inicio'])){
          list($day,$month,$year)=explode('/',$formData['data_inicio']);
          $data_nascimento="$year-$month-$day";
          $data['data_inicio']=$data_nascimento;
          }
          if(!empty($formData['data_fim'])){
          list($day,$month,$year)=explode('/',$formData['data_fim']);
          $data_nascimento="$year-$month-$day";
          $data['data_fim']=$data_nascimento;
          }


          $where[] = "cod_promocao = $cod_promocao";
          $t = $this->_db->update('promocao', $data, $where);
          return $t;
           }else{
               return false;
           }
      }

      public function deleteRecords($id)
      {
          $data['removed'] = 1;
          $where[] = "cod_promocao = $id";
          $t = $this->_db->update('promocao', $data, $where);
      }



  }
?>
