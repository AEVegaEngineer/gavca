@extends('layouts.admin')

@section('content')
<h3 class="form-signin-heading">Actualización del parámetro {!!$insumo->par_nombre!!}</h3>
@include('alerts.request')
<div class="row">
	<div class="form-group">
		{!!Form::model($insumo,['route'=>['insumo.update',$insumo->id],'method'=>'put'])!!}
		@include('insumo.forms.ins')
		<div class="col-md-3 col-xs-12">
		{!!Form::submit('Actualizar',['class'=>'btn btn-success btn-block'])!!}
		</div>
		{!!Form::close()!!}	
	</div>
</div>
@stop
@section('scripts')
	{!!Html::script('js/insumo/editNumberInsumo.js?1')!!}
@endsection