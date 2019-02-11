/*PARA CORREGIR EL PROBLEMA DEL DELETE Y DE LA ACTUALIZACION DE LOS COSTOS TOTALES SE PUEDE METER UN INPUT HIDDEN CON EL VALOR DEL COSTO OBTENIDO POR AJAX EN CADA ROW, LUEGO MEDIANTE UN FOREACH SE TOMAN TODOS LOS COSTOS, SE MULTIPLICAN POR LAS CANTIDADES Y SE SUMAN EN EL TOTAL.
PARA EL BORRADO SE TOMA EL ID DEL BOTON, SE BUSCA EL PADRE Y DIRECTAMENTE ABAJO SE LOCALIZA EL COSTO*CANTIDAD Y SE RESTA DEL TOTAL*/
$(document).ready(function() {
	
	total = 0;
	var cantidad = [];
	var cost = [];
	cont = 0;
	var codigo;
	//BORRA EL PARAMETRO
	function sustraerMP(id_delbtn){
		console.log(id_delbtn);
		$('#' + id_delbtn).parent().parent().show().hide();

		calcular();
	}
	//Ejecuta el script al cargar la pagina
	//$('#popup').hide();

	//SECCION PARA CREAR EL NUEVO PARAMETRO, GUARDA EN DB Y MUESTRA EN LISTA
	//GUARDANDO EL PARAMETRO EN DB
	var token = $("#token").val();
	
	$('a[id="create_mp"]').click(function(){
		$('#par_codigo').val(codigo);
		var par_nombre = $('#par_nombre').val();
		var par_unidad = $('#par_unidad').val();
		var par_costo = $('#par_costo').val();	
		var par_observacion = $('#par_observacion').val();
		var par_codigo = codigo;
		$.ajax({
	        type: "POST",
	        url: '/createParam',
	        headers:{'X-CSRF-TOKEN': token},
	        data: {par_nombre: par_nombre, par_codigo:par_codigo, par_unidad: par_unidad, par_costo:par_costo, par_observacion:par_observacion },
	        success: function( data ) {
	         	$.each(data, function (i, item) {
	            	console.log(item["message"]);
				});  			
			}
	    });
	    $('#myModal').modal('toggle');
	    //MUESTRA EN LISTA
		var res = par_codigo.substr(0, 2);
		var per = "";
		if(res == "MP")
			per = "Perecedero";
		else
			per = "Imperecedero";
			
		$("#content tr:last").after("<tr><td>"+par_nombre+"</td><td class='codigo'>"+par_codigo+"<input type='hidden' name='codigo[]' value='"+par_codigo+"'></td><td>"+per+"</td><td width='9%'><input type='text' class='form-control' name='qty[]' id='qty-"+cont+"'></td><td>"+par_unidad+"</td><td><input type='text' class='form-control' name='cost[]' id='cost-"+cont+"' value='"+par_costo+"'></td><td width='7%'><input class='form-control' type='text' name='alicuota[]' id='alicuota-"+cont+"' value='12%'></td><td><input class='form-control' type='text' name='ivamonto[]' id='ivamonto-"+cont+"'></td><td><input class='form-control' type='text' name='costoProducto[]' id='costoProducto-"+cont+"'></td><td><a href='#' class='btn btn-danger btn-sm' id='remove-"+cont+"'>Quitar</a></td></tr>");

		cont++;
		cantidad.push(0);
		cost.push(0);
		calcularTotal(par_costo);
		/*
		$('a[id^="remove"]').click(function(){
			//alert("trigger");
			sustraerMP(this.id);
		});
		*/
		$("#content").on("click", 'a[id^="remove"]', function() {
		  	$(this).parent().parent().remove();
		  	calcular();
		});
	});

	/*INICIO DE SECCION PARA CAMBIAR EL PRECIO DE PARAMETRO DENTRO DE COMPRAS*/
	/*
	<a target='_blank' href='/parametro/' class='btn btn-danger btn-sm'>Editar Precio</a>
	*/
	/*FIN DE SECCION PARA CAMBIAR EL PRECIO DE PARAMETRO DENTRO DE COMPRAS*/

	//FIN DE SECCIÓN PARA CREAR EL NUEVO PARAMETRO
	var unidad = "";
	//AGREGA UN PARÁMETRO YA CREADO SELECCIONANDOLO DEL DROPLIST
	$('a[id="add"]').click(function(){

		var seleccion = $("#sel_param").find(":selected").text();
		var texto = seleccion.substr(11);
		var valor = $("#sel_param").find(":selected").val();
		var res = valor.substr(0, 2);
		var per = "";
		if(res == "MP")
			per = "Perecedero";
		else
			per = "Imperecedero";
		//Obteniendo la unidad para ponerla en la lista
		var param;
		$.ajax({
		    type: "POST",
		    url: '/getParam',
		    headers:{'X-CSRF-TOKEN': token},
		    data: {par_nombre: texto},
		    success: function( data ) {
		    	console.log(data);
		       	$.each(data, function (i, item) {
					//console.log(item["parametro"]["par_unidad"]);
		           	if(item!==null){
			           	console.log(item["par_unidad"]);
			            useReturnData(item);	
		            }
		        }); 					
			},
			error: function(){
                alert("Ajax error crear_mp.js/getParam.");
            }			
		});
		function useReturnData(data){
		    param = data;
		    console.log(param);

		    /*SE DEBEN USAR LAS VARIABLES DENTRO DEL AMBITO DE ESTA FUNCION*/

		    $("#content tr:last").after("<tr><td id='nombre-"+cont+"'>"+texto+"</td><td class='codigo'>"+valor+"<input type='hidden' name='codigo[]' value='"+valor+"'></td><td>"+per+"</td><td width='9%'><input type='text' class='form-control' name='qty[]' id='qty-"+cont+"'></td><td>"+param["par_unidad"]+"</td><td><input type='text' class='form-control' name='cost[]' id='cost-"+cont+"' value='"+param["par_costo"]+"'></td><td><input type='checkbox' class='form-control' name='update[]' id='update-"+cont+"' value='"+valor+"'></td><td width='7%'><input class='form-control' type='text' name='alicuota[]' id='alicuota-"+cont+"' value='12%'></td><td><input class='form-control' type='text' name='ivamonto[]' id='ivamonto-"+cont+"'></td><td><input class='form-control' type='text' name='costoProducto[]' id='costoProducto-"+cont+"'></td><td><a href='#' class='btn btn-danger btn-sm' id='remove-"+cont+"'>Quitar</a></td></tr>");
		   	//boton de editar
			/*<a href='/parametro/"+param["id"]+"/edit' class='btn btn-warning btn-xs' id='edit-"+cont+"' target='_blank'>Editar</a>*/
			cont++;
			cantidad.push(0);
			cost.push(0);
			calcularTotal();
		};
		/*
		$('a[id^="remove"]').click(function(){			
			//alert("trigger");
			sustraerMP(this.id);
		});
		*/
		$("#content").on("click", 'a[id^="remove"]', function() {
		  	$(this).parent().parent().remove();
		  	calcular();
		});
	});

	/*SECCION PARA CREAR UN CÓDIGO PSEUDOALEATORIO QUE NO ESTE GUARDADO EN BASE DE DATOS AL CREAR UN NUEVO PARÁMETRO*/

	var perecedero = "";	
	$('#mpomi').change(function(){	        
        if(this.value == "1"){
        	perecedero = "MP";
        }else{
        	perecedero = "MI";
        }

        $.ajax({
         	type: "POST",
            url: '/checkCode',
            headers:{'X-CSRF-TOKEN': token},
            data: {perecedero:perecedero},
            success: function( data ) {
            	$.each(data, function (i, item) {
            		//console.log(item["code"]);
            		codigo = item["code"];            		   
				});		
			}
    	});
  
    });  
    
	/*FIN DE SECCIÓN DE CÓDIGO DE MATERIA PRIMA*/

	/*INICIO DE SECCION PARA LA ACTUALIZACIÓN DE LOS COSTOS TOTALES EN CAMPOS HIDDEN*/
	$('#actualizar').click(function(e){
		e.preventDefault();
		actualizarCostos();
		/*
		setTimeout(function(){
			calcular();
		}, 1000);	
		*/	
	});
	function actualizarCostos(){
		var texto = "";
		var costo;
		var cantidad;
		var costoTotal = 0;
		$.each($('input[id^="qty"]'),function(){
		//$( 'input[id^="qty"]' ).each(function(i,element) {
			cantidad = $( this ).val();
			texto = $( this ).parent().parent().find('td[id^="nombre"]').html();
			console.log("texto: "+texto);
			costo = $( this ).siblings("input");

			/*USO UN CLOSURE EN ESTA FUNCIÓN ANONIMA PARA UTILIZAR TEXTO COMO UNA VARIABLE PRIVADA Y QUE SE ACTUALICE DENTRO DE LA FUNCION AJAX ASINCRONA*/
			(function (texto,cantidad) {
				$.ajax({
				    type: "POST",
				    url: '/getParam',
				    headers:{'X-CSRF-TOKEN': token},
				    data: {par_nombre: texto},
				    success: function( data ) {
				    	if(data!==null){
				    		costo.val(data['parametro']['par_costo']);
				    		console.log("Actualizando item "+texto+" a costo "+costo.val());	
				    		
							console.log('cantidad: '+cantidad);
							costoTotal += cantidad*costo.val();

							var iva = $('#iva').val();
							var ivadecimal = parseFloat(iva.replace("%", "")/100);
							var totaliva = costoTotal*ivadecimal;
							$('#total').html(addCommas(costoTotal));
							$('#totalIva').html(addCommas(totaliva));	
							$('#totalMasIva').html(addCommas(totaliva+costoTotal));
							$('#comp_monto').val(totaliva+costoTotal);	
						}	        					
					},
					error: function(){
		                alert("Ajax error crear_mp.js/getParam.");
		            }			
				});
			})(texto,cantidad);
		});	
		
	}

	/*FIN DE SECCION PARA LA ACTUALIZACIÓN DE LOS COSTOS TOTALES EN CAMPOS HIDDEN*/

	/*SECCION PARA EL CALCULO DE LOS TOTALES DE COMPRAS*/
	function calcularTotal(){
		$('input[id^="qty"],input[id^="cost"],input[id^="alicuota"], #iva').keyup(function(){	
			calcular();			
	    });
	}
	function calcular(){
		//CALCULA TODO
			var costoTotal = 0;
			var ivaTotal = 0;
			var ivaCompleto = 0;
			console.log('calculos: ');
			$( 'input[id^="qty"]:not(:hidden)' ).each(function() {						
				var cantidad = $( this ).val();

				var costo = $( this ).parent().parent().find('input[id^="cost"]').val();
				var alicuota = $( this ).parent().parent().find('input[id^="alicuota"]').val();
				var alicuotadec = parseFloat(alicuota.replace("%", "")/100);
				//console.log('costo item '+$( this ).attr('id')+': '+costo);
				var IVA = alicuotadec*costo*cantidad;
				//console.log('IVA ('+$( this ).attr('id')+') = '+alicuotadec*costo*cantidad);
				$( this ).parent().parent().find('input[id^="ivamonto"]').val(IVA);
				$( this ).parent().parent().find('input[id^="costoProducto"]').val(costo*cantidad);	
				costoTotal += cantidad*costo;
				ivaTotal+=IVA;
			});
			//console.log('total: '+costoTotal);	
			$('#total').html(addCommas(costoTotal));
			$('#totalIva').html(addCommas(ivaTotal));	
			$('#totalMasIva').html(addCommas(ivaTotal+costoTotal));
			$('#comp_monto').val(ivaTotal+costoTotal);
	}
	/*FIN DE SECCION DE CALCULO*/

	/*SECCION PARA AGREGAR COMAS A MILES EN CALCULOS*/
	function addCommas(nStr)
	{
	    nStr += '';
	    x = nStr.split('.');
	    x1 = x[0];
	    x2 = x.length > 1 ? '.' + x[1] : '';
	    var rgx = /(\d+)(\d{3})/;
	    while (rgx.test(x1)) {
	        x1 = x1.replace(rgx, '$1' + ',' + '$2');
	    }
	    return x1 + x2;
	}
	/*FIN DE SECCION DE COMAS*/

	/*SECCION DE GUARDAR CAMBIOS Y TERMINAR*/
	
	/*
	$('#finish').click(function(){
		//Actualiza el monto de la compra en tabla compras
		var id = $('#id').val();
		var banco = $('#banco').val();
		var monto = $('#totalMasIva').html();
		var monto = monto.replace(/\,/g, '');
		//alert(monto);
		$.ajax({
		    type: "POST",
		    url: '/montoUpd',
		    headers:{'X-CSRF-TOKEN': token},
		    data: {id: id, comp_monto: monto, banco: banco},
		    success: function( data ) {
		        $.each(data, function (i, item) {
		            console.log(item["message"]);
		            console.log(item["banco"]);
		            console.log(item["transaccion"]);
		            console.log(item["saldo_previo"]);
		            console.log(item["saldo_posterior"]);
				});
			}
		});		
		$('input[id^="qty"]').each(function(){
			var quantity = $(this).val();
			var codigo = $(this).parent().parent().find('.codigo').html(); 
			//HACE EL LOG DE LOS CAMBIOS EN CARDEXMP
			var comp_doc = $('#comp_doc').val();
		    $.ajax({
		        type: "POST",
		        url: '/logCardexMP',
		        headers:{'X-CSRF-TOKEN': token},
		        data: {mp_codigo: codigo, mp_cantidad: quantity, comp_doc:comp_doc, id: id},
		        success: function( data ) {
		         	$.each(data, function (i, item) {	
		         		/*
		         		console.log("ID: "+item["id"]);	            	
		            	console.log(item["mp_codigo"]);
		            	console.log(item["comp_doc"]);
		            	console.log(item["car_valor_anterior"]);
		            	console.log(item["car_valor_actual"]);
		            	console.log(item["message"]);
		            	*/
		            	//window.location.href = "compra";
		            	/*
					});  			
				}
		    });
			//Se debe chequear si el mp_codigo existe en materiasprimas, si no, se crea.		
			$.ajax({
		        type: "POST",
		        url: '/createMP',
		        headers:{'X-CSRF-TOKEN': token},
		        data: {mp_codigo: codigo, mp_cantidad: quantity},
		        success: function( data ) {
		         	$.each(data, function (i, item) {
		         		
		            	//console.log(item["message"]);
		            	
		            	//window.location.href = "compra";
					});  			
				}
		    });			      
	    });	 
	    window.location.href = "compra";	    
	});
	*/
	/*FIN DE SECCION DE GUARDAR CAMBIOS Y TERMINAR*/
});