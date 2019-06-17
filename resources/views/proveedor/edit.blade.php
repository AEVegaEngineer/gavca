@extends('layouts.admin')

@section('content')
<h3 class="form-signin-heading">Actualización del proveedor {!!$proveedor->par_nombre!!}</h3>
@include('alerts.request')
<div class="row">
	<div class="form-group">
		{!!Form::model($proveedor,['route'=>['proveedor.update',$proveedor->id],'method'=>'put'])!!}
		@include('proveedor.forms.provupd')
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