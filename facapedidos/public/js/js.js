jQuery(document).ready(function() {
    jQuery('#carrossel').jcarousel({
        visible: 8
    });
    
    $('.jcarousel-item-horizontal').click(function() {
    	$('.jcarousel-item-horizontal').removeClass('atual');
    	$(this).addClass('atual');
    });
 
    
    $('.icone-max').click(function() {
    	eusozinho = $(this).parent().parent();
	$('#conteudo_main .grid .grid-conteudo').removeClass('grid-grande');
	$(eusozinho).children('.grid-conteudo').addClass('grid-grande');
    });
    
    $('.icone-min').click(function() {
    	meugrid =$(this).parent().parent();
    	$('#conteudo_main .grid .grid-conteudo').removeClass('grid-grande');
    	$(meugrid).addClass('grid-min');
    });
    
    $('#carrossel > li').mouseover(function(){
    	$('#submenu > ul').css('display','none');
    });
    
    $('#menu_pedido').mousemove(function(){
    	$('#submenu_pedido').css('display','block');
    });
    
    $('#menu_usuario').mousemove(function(){
    	$('#submenu_usuario').css('display','block');
    });
    
});
