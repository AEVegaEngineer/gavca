@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading" style="display: inline-block; margin-right: 50px;">Actualización de aumento</h2>
@include('alerts.request')
<div class="row">
	<div class="form-group">
		{!!Form::model($aumento,['route'=>['aumento.update',$aumento->id],'method'=>'put'])!!}
		@include('aumento.forms.rec')
		<div class="col-md-3 col-xs-12">
		{!!Form::submit('Actualizar',['class'=>'btn btn-success btn-block'])!!}
		</div>
		{!!Form::close()!!}	
	</div>
</div>
@stop