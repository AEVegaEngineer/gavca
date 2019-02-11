//Calculo de porcentajes sobre el total de los parámetros
	$i=0;

	var str = $("#total").html();
	str = str.replace(",","");
	$total = parseFloat(str);

	$("td[id^=over]").each(function(){
		/*
		por alguna razon me estaba creando un campo unit de mas y la forma de que no obtuviese un valor undefined fue filtrar que cuando llegara al final terminara el each
		*/
		if(typeof($("#unit-"+$i).html()) === "undefined"){
			return false;
		}
		str = $("#unit-"+$i).html();
		
		//alert($(this).html());
		str = str.replace(",","");
		$unit = parseFloat(str);
		$result = parseFloat($unit/$total*100).toFixed(2);		
		$("#over-"+$i).html($result+"%");
		//alert($unit/$total*100);
		$i++;
		
	});
	var token = $("#token").val();
	var costo = $('#total').html();
	costo = costo.replace(",",".");
	costo = costo.replace(".","");
	var rec_nombre = $('#rec_nombre').val();
	var pro_fecha = $('#pro_fecha').val();
	guardar_costos();
	function guardar_costos(){
		$.ajax({
	        type: "POST",
	        url: '/guardarCostos',
	        headers:{'X-CSRF-TOKEN': token},
	        data: {costo: costo,rec_nombre:rec_nombre,pro_fecha:pro_fecha},
	        success: function( data ) {
	           	console.log('insertado');		
			}
	    });	
		//alert("script ejecutado");	
	}
	
	