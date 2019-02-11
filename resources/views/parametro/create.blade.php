@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotSm">Por favor, ingrese un nuevo parámetro</h2>
@include('alerts.request')
{!!Form::open(['route'=>'parametro.store','method'=>'POST'])!!}
@include('parametro.forms.prm')
{!!Form::submit('Registrar',['class'=>'btn btn-lg btn-success'])!!}
{!!Form::close()!!}
	<!--
	<form>
		<div class="form-group">
			<label for="">Nombre</label>
			<input type="text" class="form-control"></input>			
		</div>
		<div class="form-group">
			<label for="">Correo</label>
			<input type="email" class="form-control"></input>			
		</div>
		<div class="form-group">
			<label for="">Contraseña</label>
			<input type="password" class="form-control"></input>			
		</div>
		<button class="btn btn-primary">Registrar</button>
	</form>
	-->
@stop