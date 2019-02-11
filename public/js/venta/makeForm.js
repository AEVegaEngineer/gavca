$(document).ready(function() {
	/*PEQUEÑA SECCIÓN PARA AJUSTAR LA VISTA DEL FORMULARIO DE VENTA, PARA PASAR LA DATA RECOJIDA A UN LADO U OTRO DEPENDIENDO DE SI LA VENTA FUE A CONTADO O A CRÉDITO*/
    $('#banco_o_caja').hide();
    $('#banco').hide();
    $('select[name=ven_condicion]').change(function(){          
        if(this.value == "credito"){
            $('#banco_o_caja').fadeOut('slow');
            $('#banco').fadeOut('slow');
        }else if(this.value == "contado"){
            $('#banco_o_caja').fadeIn('slow');
        }
    });
    $('select[name=banco_o_caja]').change(function(){          
        if(this.value == "caja"){
            $('#banco').fadeOut('slow');
        }else if(this.value == "banco"){
            $('#banco').fadeIn('slow');
        }
    });
});	