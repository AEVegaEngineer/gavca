@extends('layouts.admin')

@section('content')
<h3 class="form-signin-heading">Actualización del cliente {!!$cliente->par_nombre!!}</h3>
@include('alerts.request')
<div class="row">
	<div class="form-group">
		{!!Form::model($cliente,['route'=>['cliente.update',$cliente->id],'method'=>'put'])!!}
		@include('cliente.forms.cliupd')
		<input type="hidden" name="id" value="<?php echo $cliente->id; ?>">
		<div class="col-md-3 col-xs-12">
		{!!Form::submit('Actualizar',['class'=>'btn btn-success btn-block'])!!}
		</div>
		{!!Form::close()!!}	
	</div>
</div>
@stop
@section('scripts')
	{!!Html::script('js/editNumber.js')!!}
@endsection