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
