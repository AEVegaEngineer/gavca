@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
		<h2 class="form-signin-heading">Base de datos de usuarios</h2>
		<table class="table">
			<thead>
				<th>Nombre</th>
				<th>Correo electronico</th>
				<th>Privilegio</th>
				<th>Operaciones</th>
			</thead>
			@foreach($users as $user)
			<tbody>
				<td>{{$user->name}}</td>
				<td>{{$user->email}}</td>
				<td>{{$user->privilegio}}</td>
				<td>
					<?php if(Auth::user()->privilegio == 'admin'){ ?>
					<div class="btn-group">						
						<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal" data-id="{{$user->id}}">Eliminar</button>
					</div>		
					<?php } ?>
				</td>
			</tbody>
			@endforeach
		</table>		
			
	</div>
	{!!$users->render()!!}
	<!-- Modal -->
	{!!Form::open(['route'=>['usuario.destroy',$user->id],'method'=>'DELETE'])!!}
	<div id="myModal" class="modal fade" role="dialog">
		<form id="formulario" action="usuario/destroy/"></form>
	  	<div class="modal-dialog">
	    	<!-- Modal content-->
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal">&times;</button>
	        		<h4 class="modal-title">Eliminar usuario</h4>
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
	<script src="{{ asset('/js/jquery.min.js') }}" type="text/javascript"></script>	
@endsection
