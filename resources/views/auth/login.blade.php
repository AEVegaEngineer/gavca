@extends('layouts.front')

@section('content')

<div class="content">
	<div class="col-md-12" style="background-color:#000; color:#FFF; text-align:center;"><h3>Sistema Administrativo Gavca</h3></div>
	<div class="col-md-4 col-xs-12"></div>
	<div class="col-md-4 col-xs-12 margenBotSm">
		@include('alerts.errors')	
		@include('alerts.request')
		<h1 class="margenBotSm">Iniciar Sesión</h1>
		<div class="modal-body">
			{!!Form::open(['route'=>'log.store','method'=>'POST'])!!}
				{!!Form::text('email',null,['class'=>'form-control input-lg margenBotSm','placeholder'=>'Ingresa tu usuario o correo'])!!}
				{!!Form::password('password',['class'=>'form-control margenBotSm','placeholder'=>'Ingresa tu contraseña'])!!}
				{!!Form::submit('Entrar',['class'=>'btn btn-primary margenBotSm'])!!}
							
			{!!Form::close()!!}							
		</div>
		<div class="modal-footer">
			<div class="login-help">
				{!!link_to('password/email',$tittle = '¿Olvidó su contraseña?', $attributes = null, $secure = null)!!}
			</div>
		</div>
	</div>
	<div class="col-md-4 col-xs-12"></div>
</div>