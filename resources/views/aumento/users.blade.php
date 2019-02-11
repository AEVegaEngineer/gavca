<h2 class="form-signin-heading">Base de datos de usuarios</h2>
<table class="table">
	<thead>
		<th>Nombre</th>
		<th>Correo electronico</th>
		<th>Operaciones</th>
	</thead>
	@foreach($recetas as $receta)
	<tbody>
		<td>{{$receta->name}}</td>
		<td>{{$receta->email}}</td>
		<td>
			{!!link_to_route('usuario.edit', $title = 'Editar', $parameters = $receta->id, $attributes = ['class'=>'btn btn-primary'])!!}
		</td>
	</tbody>
	@endforeach
</table>
{!!$recetas->render()!!}		