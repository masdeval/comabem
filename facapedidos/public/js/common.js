
/*Tela de Empresa*/ 
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
    $('#labelRemove').hide();
    $('#labelRemove').hide();
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

/*Tela de Funcionarios*/
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

/*Tela de Ingrediente*/
function delIngrediente(id){
    if(confirm('Tem certeza que deseja remover o registro?')){

        var url=base_url+'/ingredients/delete/';
        document.getElementById('form1').action = url;
        document.getElementById('form1').submit();
    }

}

/* Tela de Produtos */
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


function delTamanhos(id,tamid)
{
    if(id == '' || id == null || tamid == '' || tamid == null)
    {
        alert('Selecione o tamanho que deseja excluir.');
        return;
    }

    if(confirm('Tem certeza que deseja remover o registro?')){
        var url=base_url+'/produto/delete-Tamanhos/';
        document.form5.action = url;
        document.form5.submit();
    }
}
function delPromocao(id){

    if(confirm('Tem certeza que deseja remover o registro?')){

        var url=base_url+'/produto/delete-Promocao/';
        document.getElementById('form6').promocaoId.value=id;  
        document.getElementById('form6').action = url;
        document.getElementById('form6').submit();

    }
}

function savePromocao(id){

    if(!validateForm('form6'))
        return false;
    
    document.getElementById('form6').promocaoId.value=id;
    document.getElementById('form6').submit();
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

/* É executado quando o combobox de tamanhos na aba Tamanhos é alterado */

function editTamanho(tamid,id)
{
    
    //var url=base_url+'/produto/edit/id/'+id+'/tamid/'+tamid; //antes estava so assim

    //Esse caso é quando a funcao é chamada no link de adicionar um tamanho novo
    //Nesse caso, deve-se apenas limpar os campos de tamanho no formulario e não há
    //um codigo de tamanho para ser preenchido no campo hidden tamanhoId que deve receber string vazia
    if(tamid == 0)
    {
        /*document.getElementById("descricao").value = '';
        document.getElementById("preco").value = '';
        try{
            document.getElementById("numero_sabores_pizza").value = '';//pode ser que esse campo nao exista na tela. Dessa maneira nao vai travar nessa linha
        }
        catch(err){}
        document.getElementById("tamanhoId").value = '';        
        document.getElementById("tamanhoEdit").selectedIndex = 0; */
        
        document.getElementById("tamanhoId").value = '';
        document.form5.action='/produto/edit/';
        document.form5.submit();

    }
    else
    {
        document.getElementById('produtoId').value = id;
        document.getElementById('tamanhoId').value = tamid;
        document.form5.action='/produto/edit/';
        document.form5.submit();
        
    /*
        //esse codigo cria um formulario HTML dinamicamente
        //achei que precisava fazer isso
        var myform=document.createElement("form");
        myform.setAttribute('action', '/produto/edit');
        myform.method='POST';
        myform.id='xxx';
        var hiddenProdutoId = document.createElement("input");
        hiddenProdutoId.type='hidden';
        var hiddenTamanhoId = document.createElement("input");
        hiddenTamanhoId.type = 'hidden';
        hiddenProdutoId.setAttribute("name", "produtoId");
        hiddenTamanhoId.setAttribute("name", "tamid");
        hiddenProdutoId.setAttribute("value", id);
        hiddenTamanhoId.setAttribute("value", tamid);
        myform.appendChild(hiddenTamanhoId);
        myform.appendChild(hiddenProdutoId);
        document.body.appendChild(myform);
        document.getElementById('xxx').submit();
        */
    }
}