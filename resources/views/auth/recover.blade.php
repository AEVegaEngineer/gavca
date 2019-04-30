@extends('layouts.front')

@section('content')

<div class="content">
	<div class="col-md-12" style="background-color:#000; color:#FFF; text-align:center;"><h3>Sistema Administrativo Gavca</h3></div>
	<div class="col-md-4 col-xs-12"></div>
	<div class="col-md-4 col-xs-12 margenBotSm">
		@include('alerts.errors')	
		@include('alerts.request')
		<h1 class="margenBotSm">Recuperación de Contraseña</h1>
		<p>Ingresa el correo electrónico asociado a tu cuenta de usuario. Se te enviará a éste un correo de confirmación para restaurar tu contraseña.</p>
		<div class="modal-body">
			{!!Form::open(['route'=>'log.recover','method'=>'POST'])!!}
				{!!Form::text('email',null,['class'=>'form-control input-lg margenBotSm','placeholder'=>'Ingresa tu correo electrónico'])!!}
				{!!Form::submit('Enviar',['class'=>'btn btn-primary margenBotSm'])!!}
				{!! csrf_field() !!}
			
			{!!Form::close()!!}							
		</div>
		<div class="modal-footer">
			<div class="login-help">
				{!!link_to('/',$tittle = 'Volver a formulario de Iniciar Sesión', $attributes = null, $secure = null)!!}
			</div>
		</div>
	</div>
	<div class="col-md-4 col-xs-12"></div>
</div>