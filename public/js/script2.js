$(document).ready(function(){
	cargar();
});

function cargar(){
	var tablaDatos = $("#datos");
	var route = "/generos";
	$("#datos").empty();
	$.get(route,function(res){
		$(res).each(function(key,value){
			tablaDatos.append("<tr><td>"+value.genre+"</td><td><button type='button' value="+value.id+" OnClick='Mostrar(this)' class='btn btn-primary' data-toggle='modal' data-target='#editModal' data-whatever='"+value.genre+"'>Editar</button><button type='button' value="+value.id+" OnClick='Eliminar(this)' class='btn btn-danger'>Eliminar</button></td></tr>");
		});		
	});
}
function Eliminar(btn){
	var route = "/genero/"+btn.value+"";
	var token = $("#token").val();

	$.ajax({
		url: route, 
		headers: {'X-CSRF-TOKEN':token}, 
		type: 'DELETE',
		dataType: 'json',
		success: function(){
			cargar();
			$("#msj-success").fadeIn();
		}
	})
}
function Mostrar(btn){
	var route = "/genero/"+btn.value+"/edit";
	//PETICION AJAX
	$.get(route, function(res){
		$("#genre").val(res.genre);
		$("#id").val(res.id);
	});
}
$("#actualizar").click(function(){
	var value = $("#id").val();
	var dato = $("#genre").val();
	var route = "/genero/"+value+"";
	var token = $("#token").val();

	$.ajax({
		url: route, 
		headers: {'X-CSRF-TOKEN':token}, 
		type: 'PUT',
		dataType: 'json',
		data: {genre: dato},
		success: function(){
			cargar();
			$("#editModal").hide();
			$("#msj-success").fadeIn();
		}
	})
});


/* 
	SIN AJAX
$(document).ready(function(){
	var tablaDatos = $("#datos");
	var route = "/generos";

	$.get(route,function(res){
		$(res).each(function(key,value){
			tablaDatos.append("<tr><td>"+value.genre+"</td><td><button type='button' value="+value.id+" OnClick='Mostrar(this)' class='btn btn-primary' data-toggle='modal' data-target='#editModal' data-whatever='"+value.genre+"'>Editar</button><button class='btn btn-danger'>Borrar</button></td></tr>");
		});		
	});

	//crea los botones del menú de generos
	$.get(route,function(res){
		$(res).each(function(key,value){
			tablaDatos.append("<tr><td>"+value.genre+"</td><td><button type='button' id='btn"+value.genre+"' class='btn btn-primary' data-toggle='modal' data-target='#editModal' data-whatever='"+value.genre+"'>Editar</button><button class='btn btn-danger'>Borrar</button></td></tr>");
		});		
	});
	//agrega la funcionalidad al menu de generos
	$('#editModal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget); // boton que accionó el modal
		var genre = button.data('whatever'); // Extrae información de atributo data-*
		//Si fuese necesario, se podría iniciar una peticion AJAX aquí (y luego hacer un update en un callback)
		//Actualiza el contenido del modal. Aqui utilicé jQuery, pero se podría utilizar cualquier biblioteca que vincule data o algún otro método.
		var modal = $(this);
		modal.find('.modal-title').text('Editar ' + genre);
		modal.find('.modal-body input').val(genre);
	});
});
*/