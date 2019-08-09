@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
		<h2 class="form-signin-heading" style="display: inline-block; margin-right: 50px;">Lista de Bancos</h2>
		<table class="table">
			<thead>
				<th>Nombre</th>
				<th>Operaciones</th>
			</thead>
		@foreach($bancos as $banco)
			<tbody>
				<td>{{$banco->ban_nombre}}</td>
				<td>
					{!!Form::open(['route'=>['banco.destroy',$banco->id],'method'=>'DELETE'])!!}
						<div class="btn-group">
							{!!link_to_route('banco.edit', $title = 'Editar', $parameters = $banco->id, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
							{!!Form::submit('Eliminar',['class'=>'btn btn-danger btn-sm'])!!}
						</div>
					{!!Form::close()!!}					
				</td>
			</tbody>
			@endforeach
		</table>

		
			
	</div>
	{!!$bancos->render()!!}
@endsection
