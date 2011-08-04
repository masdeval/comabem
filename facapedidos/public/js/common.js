function toggleImage(){
    $('#changeImage').show();
    $('#labelChange').hide();
}
function toggleImage2(){
    $('#changeImage').hide();
    $('#labelChange').show();
}
function checkUrl(elem){
    val=$('#'+elem).attr('value');
    status=false;
     reqURL=base_url+'/empresa/check-Url/url/'+val;
      $.ajax({
        type: "GET",
        url:reqURL,
        success: function(r) {
       r=jQuery.trim(r);
       //alert(r)
       if(r=='F'){
           var msg='URL ja exist.Please usar outro url';
           $('#spanUrl').html(msg);
           $('#spanUrl').show();
           status=false;
           return status;
       }
       else{
          $('#spanUrl').html('');
           $('#spanUrl').hide();
          status=true;
           return status;
       }
        }
      });


}
function delEmpresa(id){
    if(confirm('Are you sure you want to delete?')){

        var url=base_url+'/empresa/delete/id/'+id;
        //alert(url);
        location.href=url;
    }
}
function delTipos_de_produtos(id){
    if(confirm('Are you sure you want to delete?')){

        var url=base_url+'/empresa/delete-Tipos-De-Produtos/id/'+id;
       // alert(url);
        location.href=url;
    }
}
function deleteHorario(id){
    if(confirm('Are you sure you want to delete?')){

        var url=base_url+'/empresa/delete-Horario/id/'+id;
        //alert(url);
        location.href=url;
    }
}
function delfuncionario(id){
    if(confirm('Are you sure you want to delete?')){

        var url=base_url+'/funcionario/delete/id/'+id;
        //alert(url);
        location.href=url;
    }
}
function delFuncionario_entregador(id){
    if(confirm('Are you sure you want to delete?')){

        var url=base_url+'/funcionario/delete-Funcionario-Entregador/id/'+id;
       // alert(url);
        location.href=url;
    }
}
function delIngrediente(id){
     if(confirm('Are you sure you want to delete?')){

        var url=base_url+'/ingredients/delete/id/'+id;
        //alert(url);
        location.href=url;
    }

}
function delProduto(id){
 if(confirm('Are you sure you want to delete?')){

        var url=base_url+'/produto/delete/id/'+id;
        //alert(url);
        location.href=url;
    }
}
function delImagens(id){
 if(confirm('Are you sure you want to delete?')){

        document.form2.submit();
        //alert(url);

    }
}
function delTamanhos(id,tamid){
    if(confirm('Are you sure you want to delete?')){
    if(id==''){
        return false;
    }
        var url=base_url+'/produto/delete-Tamanhos/id/'+id+'/tamid/'+tamid;
       // alert(url);
        location.href=url;
    }
}
function delPromocao(id,pid){
    if(confirm('Are you sure you want to delete?')){

        var url=base_url+'/produto/delete-Promocao/id/'+id+'/produtoId/'+pid;
       // alert(url);
        location.href=url;
    }
}
function savePromaco(id){
    if(!validateForm('form5')){
        return false;
    }
    document.form5.promocaoId.value=id;
    document.form5.act2.value='editPromocao';
    document.form5.submit();
}
function getCategria(elem,ing){
    val=$('#cod_tipo_ingrediente').attr('value');
     reqURL=base_url+'/ingredients/categria/tipoing/'+val+'/ing/'+ing;
      $.ajax({
        type: "GET",
        url:reqURL,
        success: function(r) {
         r=jQuery.trim(r);
        $('#respp').html(r);

        }
      });


}
function editTamanho(elem,id){
    var tamid=elem.value;
    if(tamid==''){
        return false;
    }
      var url=base_url+'/produto/edit/id/'+id+'/tamid/'+tamid;
       // alert(url);
        location.href=url;

}
