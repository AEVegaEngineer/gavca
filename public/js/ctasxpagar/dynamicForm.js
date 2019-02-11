$(document).ready(function() {
	/*PEQUEÑA SECCIÓN PARA AJUSTAR LA VISTA DEL FORMULARIO DE VENTA, PARA PASAR LA DATA RECOJIDA A UN LADO U OTRO DEPENDIENDO DE SI LA VENTA FUE A CONTADO O A CRÉDITO*/
    $('#banco').hide();
    $('select[name=banco_o_caja]').change(function(){          
        if(this.value == "caja"){
            $('#banco').fadeOut('slow');
        }else if(this.value == "banco"){
            $('#banco').fadeIn('slow');
        }
    });
});	