@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotLg">Actualización del banco {!!$banco->ban_nombre!!}</h2>
@include('alerts.request')
<div class="form-group">
	{!!Form::model($banco,['route'=>['banco.update',$banco->id],'method'=>'put'])!!}
		@include('banco.forms.bnc')
		<input type="hidden" name="id" value="<?php echo $banco->id; ?>">
		<input type="hidden" name="old_name" value="<?php echo $banco->ban_nombre; ?>">
		<div class="col-md-3 col-xs-12">
			{!!Form::submit('Actualizar',['class'=>'btn btn-success btn-block'])!!}
		</div>		
	{!!Form::close()!!}	
</div>
@stop