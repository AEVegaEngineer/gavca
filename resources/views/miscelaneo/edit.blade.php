@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading">Actualización de miscelaneos</h2>
@include('alerts.request')
<div class="row">
	<div class="form-group">
		{!!Form::model($miscelaneo,['route'=>['miscelaneo.update',$miscelaneo->id],'method'=>'put'])!!}
		@include('miscelaneo.forms.misc')
		<div class="col-md-3 col-xs-12">
		{!!Form::submit('Actualizar',['class'=>'btn btn-success btn-block'])!!}
		</div>
		{!!Form::close()!!}	
	</div>
</div>
@stop