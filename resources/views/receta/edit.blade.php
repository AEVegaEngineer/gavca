@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading" style="display: inline-block; margin-right: 50px;">Actualización de Proceso Productivo {!!$receta->name!!}</h2>
@include('alerts.request')
<div class="row">
	<div class="form-group">
		{!!Form::model($receta,['route'=>['receta.update',$receta->id],'method'=>'put'])!!}
		@include('receta.forms.recupd')
		<div class="col-md-3 col-xs-12">
		{!!Form::submit('Actualizar',['class'=>'btn btn-success btn-block'])!!}
		</div>
		{!!Form::close()!!}	
	</div>
</div>
@stop