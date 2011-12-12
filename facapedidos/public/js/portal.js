/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function lojaFechada(cod_empresa,cod_produto,indiceMsg){

    reqURL='/portal/index/loja-Fechada/codEmpresa/'+cod_empresa+'/codProduto/'+cod_produto;
   

    $.ajax({
        type: "POST",
        url:reqURL,
        success: function(r) {
       r=jQuery.trim(r);
       //alert(r)
       if(r=='Fail'){
           
           $('#spanFechada'+indiceMsg).html('Não foi possível enviar mensagem. Tente daqui alguns instantes.');
       }
       else{
          $('#spanFechada'+indiceMsg).html('Mensagem enviada com sucesso.');
       }
        }
      });


}

