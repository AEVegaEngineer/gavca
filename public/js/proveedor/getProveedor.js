


$(document).ready(function() {
    var token;
    var proveedor;
    $(document).on('keyup','#comp_proveedor',function(){
        token = $("#token").val();
        proveedor = $("#comp_proveedor").val(); 
        getProveedor();
    });    
    function captureClicks(){
        $('.posibility').on('click',function(e){
            e.preventDefault();
            $('#comp_proveedor').val($(this).text());
            $("#posibilities").html('');
            $("#livesearch").html('');  
            $("#btn-submit").prop('disabled', false);          
        });
    }
    function getProveedor(){
        $.ajax({
            type: "POST",
            url: '/getProveedor',
            headers:{'X-CSRF-TOKEN': token},
            data: {proveedor: proveedor},
            error: function(){
                //alert("Error. Intente escribir los datos de nuevo.");
            },
            success: function( data ) {
                if(data){
                    //console.log('existe');
                    $("#livesearch").html('');
                    $("#btn-submit").prop('disabled', false);
                }
                else{
                    //console.log('no existe');
                    $("#livesearch").html('<span>No existe este proveedor, ¿desea crear uno nuevo?</span><br><a href="#" id="provider-form" class="btn btn-default">Sí</a>');
                    $("#btn-submit").prop('disabled', true); 
                    $("#provider-form").click(function(e){  
                        e.preventDefault()
                        createProviderForm();
                        $code = $('#codigo').val();
                        $('#comp_proveedor').val($code);
                        $('#posibilities').html('')
                    });
                }        
            }
        });
        console.log('ejecutando searchProveedor2'); 
        if(proveedor != ""){   
            $.ajax({
                type: "POST",
                url: '/searchProveedor',
                headers:{'X-CSRF-TOKEN': token},
                data: {proveedor: proveedor},
                error: function(){
                    //alert("Error. Intente escribir los datos de nuevo.");
                },
                success: function( data ) {
                    if(data){
                        $("#posibilities").html('<p>Quizá quiso decir:</p>');                    
                        var arr = $.map(data, function(el) { return el });
                        console.log(arr);
                        $.each( arr, function( key, value ) {
                            $("#posibilities").append('<li><a href="#" class="posibility">'+value.prov_codigo+'</a>'+" - "+value.prov_nombre+'</li>');
                        });  
                        captureClicks();   
                        if(arr.length===0){
                            $('#posibilities').html('')
                        }                   
                    }
                }
            });
        }else{
            $("#posibilities").html('');
        }

    }
    function createProviderForm(){
        $("#livesearch").html("<hr><div class='row margenBotSm'><div class='col-xs-12 col-md-4'><label>Nombre del proveedor</label></div><div class='col-xs-12 col-md-5'><input type='text' class='form-control' placeholder='Ingresa el nombre del proveedor' id='prov_nombre' required='required'></div></div><div class='row margenBotSm'><div class='col-xs-12 col-md-4'><label>Rif del proveedor</label></div><div class='col-xs-12 col-md-5'><input type='text' class='form-control' placeholder='Ingresa el rif del proveedor' id='prov_rif' required='required'></div></div><div class='row margenBotSm'><div class='col-xs-12 col-md-4'><label>Dirección del proveedor</label></div><div class='col-xs-12 col-md-5'><input type='text' class='form-control' placeholder='Ingresa la dirección del proveedor' id='prov_direccion' required='required'></div></div><div class='row margenBotSm'><div class='col-xs-12 col-md-4'><label>Contácto del proveedor</label></div><div class='col-xs-12 col-md-5'><input type='text' class='form-control' placeholder='Ingresa el contácto del proveedor' id='prov_contacto' required='required'></div></div><div class='row margenBotSm'><div class='col-xs-12 col-md-4'><label>Observaciones del proveedor</label></div><div class='col-xs-12 col-md-5'><input type='text' class='form-control' placeholder='Ingresa las observaciones del proveedor' id='prov_condiciones'></div></div><div class='row margenBotSm'><div class='col-xs-12 col-md-4'><label>¿Al proveedor se le paga con crédito o de contado?</label></div><div class='col-xs-12 col-md-5'><select id='prov_cred_o_cont' class='form-control' placeholder='Selecciona el método de pago' required='required'><option value='credito'>Crédito</option><option value='contado'>Contado</option></select></div></div><div class='row margenBotSm'><div class='col-xs-12 col-md-5'><a href='#' id='insert_provider' class='btn btn-primary'>Crear Nuevo Proveedor</a></div></div> ");
        
        //INMEDIATAMENTE LUEGO DE INSERTAR EL FORMULARIO SE DEBE PONER LA ACCIÓN QUE SE DEBE TOMAR CON EL BOTON DE CREAR DEL FORMULARIO, ES LA UNICA FORMA DE QUE FUNCIONE

        //AL HACER CLICK CAPTURA DATOS Y ENVIA POST

        $("#insert_provider").click(function(e){      
            token = $("#token").val();
            proveedor = $("#comp_proveedor").val(); 
            var prov_nombre = $("#prov_nombre").val(); 
            var prov_rif = $("#prov_rif").val(); 
            var prov_direccion = $("#prov_direccion").val(); 
            var prov_contacto = $("#prov_contacto").val();
            var prov_condiciones = $("#prov_condiciones").val();
            var prov_retencion = 0;
            var prov_cred_o_cont = $("#prov_cred_o_cont").val(); 
            /*
            alert("prov_codigo: "+proveedor+"\nprov_nombre: "+prov_nombre+"\nprov_rif: "+prov_rif+"\nprov_direccion: "+prov_direccion+"\nprov_contacto: "+prov_contacto+"\nprov_condiciones: "+prov_condiciones+"\nprov_retencion: "+prov_retencion+"\nprov_cred_o_cont: "+prov_cred_o_cont);
            */
            $.ajax({
                type: "POST",
                url: '/storeProveedor',
                headers:{'X-CSRF-TOKEN': token},
                data: {prov_codigo:proveedor, prov_nombre: prov_nombre, prov_rif: prov_rif, prov_direccion: prov_direccion, prov_contacto: prov_contacto, prov_condiciones: prov_condiciones, prov_retencion: prov_retencion, prov_cred_o_cont: prov_cred_o_cont},
                error: function(){
                    alert("Necesita ingresar todos los datos del formulario.");
                },
                success: function( data ) {
                    if(data){
                        console.log('insertado');
                        $("#livesearch").html('Su proveedor ha sido creado exitosamente, ahora puede registrar la nueva compra.');
                        $("#btn-submit").prop('disabled', false); 
                    }
                    else{
                        console.log('no insertado');
                    }        
                }
            });
        });
    }
    /*PEQUEÑA SECCIÓN PARA AJUSTAR LA VISTA DEL FORMULARIO DE COMPRA, PARA PASAR LA DATA RECOJIDA A UN LADO U OTRO DEPENDIENDO DE SI LA COMPRA FUE A CONTADO O A CRÉDITO*/
    $('#banco_o_caja').hide();
    $('#banco').hide();
    $('select[name=comp_cred_cont]').change(function(){          
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