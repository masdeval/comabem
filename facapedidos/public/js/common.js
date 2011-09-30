function toggleImage(){
    $('#changeImage').show();
    $('#labelChange').hide();
    $('#labelRemove').hide();
    $('#labelChangeCancel').show();
}
//Esse é o botao de cancelar
function toggleImage2(){
    $('#changeImage').hide();
    $('#labelChange').show();
    $('#labelRemove').show();
    document.getElementById("flagRemoverImagem").value = "";
    $('#image').show();
    $('#labelChangeCancel').hide();
}
function removeImage(){  
  $('#image').hide();
  $('#labelChange').hide();
  $('#labelChangeCancel').show();
  document.getElementById("flagRemoverImagem").value = "remover";

}
function delEmpresa(id){
    if(confirm('Tem certeza que deseja remover o registro?')){
        var url=base_url+'/empresa/delete/';
        document.getElementById('form1').action = url;
        document.getElementById('form1').submit();
    }
}
function delTipos_de_produtos(id){
    if(confirm('Tem certeza que deseja remover o registro?')){

        var url=base_url+'/empresa/delete-Tipos-De-Produtos/';
        document.getElementById('form2').action = url;
        document.getElementById('form2').submit();
    }
}
function deleteHorario(id){
    if(confirm('Tem certeza que deseja remover o registro?')){

        var url=base_url+'/empresa/delete-Horario/';
        document.getElementById('form3').action = url;
        document.getElementById('form3').submit();
    }
}
function delfuncionario(id){
    if(confirm('Tem certeza que deseja remover o registro?')){

        var url=base_url+'/funcionario/delete/';
        document.getElementById('form1').action = url;
        document.getElementById('form1').submit();
        
    }
}
function delFuncionario_entregador(id){
    if(confirm('Tem certeza que deseja remover o registro?')){

        var url=base_url+'/funcionario/delete-Funcionario-Entregador';
        document.getElementById('form2').action = url;
        document.getElementById('form2').submit();
    }
}
function delIngrediente(id){
     if(confirm('Tem certeza que deseja remover o registro?')){

        var url=base_url+'/ingredients/delete/';
        document.getElementById('form1').action = url;
        document.getElementById('form1').submit();
    }

}
function delProduto(id){
 if(confirm('Tem certeza que deseja remover o registro?')){

        var url=base_url+'/produto/delete/';
        document.getElementById('form1').action = url;
        document.getElementById('form1').submit();
    }
}
function delImagens(id){
 if(confirm('Tem certeza que deseja remover a imagem?')){

        document.form2.submit();
        //alert(url);

    }
}
function delTamanhos(id,tamid){
    if(confirm('Tem certeza que deseja remover o registro?')){
    if(id==''){
        return false;
    }
        var url=base_url+'/produto/delete-Tamanhos/id/'+id+'/tamid/'+tamid;
       // alert(url);
        location.href=url;
    }
}
function delPromocao(id,pid){
    if(confirm('Tem certeza que deseja remover o registro?')){

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
