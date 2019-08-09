@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading" style="display: inline-block; margin-right: 50px;">Actualización del usuario {!!$user->name!!}</h2>
@include('alerts.request')
<div class="row">
	<div class="form-group">
		{!!Form::model($user,['route'=>['usuario.update',$user->id],'method'=>'put'])!!}
		@include('usuario.forms.usr')
		<input type="hidden" name="id" value="<?php echo $user->id; ?>">
		<div class="col-md-3 col-xs-12">
		{!!Form::submit('Actualizar',['class'=>'btn btn-success btn-block'])!!}
		</div>
		{!!Form::close()!!}	
	</div>
</div>
@stop