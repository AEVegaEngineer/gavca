@extends('layouts.admin')

@section('content')
<h3 class="form-signin-heading">Actualización del parámetro {!!$parametro->par_nombre!!}</h3>
@include('alerts.request')
<div class="row">
	<div class="form-group">
		{!!Form::model($parametro,['route'=>['parametro.update',$parametro->id],'method'=>'put'])!!}
		@include('parametro.forms.prm')
		<div class="col-md-3 col-xs-12">
		{!!Form::submit('Actualizar',['class'=>'btn btn-success btn-block'])!!}
		</div>
		{!!Form::close()!!}	
	</div>
</div>
@stop
@section('scripts')
	{!!Html::script('js/editNumber.js?1')!!}
@endsection