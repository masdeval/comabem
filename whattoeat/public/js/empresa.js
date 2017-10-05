/*
 * Neste arquivo estao as funcoes javascripts especificas para fazer validacoes no cadastro de empresas.
 *
 *
 */

function checkUrl(elem, empId) {

    val = elem.value;
    status = false;
    reqURL = base_url + '/estabelecimento/empresa/check-Url/url/' + val + '/id/' + empId;

    $.ajax({
        type: "GET",
        url: reqURL,
        success: function (r) {
            r = jQuery.trim(r);
            //alert(r)
            if (r == 'F') {
                var msg = 'URL já existe.Por favor usar outro url.';
                $('#spanUrl').html(msg);
                $('#spanUrl').show();
                elem.value = "";
                status = false;
                return status;
            } else {
                $('#spanUrl').html('');
                $('#spanUrl').hide();
                status = true;
                return status;
            }
        }
    });


}

function obterCidadePorEstado(elem) {

    cod_estado = elem.value;    
    status = false;
    reqURL = base_url + '/estabelecimento/empresa/get-Cidade/cod_estado/' + cod_estado;

    $.ajax({
        type: "GET",
        url: reqURL,
        success: function (r) {
            r = jQuery.trim(r);

            document.getElementById('comboCidade').options.length = 0;
            
            var JSONObject = JSON.parse(r);
            for (var key in JSONObject) {

                if (JSONObject.hasOwnProperty(key)) {

                    var option = document.createElement("option");
                    option.textContent = JSONObject[key];
                    option.value = key;
                    document.getElementById('comboCidade').add(option);

                }
            }

        }

    });


}


function checkTipoProdutoDeletion(tipoProduto, empId) {

    /* Uma empresa pode trabalhar com varios tipos de produtos e isso é controlado nessa tabela.
     * Essa tabela possui uma chave composta formada por COD_TIPO_PRODUTO E COD_EMPRESA.
     * Quando os produtos de uma empresa sao cadastrados deve-se informar qual é o seu tipo. É apresentada
     * uma lista apenas com os tipos de produto da empresa em questao.
     *
     * Obs: Nao é permitido remover um tipo de produto de uma empresa caso já exista algum produto dessa
     * empresa relacionado com o tipo que pretende-se excluir. (integridade referencial)
     */


    if (tipoProduto.checked == true) {//se esta incluindo o tipo produto, nao precisa verificacao        
        return;
    }
    val = tipoProduto.value; //valor do cod_tipo_produto clicado na tela
    status = false;
    reqURL = base_url + '/estabelecimento/empresa/check-Tipo-Produto-Deletion/empresaId/' + empId + '/idTipoProduto/' + val;

    $.ajax({
        type: "GET",
        url: reqURL,
        success: function (r) {
            r = jQuery.trim(r);
            //alert(r)
            if (r != 'OK') {
                $('#spanTipoProduto').html(r);
                $('#spanTipoProduto').show();
                tipoProduto.checked = true;
                status = false;
                return status;
            } else {
                $('#spanTipoProduto').html('');
                $('#spanTipoProduto').hide();
                status = true;
                return status;
            }
        }
    });


}
