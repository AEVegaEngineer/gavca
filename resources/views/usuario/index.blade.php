@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
		<h2 class="form-signin-heading">Lista de usuarios</h2>
		<table class="table">
			<thead>
				<th>Nombre</th>
				<th>Correo electronico</th>
				<th>Privilegio</th>
				<th>Operaciones</th>
			</thead>
			@foreach($users as $user)
			<tbody>
				
				<td>
					<?php echo ($user->name == Auth::user()->name) ? "<b>" : "" ?>
					{{$user->name}}
					<?php echo ($user->name == Auth::user()->name) ? "</b>" : "" ?>
				</td>
				<td>{{$user->email}}</td>
				<td>{{$user->privilegio}}</td>
				
				<td>
					<?php if(Auth::user()->privilegio == 'admin' && $user->name != Auth::user()->name){ ?>
					<div class="btn-group">						
						<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal{{$user->id}}" data-id="{{$user->id}}">
						Eliminar
						</button>
						<!-- Modal -->
						{!!Form::open(['route'=>['usuario.destroy',$user->id],'method'=>'DELETE', 'id'=>'deletemodal'])!!}
						<div id="myModal{{$user->id}}" class="modal fade" role="dialog">
							<form id="formulario" action="usuario/destroy/"></form>
						  	<div class="modal-dialog">
						    	<!-- Modal content-->
						    	<div class="modal-content">
						      		<div class="modal-header">
						        		<button type="button" class="close" data-dismiss="modal">&times;</button>
						        		<h4 class="modal-title">Eliminar usuario {{$user->name}}</h4>
						      		</div>
						      		<div class="modal-body">
						      			<div class="row margenBotSm">
						      				<div class="col-md-5">
							      				<p>¿Está seguro que desea eliminar este usuario?</p>
							      			</div>
							      		</div>	        	
						      		</div>
						      		<div class="modal-footer">
						      			<div class="btn-group">
						      				{!!Form::submit('Eliminar',['class'=>'btn btn-danger btn-lg'])!!}
						        			<button type="button" class="btn btn-default btn-lg" data-dismiss="modal">Cerrar</button>
						      			</div>	      	
						      		</div>
						      	</div>
						  	</div>
						</div>	
						{!!Form::close()!!}
					</div>		
					<?php } ?>
				</td>
			</tbody>
			@endforeach
		</table>		
			
	</div>
	{!!$users->render()!!}

	<script src="{{ asset('/js/jquery.min.js') }}" type="text/javascript"></script>	
@endsection
