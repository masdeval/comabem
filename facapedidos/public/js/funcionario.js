/*
 * Neste arquivo estao as funcoes javascripts especificas para fazer validacoes no cadastro de funcionario.
 *
 *
 */

function checkCPF(elem, funcionarioId){

    val=elem.value;
    status=false;
    reqURL=base_url+'/estabelecimento/funcionario/check-Cpf/cpf/'+val+'/id/'+funcionarioId;

      $.ajax({
        type: "GET",
        url:reqURL,
        success: function(r) {
       r=jQuery.trim(r);
      
       if(r=='F'){
           var msg='CPF já existe!';
           $('#spanCpf').html(msg);
           $('#spanCpf').show();
           elem.value = "";
           status=false;
           return status;
       }
       else{
          $('#spanCpf').html('');
          $('#spanCpf').hide();
          status=true;
          return status;
       }
        }
      });


}


