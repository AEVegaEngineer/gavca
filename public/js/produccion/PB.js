//Calculo de porcentajes sobre el total de los parámetros
	$i=0;

	var str = $("#total").html();
	if(typeof(str) === "undefined")
	{
		str = $("#total_directo").html();
		/*
		console.log(str);
		x = str.split(',');
	    str = x[0]+"%";
	    */
	}
	//str = str.replace(",","");
	while(str.indexOf(".") != -1)
		str = str.replace(".","");
	str = str.replace(",",".");
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
		while(str.indexOf(".") != -1)
			str = str.replace(".","");
		str = str.replace(",",".");
		
		$unit = parseFloat(str);
		//console.log($unit);
		$result = parseFloat($unit/$total*100).toFixed(2);
		//console.log($unit+"/"+$total+"="+$unit/$total);	
		$("#over-"+$i).html($result+"%");
		//alert($unit/$total*100);
		$i++;		
	});
	var token = $("#token").val();
	var costo = $('#total').html();
	var rec_nombre = $('#rec_nombre').val();
	var pro_fecha = $('#pro_fecha').val();
	
	
	