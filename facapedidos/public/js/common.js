
// limpa todos os caracteres especiais do campo solicitado
function filtraCampo(campo){
	var s = "";
	var cp = "";
	vr = campo.value;
	tam = vr.length;
	for (i = 0; i < tam ; i++) {
		if (vr.substring(i,i + 1) != "/" && vr.substring(i,i + 1) != "-" && vr.substring(i,i + 1) != "."  && vr.substring(i,i + 1) != "," ){
		 	s = s + vr.substring(i,i + 1);}
	}
	campo.value = s;
	return cp = campo.value
}
//limpa todos os caracteres especiais do campo solicitado
function filtraCampoValor(campo){
	var s = "";
	var cp = "";
	vr = campo.value;
	tam = vr.length;
	for (i = 0; i < tam ; i++) {
		if (vr.substring(i,i + 1) >= "0" && vr.substring(i,i + 1) <= "9"){
		 	s = s + vr.substring(i,i + 1);}
	}
	campo.value = s;
	return cp = campo.value
}


function formataCEP(campo){
	campo.value = filtraCampo(campo);
	vr = campo.value;
	tam = vr.length;

	if ( tam <= 3 )
		campo.value = vr;
	if ( tam > 3 )
		campo.value = vr.substr(0, tam-3 ) + '-' + vr.substr(tam-3, tam);
}

function formataHora(campo,teclapres) {
	var tecla = teclapres.keyCode;
	campo.value = filtraCampo(campo);
	vr = campo.value;
	vr = vr.replace( ".", "" );
	vr = vr.replace( ":", "" );
	vr = vr.replace( ":", "" );
	tam = vr.length + 1;

	if ( tecla != 9 && tecla != 8 ){
		if ( tam > 2 && tam < 5 )
			campo.value = vr.substr( 0, tam - 2  ) + ':' + vr.substr( tam - 2, tam );
	}
}

// Formata o campo valor
function formataValor(campo) {
	campo.value = filtraCampoValor(campo);
	vr = campo.value;
	tam = vr.length;

	if ( tam <= 2 ){
 		campo.value = vr ; }
 	if ( (tam > 2) && (tam <= 5) ){
 		campo.value = vr.substr( 0, tam - 2 ) + ',' + vr.substr( tam - 2, tam ) ; }
 	if ( (tam >= 6) && (tam <= 8) ){
 		campo.value = vr.substr( 0, tam - 5 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; }
 	if ( (tam >= 9) && (tam <= 11) ){
 		campo.value = vr.substr( 0, tam - 8 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; }
 	if ( (tam >= 12) && (tam <= 14) ){
 		campo.value = vr.substr( 0, tam - 11 ) + '.' + vr.substr( tam - 11, 3 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; }
 	if ( (tam >= 15) && (tam <= 18) ){
 		campo.value = vr.substr( 0, tam - 14 ) + '.' + vr.substr( tam - 14, 3 ) + '.' + vr.substr( tam - 11, 3 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ;}

}

// Formata o campo valor
function formataNumerico(campo) {

	campo.value = filtraCampo(campo);
	vr = campo.value;
	tam = vr.length;
}

function formataCPF(campo){
	campo.value = filtraCampo(campo);
	vr = campo.value;
	tam = vr.length ;
	if ( tam <= 2 ){
 		campo.value = vr ;}
	if ( tam > 2 && tam <= 5 ){
		campo.value = vr.substr( 0, tam - 2 ) + '-' + vr.substr( tam - 2, tam );}
	if ( tam >= 6 && tam <= 8 ){
		campo.value = vr.substr( 0, tam - 5 ) + '.' + vr.substr(tam - 5, 3 ) + '-' + vr.substr( tam - 2, tam );}
	if ( tam >= 9 && tam <= 11 ){
		campo.value = vr.substr( 0, tam - 8 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr(tam - 5, 3 ) + '-' + vr.substr( tam - 2, tam );}

}

function formataTelefone(campo) {
	campo.value = filtraCampo(campo);
	vr = campo.value;
	tam = vr.length;

	if ( tam <= 4 )
		campo.value = vr;
	if ( tam > 4 )
		campo.value = vr.substr(0, tam-4 ) + '-' + vr.substr(tam-4, tam);
}


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
/*Tela de Empresa*/
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

//Eh chamado quando o combo de ingrediente eh alterado (nao esta sendo utilizado)
function editaIngrediente(elem){

         var url='/estabelecimento/ingredients/edit';
         //if(elem.selectedIndex == 0) //caso o valor selecionado seja nulo (ou seja, a opcao 'Select')
           //  elem.options[elem.selectedIndex].value = 0; //faco isso para trazer uma tela vazia
         document.getElementById('form1').action = url;     
         document.getElementById('form1').submit();
 }

function getCategoria(elem,ing){
    var val=elem.options[elem.selectedIndex].value; //$('#cod_tipo_ingrediente').attr('value');
    reqURL=base_url+'/ingredients/categoria/tipoing/'+val+'/ing/'+ing;

    $.ajax({
        type: "GET",
        url:reqURL,
        success: function(r) {
            r=jQuery.trim(r);
            $('#respp').html(r);
        }
    });

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