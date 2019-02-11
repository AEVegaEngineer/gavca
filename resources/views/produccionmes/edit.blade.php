@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotLg">Actualización de la cantidad de producción</h2>
@include('alerts.request')
<div class="row">
	<div class="form-group">
		{!!Form::model($produccionmes,['route'=>['produccionmes.update',$produccionmes->id],'method'=>'put'])!!}
		@include('produccionmes.forms.prod')
		<div class="col-md-3 col-xs-12">
		{!!Form::submit('Actualizar',['class'=>'btn btn-success btn-block'])!!}
		</div>
		{!!Form::close()!!}	
	</div>
</div>
@stop