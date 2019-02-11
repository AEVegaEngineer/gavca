$(document).ready(function() {
	//Ejecuta el script al cargar la pagina
	//$('#popup').hide();
	//ADD INGREDIENTE
	var token = $("#token").val();
	var salario = $('#salario_integral').html();
	salario = salario.replace("<b>", "");
	salario = salario.replace("</b>", "");
	var salario = salario.replace(/\,/g, '');
	//alert(salario);
	store_salary();

	function store_salary(){
		$.ajax({
            type: "POST",
            url: '/storeSalario',
            headers:{'X-CSRF-TOKEN': token},
            data: {salario: salario},
            success: function( data ) {
            	$.each(data, function (i, item) {
            		//location.reload();
            		console.log('Salary Stored.')
				});  			
				          	
            }
    	});
	}
});