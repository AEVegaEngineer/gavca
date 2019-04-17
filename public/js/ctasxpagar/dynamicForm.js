$(document).ready(function() {
    
    /*
    PEQUEÑO SCRIPT PARA AJUSTAR LA VISTA, 
    PARA PASAR LA DATA RECOJIDA A UN LADO U OTRO DEPENDIENDO DE SI 
    LA VENTA FUE A CONTADO O A CRÉDITO
    */
    var entidad = "Caja Chica";
    var token = $("#token").val();
    $(':input[type="submit"]').prop('disabled', true);
    getDisponible();
    $('#banco').hide();
    $('select[name=banco_o_caja]').change(function(){          
        if(this.value == "caja"){
            $('#banco').fadeOut('slow');
            entidad = "Caja Chica";
        }else if(this.value == "banco"){
            $('#banco').fadeIn('slow');
            entidad = "Banco de Venezuela";            
        }      
        getDisponible();       
        
    });
    $('select[name=banco]').change(function(){          
        entidad = this.value;  
        getDisponible();              
    });   
    $('input[name=abono],input[name=concepto]').keyup(function(){                 
        validarMonto();
    });
    function getDisponible()
    {        
        $.ajax({
            type: "POST",
            url: '/getDisponible',
            headers:{'X-CSRF-TOKEN': token},
            data: {entidad: entidad},
            error: function(){
                //alert("Error. Intente escribir los datos de nuevo.");
            },
            success: function( data ) {
                if(data){
                    $('#disponible').html(addCommas(data));
                    $('#disponible_hidden').val(data);
                    console.log('copiado a disponible_hidden');
                    validarMonto();
                }       
            }
        });  
        return;       
    }   
    function addCommas(nStr)
    {
        nStr += '';
        x = nStr.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? ',' + x[1] : ',00';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + '.' + '$2');
        }
        return x1 + x2;
    } 
    function validarMonto()
    {       
        var monto = $('input[name=abono]').val();  
        var disponible = $('#disponible_hidden').val();
        console.log("Validando monto: "+monto+", disponible: "+disponible);
        var deuda = $('#deuda').val();
        if (parseFloat(monto) > parseFloat(disponible))
        {
            $('#error-msg').html("Error. El monto del abono es mayor al disponible");
            $(':input[type="submit"]').prop('disabled', true);
        }
        else if(parseFloat(monto) < 0)
        {
            $('#error-msg').html("Error. El monto del abono no puede ser negativo");
            $(':input[type="submit"]').prop('disabled', true);
        }
        else if(parseFloat(monto) > parseFloat(deuda))
        {
            $('#error-msg').html("Error. El monto del abono es mayor a la deuda");
            $(':input[type="submit"]').prop('disabled', true);
        }
        else
        {
            $('#error-msg').html("");
            $(':input[type="submit"]').prop('disabled', false);
        }      
    }
});	