/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function lojaFechada(cod_empresa, indiceMsg)
{
   

    reqURL='/portal/index/loja-Fechada/codEmpresa/'+cod_empresa;
   

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


function pedidoIngrediente(msg)
{
   var msg = document.getElementById('sugestao_ingrediente').value;   

    reqURL='/estabelecimento/produto/ajax-Pedido-Ingrediente/sugestao_ingrediente/'+msg;
   

    $.ajax({
	type: "POST",
	url:reqURL,   
	success: function(r) {
	    r=jQuery.trim(r);
	    
	    if(r=='1'){
          
		$('#spanPedidoIngrediente').html('Enviado!');
	    }
	    
	}
    });
}


function addProdutoCarrinhoAjax(cod_empresa,cod_tamanho_produto,nome_empresa, nome_produto, tamanho,preco)
{
    var qt = document.getElementById("quantidade_"+cod_empresa+"_"+cod_tamanho_produto).value;
    reqURL='/portal/loja/add-Produto-Carrinho/nome_empresa/'+nome_empresa+'/cod_empresa/'+cod_empresa+'/cod_tamanho_produto/'+cod_tamanho_produto+'/nome_produto/'+nome_produto+"/tamanho/"+tamanho+"/preco/"+preco+"/quantidade/"+qt;


    $.ajax({
	type: "POST",
	url:reqURL,
	success: function(r) {
	    r=jQuery.trim(r);
	    //alert(r)
	    if(r=='Fail'){
           

		alert("Ocorreu um erro ao inserir esse produto. Por favor tente mais tarde.");

	    }
	    else{
              
		atualizaInformacoesPedido(cod_empresa,cod_tamanho_produto,nome_empresa, nome_produto, tamanho,preco,qt);
	    }
	}
    });


}

/*
 * Controla dinamicamente a apresentação dos pedidos que o usuario vai fazendo.
 * 
 * Versao com tabela.
 *
 */
function  atualizaInformacoesPedido(cod_empresa,cod_tamanho_produto,nome_empresa, nome_produto, tamanho,preco,qt)
{

    if(document.getElementById("row"+cod_empresa))//empresa ja existe
    {
	if(document.getElementById("colunaProduto"+cod_tamanho_produto))//produto ja existe
	{
        
          //  alert("colunaQuantidade"+cod_tamanho_produto);
	    var Quantidade = document.getElementById("colunaQuantidade"+cod_tamanho_produto);
	    Quantidade.innerHTML = parseInt(Quantidade.innerHTML) + parseInt(qt);
	}
	else
	{
       
      
	    var table = document.getElementById("tableListaPedido");
	    var rowEmpresa = document.getElementById("row"+cod_empresa);

	    //insere uma nova linha logo abaixo da linha rowEmpresa
	    var rowProduto = table.insertRow(rowEmpresa.rowIndex + 1);

	    rowProduto.insertCell(0);//insere a coluna em branco

	    coluna = rowProduto.insertCell(1);
	    coluna.className = "itensPedido";
	    coluna.id = "colunaProduto"+cod_tamanho_produto;
	    coluna.innerHTML = nome_produto;

	    coluna = rowProduto.insertCell(2);
	    coluna.className = "itensPedido";
	    coluna.id = "colunaTamanho"+cod_tamanho_produto;
	    coluna.innerHTML = tamanho;

	    coluna = rowProduto.insertCell(3);
	    coluna.className = "itensPedido";
	    coluna.id = "colunaPreco"+cod_tamanho_produto;
	    coluna.innerHTML = preco;

	    coluna = rowProduto.insertCell(4);
	    coluna.className = "itensPedido";
	    coluna.id = "colunaQuantidade"+cod_tamanho_produto;
	    coluna.innerHTML = qt;

	    //insere botao de exclusao de item
	    coluna = rowProduto.insertCell(5);
	    coluna.innerHTML = "<img src='/img/minus_circle.png' onclick='javascript:removeUmaUnidadeProdutoCarrinhoActionAjax("+cod_empresa+","+cod_tamanho_produto+")'> ";

	}
    }
    else
    {
      //  alert('3');
       

	var table = document.getElementById("tableListaPedido");
	var rowEmpresa = table.insertRow(table.rows.length);

	rowEmpresa.id = "row"+cod_empresa;
	rowEmpresa.className = "empresaPedido tbl_cart";
	var coluna = rowEmpresa.insertCell(0);
	coluna.innerHTML = nome_empresa;
	rowEmpresa.insertCell(1);
	rowEmpresa.insertCell(2);
	rowEmpresa.insertCell(3);
	rowEmpresa.insertCell(4);

	//insere uma nova linha logo abaixo da linha rowEmpresa
	var rowProduto = table.insertRow(rowEmpresa.rowIndex + 1);

	rowProduto.insertCell(0);//insere a coluna em branco

	coluna = rowProduto.insertCell(1);
	coluna.className = "itensPedido";
	coluna.id = "colunaProduto"+cod_tamanho_produto;
	coluna.innerHTML = nome_produto;

	coluna = rowProduto.insertCell(2);
	coluna.className = "itensPedido";
	coluna.id = "colunaTamanho"+cod_tamanho_produto;
	coluna.innerHTML = tamanho;

	coluna = rowProduto.insertCell(3);
	coluna.className = "itensPedido";
	coluna.id = "colunaPreco"+cod_tamanho_produto;
	coluna.innerHTML = preco;

	coluna = rowProduto.insertCell(4);
	coluna.className = "itensPedido";
	coluna.id = "colunaQuantidade"+cod_tamanho_produto;
	coluna.innerHTML = qt;

	//insere botao de exclusao de item
	coluna = rowProduto.insertCell(5);
	coluna.innerHTML = "<img src='/img/minus_circle.png' onclick='javascript:removeUmaUnidadeProdutoCarrinhoActionAjax("+cod_empresa+","+cod_tamanho_produto+")'> ";


    }
}

/*

 //Versao usando div e span

function  atualizaInformacoesPedido(cod_empresa,cod_tamanho_produto,nome_empresa, nome_produto, tamanho,preco)
{
    if(document.getElementById("div"+cod_empresa))//empresa ja existe
    {
	if(document.getElementById("span"+cod_tamanho_produto))//produto ja existe
	{
	    var spanQuantidade = document.getElementById("spanQuantidade"+cod_tamanho_produto);
	    spanQuantidade.innerHTML = parseInt(spanQuantidade.innerHTML) + 1;
	}
	else
	{
	    var divEmpresa = document.getElementById("div"+cod_empresa);

	    var span = document.createElement("span");
	    span.className='itensPedido';
	    span.id = "span"+cod_tamanho_produto;
	    span.innerHTML = "<BR>"+nome_produto+"-";
	    divEmpresa.appendChild(span);

	    span = document.createElement("span");
	    span.className='itensPedido';
	    span.id = "spanTamanho"+cod_tamanho_produto;
	    span.innerHTML = tamanho+"-";
	    divEmpresa.appendChild(span);

	    span = document.createElement("span");
	    span.className='itensPedido';
	    span.id = "spanPreco"+cod_tamanho_produto;
	    span.innerHTML = preco+"-";
	    divEmpresa.appendChild(span);

	    span = document.createElement("span");
	    span.className='itensPedido';
	    span.id = "spanQuantidade"+cod_tamanho_produto;
	    span.innerHTML = 1;
	    divEmpresa.appendChild(span);
	}
    }
    else
    {
	var div = document.createElement("div");
	div.className = "empresaPedido";
	div.id = "div"+cod_empresa;
	div.innerHTML = nome_empresa+"<BR>";
	document.getElementById("listaPedido").appendChild(div);

	var span = document.createElement("span");
	span.className='itensPedido';
	span.id = "span"+cod_tamanho_produto;
	span.innerHTML = nome_produto+"-";
	div.appendChild(span);

	span = document.createElement("span");
	span.className='itensPedido';
	span.id = "spanTamanho"+cod_tamanho_produto;
	span.innerHTML = tamanho+"-";
	div.appendChild(span);

	span = document.createElement("span");
	span.className='itensPedido';
	span.id = "spanPreco"+cod_tamanho_produto;
	span.innerHTML = preco+"-";
	div.appendChild(span);

	span = document.createElement("span");
	span.className='itensPedido';
	span.id = "spanQuantidade"+cod_tamanho_produto;
	span.innerHTML = 1;
	div.appendChild(span);

    }

}

*/

function removeUmaUnidadeProdutoCarrinhoActionAjax(cod_empresa,cod_tamanho_produto)
{
    var Quantidade = parseInt(document.getElementById("colunaQuantidade"+cod_tamanho_produto).innerHTML);
    
    if(Quantidade > 0)
	document.getElementById("colunaQuantidade"+cod_tamanho_produto).innerHTML = Quantidade - 1;


    reqURL='/portal/loja/remove-Uma-Unidade-Produto-Carrinho/cod_empresa/'+cod_empresa+'/cod_tamanho_produto/'+cod_tamanho_produto;

    $.ajax({
	type: "POST",
	url:reqURL,
	success: function(r) {
	    r=jQuery.trim(r);
	}
    });


}

function recalcularQuantidadeAjax(cod_empresa,cod_tamanho)
{
    var qt = document.getElementById('quantidade_'+cod_empresa+'_'+cod_tamanho).value;

    reqURL='/portal/pedido/recalcular-Quantidade/cod_empresa/'+cod_empresa+'/cod_tamanho/'+cod_tamanho+'/qt/'+qt;

    $.ajax({
	type: "POST",
	url:reqURL,
	success: function(r) {
	    window.location.reload(true);
	    
	}
    });


}

function limparCarrinhoAjax()
{
    alert("Todos os seus dados serão perdidos.");
    reqURL='/portal/loja/limpar-Carrinho';
    document.getElementById("tabelaPedido").innerHTML="";

    $.ajax({
	type: "POST",
	url:reqURL,
	success: function(r) {
	    r=jQuery.trim(r);
	}
    });

}



/*
 * Recebe via JSON o carrinho com os produtos do usuário e o imprime na tela
 */
function recebeCarrinhoJSON()
{

    reqURL='/portal/loja/retorna-Carrinho-Json';

    $.ajax({
	type: "POST",
	url:reqURL,
	success: function(carrinho) {

	    var json_object;
	    if(carrinho != 'undefined' && carrinho != null && carrinho != "" )
	    {
		try
		{
		    json_object = JSON.parse(carrinho);

		}
		catch( e)
		{
		    json_object  = eval( "(" + carrinho + ")" );
		}

		//Usa a biblioteca mootools para criar um objeto hash a partir do objeto JSON
		//Isso foi necessario para poder obter as chaves do array multidimensional que vem do PHP
		var json_hash = new Hash(json_object);

		imprimeCarrinho(json_object, json_hash);
                var count_tr=$("#tableListaPedido").find('tr').length;
                if(count_tr >= 9)
                {
                    $(".bottom-menu").addClass('scrolad');
                    
                }else{
                    $(".bottom-menu").removeClass('scrolad');
 
                    
                }

	    }
            
	
	}
    });

}

/*
 * Recebe o carrinho da sessao do usuario e o imprime. O carrinho tem a seguinte estrutura:
 *
 * 	    $this->empresas[$cod_empresa]['nome_empresa'] = $nome_empresa;
	    $this->empresas[$cod_empresa][$cod_tamanho_produto] = array(
		"nome_produto" => $nome_produto,
		"preco" => $preco,
		"tamanho" => $tamanho,
		"quantidade" => (int) 1,
	    );
 */
function imprimeCarrinho(carrinho, hash)
{
    //primeiro obtem a lista de cod_empresas
    var lista_empresas = hash.getKeys();
    
    var table = document.getElementById("tableListaPedido");
    
    //Insere o cabeçalho
    var row = table.insertRow(table.rows.length);
    var column_cabecalho = row.insertCell(0);
    column_cabecalho.innerHTML = "Empresa";
    column_cabecalho = row.insertCell(1);
    column_cabecalho.innerHTML = 'Produto';
    column_cabecalho = row.insertCell(2);
    column_cabecalho.innerHTML = 'Tamanho';
    column_cabecalho = row.insertCell(3);
    column_cabecalho.innerHTML = 'Preço';
    column_cabecalho = row.insertCell(4);
    column_cabecalho.innerHTML = 'Qt';   

    for(x=0; x< lista_empresas.length; x++ )
    {
	var cod_empresa = lista_empresas[x];	
	var rowEmpresa = table.insertRow(row.rowIndex+1);

        //Insere o nome da empresa primeiro para dar uma identação antes de exibir seus produtos
	rowEmpresa.id = "row"+cod_empresa;
	rowEmpresa.className = "empresaPedido";
	var coluna = rowEmpresa.insertCell(0);
	coluna.innerHTML = carrinho[cod_empresa].nome_empresa;
	rowEmpresa.insertCell(1);
	rowEmpresa.insertCell(2);
	rowEmpresa.insertCell(3);
	rowEmpresa.insertCell(4);

	//obtem as chaves referente aos produtos escolhidos da empresa
	var lista_produtos = (new Hash(hash.get(cod_empresa))).getKeys();
	//agora precisa tirar a chave 'nome_empresa' para nao atrapalhar
	if(lista_produtos[0] == 'nome_empresa')
	    lista_produtos.shift();
	else if (lista_produtos[lista_produtos.length-1] == 'nome_empresa' )
	    lista_produtos.pop();

	//itera até o penultimo elemento porque o ultimo é lixo
	for(z = 0; z < lista_produtos.length; z++)
	{
	    var cod_tamanho_produto = lista_produtos[z];
	    //insere uma nova linha logo abaixo da linha rowEmpresa
	    var rowProduto = table.insertRow(rowEmpresa.rowIndex + 1);

	    rowProduto.insertCell(0);//insere a coluna em branco

	    coluna = rowProduto.insertCell(1);
	    coluna.className = "itensPedido";
	    coluna.id = "colunaProduto"+cod_tamanho_produto;
	    coluna.innerHTML = carrinho[cod_empresa][cod_tamanho_produto].nome_produto;

	    coluna = rowProduto.insertCell(2);
	    coluna.className = "itensPedido";
	    coluna.id = "colunaTamanho"+cod_tamanho_produto;
	    coluna.innerHTML = carrinho[cod_empresa][cod_tamanho_produto].tamanho;

	    coluna = rowProduto.insertCell(3);
	    coluna.className = "itensPedido";
	    coluna.id = "colunaPreco"+cod_tamanho_produto;
	    coluna.innerHTML =  carrinho[cod_empresa][cod_tamanho_produto].preco;

	    coluna = rowProduto.insertCell(4);
	    coluna.className = "itensPedido";
	    coluna.id = "colunaQuantidade"+cod_tamanho_produto;
	    coluna.innerHTML =  carrinho[cod_empresa][cod_tamanho_produto].quantidade;

	    //insere botao de exclusao de item
	    coluna = rowProduto.insertCell(5);
	    coluna.innerHTML = "<img src='/img/minus_circle.png' onclick='javascript:removeUmaUnidadeProdutoCarrinhoActionAjax("+cod_empresa+","+cod_tamanho_produto+")'> ";
	
	}
    }

}


function checkMailAjax(mail)
{

       $.ajax({
	type: "POST",
	url:"/portal/cliente/check-Mail-Ajax/email/"+mail,
	success: function(r) {
	    r=jQuery.trim(r);

	    if(r == 'Fail')
	    {
		    $("#spanMail").html("Esse e-mail já foi cadastrado. Favor escolher outro.");
	    }
	    else
	    {
		    $("#spanMail").html("");
	    }
	}
    });


}



