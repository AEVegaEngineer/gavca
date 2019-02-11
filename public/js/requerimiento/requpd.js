
$(document).ready(function() {
	//Ejecuta el script al cargar la pagina	
	
	var token = $("#token").val();
	
	$("#req_upd").click(function(e){
		e.preventDefault();	
		if(check_req_dependencia()){
			//alert("Correcto");
			//create_production(rec_nombre,req_fecha,pro_etapa,cantidad_produccion,pro_mano_obra);
			add_req_dependencia();
			add_requerimiento();
			$('#formulario').submit();
			//relocalizar();
			
		}else{
			alert("No hay suficientes ingredientes para crear esta producción. Revise la existencia de los ingredientes listados aquí.");
		}		
		
	})	

	//$("#content ul li:last").append("<li>"+ingrediente+"</li>");

	/*
	PRIMERO DEBO RECORRER TODOS LOS VALORES TANTO PARA LAS DEPENDENCIAS COMO PARA LOS REQUERIMIENTOS NORMALES, REVISAR QUE EXISTAN EN INVENTARIO Y SI TODO EXISTE HACER LOS REGISTROS
	*/
	function add_requerimiento(){
		$("input[id^=val]").each(function(){ 
			var req_total = $(this).val();
			var id = $(this).attr('id');
			var req_ingrediente = id.replace("val-", "");
			$.ajax({
	            type: "POST",
	            url: '/reqUpd',
	            headers:{'X-CSRF-TOKEN': token},
	            data: {req_total: req_total, rec_nombre: rec_nombre, req_fecha: req_fecha, req_ingrediente:req_ingrediente},
	            success: function( data ) {
	            				
				}
	    	});
		});
		req_fecha = req_fecha.replace("/", "-");
		req_fecha = req_fecha.replace("/", "-");
	}

	function add_req_dependencia(){
		$("input[id^=dep]").each(function(){ 
			var requerimiento = $(this).val();
			var id = $(this).attr('id');
			id = id.replace("dep-", "");
			$.ajax({
	            type: "POST",
	            url: '/reqDepUpd',
	            headers:{'X-CSRF-TOKEN': token},
	            data: {requerimiento: requerimiento, dep_padre: rec_nombre, id:id},
	            success: function( data ) {
	            	console.log('Requerimiento '+requerimiento+' de dependencia guardado');			
				}
	    	});
		});		
	}

	function check_req_dependencia(){

		var flag = 1;
		$("input[id^=dep]").each(function(){ 
			var requerimiento = $(this).val();
			var id = $(this).attr('id');
			id = id.replace("dep-", "");
			//EJEMPLO
			//requerimiento : 100
			//dep_padre: antipasto de atun (receta B)
			//id: picadura de antipasto (receta A)
			$.ajax({
	            type: "POST",
	            url: '/checkDep',
	            headers:{'X-CSRF-TOKEN': token},

	            data: {requerimiento: requerimiento, dep_padre: rec_nombre, id:id},
	            success: function( data ) {
	            	console.log(data["message"]);
	            	if(data["message"]=='success')
	            		flag = 1;
	            	else
	            		flag = 0;
				}
	    	});
		});		
		if(flag==1)
			return true;
		else
			return false;
	}
	/*
	function create_production(rec_nombre,req_fecha,pro_etapa,cantidad_produccion,pro_mano_obra){
		$.ajax({
	        type: "POST",
	        url: '/storeProd',
	        headers:{'X-CSRF-TOKEN': token},
	        data: {rec_nombre: rec_nombre, req_fecha: req_fecha, pro_etapa:pro_etapa, cantidad_produccion:cantidad_produccion, pro_mano_obra:pro_mano_obra},
	        success: function( data ) {
	            console.log(data["message"]);	            	
			}
	    });	
	}
	*/
	function relocalizar(){
		alert("Se han actualizado los requerimientos correctamente");
		window.location = "/verProduccion/"+rec_nombre+"/"+req_fecha;
	}
});