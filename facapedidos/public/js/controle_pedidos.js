
function rejeitar(cod_pedido,cod_empresa, celular, email){
    
    reqURL='/estabelecimento/pedidos/ajax-Rejeitar/cod_pedido/'+cod_pedido+'/celular/'+celular+'/email/'+email+'/cod_empresa/'+cod_empresa;

      $.ajax({
        type: "GET",
        url:reqURL,
        success: function(r) {
       r=jQuery.trim(r);

       window.location.reload();

        }
      });


}

function preparar(cod_pedido,cod_empresa){

    reqURL='/estabelecimento/pedidos/ajax-Preparar/cod_pedido/'+cod_pedido+'/cod_empresa/'+cod_empresa;

      $.ajax({
        type: "GET",
        url:reqURL,
        success: function(r) {
       r=jQuery.trim(r);

       window.location.reload();

        }
      });


}

function alterarTempo(cod_pedido,cod_empresa, celular, email){

novo_tempo = document.getElementById("novo_tempo_"+cod_pedido).value;

    reqURL='/estabelecimento/pedidos/ajax-Alterar-Tempo/cod_pedido/'+cod_pedido+'/cod_empresa/'+cod_empresa+'/novo_tempo/'+novo_tempo+'/celular/'+celular+'/email/'+email;

      $.ajax({
        type: "GET",
        url:reqURL,
        success: function(r) {
       r=jQuery.trim(r);

       window.location.reload();

        }
      });


}
