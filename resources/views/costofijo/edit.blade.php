@extends('layouts.admin')

@section('content')
<h3 class="form-signin-heading margenBotMd">Actualización de costo fijo</h3>
@include('alerts.request')
<div class="row">
	<div class="form-group">
		{!!Form::model($costofijo,['route'=>['costofijo.update',$costofijo->id],'method'=>'put'])!!}
		@include('costofijo.forms.cf')
		<div class="col-md-3 col-xs-12">
		{!!Form::submit('Actualizar',['class'=>'btn btn-success btn-block'])!!}
		</div>
		{!!Form::close()!!}	
	</div>
</div>
@stop