$(document).ready(function() {
	/*PEQUEÑA SECCIÓN PARA AJUSTAR LA VISTA DEL FORMULARIO DE VENTA, PARA PASAR LA DATA RECOJIDA A UN LADO U OTRO DEPENDIENDO DE SI LA VENTA FUE A CONTADO O A CRÉDITO*/
    var entidad = "Caja Chica";
    validarMonto();
    $('#banco').hide();
    $('select[name=banco_o_caja]').change(function(){          
        if(this.value == "caja"){
            $('#banco').fadeOut('slow');
        }else if(this.value == "banco"){
            $('#banco').fadeIn('slow');
        }
    });

    function validarMonto()
    {
        $('input[name=abono]').keyup(function(){  
                
            var monto = this.value;  
            var deuda = $('#deuda').val();
            if(parseFloat(monto) > parseFloat(deuda))
            {
                $('#error-msg').html("Error. El monto del cobro es mayor a la deuda");
                $(':input[type="submit"]').prop('disabled', true);
            }
            else if(monto<0)
            {
            	$('#error-msg').html("Error. El monto del cobro no puede ser negativo");
                $(':input[type="submit"]').prop('disabled', true);
            }
            else
            {
                $('#error-msg').html("");
                $(':input[type="submit"]').prop('disabled', false);
            }
        });      
    }
});	