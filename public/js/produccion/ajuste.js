$(document).ready(function() {
	var existenteNro = 0;
	$('#insertar-existente').click(function(e){
		existenteNro++;
		e.preventDefault();
		var existente = $("#existente").val();
		$("#existentes tr:last").after("<tr><td><input class='form-control' type='text' name='ex_nombre[]' required='required' placeholder='Nombre' value='"+existente+"' readonly></td><td><input class='form-control' type='text' name='ex_cantidad[]' required='required' placeholder='Cantidad' ></td><td><a href='#' id='quitar' class='btn btn-danger btn-sm'>Quitar</a></td></tr>");
		$('#quitar').click(function(){
			$(this).parent().parent().show().hide();
		});
	});

	$('#insertar-nuevo').click(function(e){
		e.preventDefault();
		$("#nuevos tr:last").after("<tr><td><input class='form-control' type='text' name='noex_nombre[]' required='required' placeholder='Nombre de M.P.'></td><td><input class='form-control' type='text' name='noex_unidad[]' required='required' placeholder='Unidad'></td><td><input class='form-control' type='text' name='noex_costo[]' required='required' placeholder='Costo'></td><td><input class='form-control' type='text' name='noex_cantidad[]' required='required' placeholder='Cantidad'></td><td><select name='noex_perecedero[]' class='form-control'><option disabled selected value>¿Perecedero?</option><option value='si'>Sí</option><option value='no'>No</option></select></td><td><a href='#' id='quitar' class='btn btn-danger btn-sm'>Quitar</a></td></tr>");
		$('#quitar').click(function(){
			$(this).parent().parent().show().hide();
		});
	});

	
	
});