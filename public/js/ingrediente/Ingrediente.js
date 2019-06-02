
$(document).ready(function() {
	//Ejecuta el script al cargar la pagina
	//$('#popup').hide();
	//ADD INGREDIENTE
	var token = $("#token").val();
	var ingrediente = $('#ing_ingrediente').find(":selected").val();
	var product = $('#product').find(":selected").val();
	
	$("#add").click(function(e){
		ingrediente = $('#ing_ingrediente').find(":selected").val();
		e.preventDefault();	
		add_ingredientes();
	});
	$("#addInsumo").click(function(e){
		insumo = $('#insing_insumo').find(":selected").val();
		e.preventDefault();	
		add_insumos(insumo);
	});
	$('#ing_ingrediente').change(function(){
		$("#ing_ratio").val('1');
	});

	//$("#content ul li:last").append("<li>"+ingrediente+"</li>");
	function add_ingredientes(){
		var ing_default;
		var ing_ratio = $("#ing_ratio").val();
		
		if ($('#par_default').is(":checked"))
			ing_default = 1;
		else
			ing_default = 0;
		//console.log(ingrediente+"\n"+ing_default+"\n"+ing_ratio);
		$.ajax({
            type: "POST",
            url: '/addIngrediente',
            headers:{'X-CSRF-TOKEN': token},
            data: {ingrediente: ingrediente, rec_nombre: rec_nombre, ing_default, ing_ratio:ing_ratio},
            success: function( data ) {
            	//console.log(data);
            	location.reload();         		
				          	
            }
    	});
	}

	function add_insumos(insumo){
		var insing_default;
		var insing_ratio = $("#insing_ratio").val();
		
		if ($('#insing_default').is(":checked"))
			insing_default = 1;
		else
			insing_default = 0;
		$.ajax({
            type: "POST",
            url: '/insumousado',
            headers:{'X-CSRF-TOKEN': token},
            data: {insumo: insumo, rec_nombre: rec_nombre, insing_default:insing_default, insing_ratio:insing_ratio},
            success: function( data ) {
            	//console.log(data);
            	location.reload();		
				          	
            }
    	});
    	
	}

	$("#addProduct").click(function(e){
		product = $('#product').find(":selected").val();
		//alert(product);
		relacion = $('#relacion').val();
		rec_nombre = $('#rec_nombre').val();
		e.preventDefault();			
		add_product();
	});
	function add_product(){
		console.log("producto seleccionado: "+product+"\nrelacion: "+relacion+"\nrec_nombre: "+rec_nombre);
		$.ajax({
            type: "POST",
            url: '/addDependencia',
            headers:{'X-CSRF-TOKEN': token},
            data: {product: product, rec_nombre: rec_nombre},
            success: function( data ) {
            	$.each(data, function (i, item) {
            		alert(item["message"]);
            		console.log(item["message"]);
            		location.reload();
				});  			
				          	
            }
    	});
	}

});