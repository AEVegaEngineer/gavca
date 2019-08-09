<h2 class="form-signin-heading" style="display: inline-block; margin-right: 50px;">Base de datos de usuarios</h2>
<table class="table">
	<thead>
		<th>Nombre</th>
		<th>Correo electronico</th>
		<th>Operaciones</th>
	</thead>
	@foreach($users as $user)
	<tbody>
		<td>{{$user->name}}</td>
		<td>{{$user->email}}</td>
		<td>
			{!!link_to_route('usuario.edit', $title = 'Editar', $parameters = $user->id, $attributes = ['class'=>'btn btn-primary'])!!}
		</td>
	</tbody>
	@endforeach
</table>
{!!$users->render()!!}		