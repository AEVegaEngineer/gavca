@extends('layouts.admin')
@section('content')
	@include('alerts.success')
	@include('alerts.request')
	@include('alerts.errors')
	{!!Form::open(['route'=>'caja.generarSalida','method'=>'POST'])!!}
	<div class="row margenBotLg">
		<div class="col-md-12">
			
			<h3>Por favor, ingrese el monto que desea ingresar como salida y su concepto.</h3>
		</div>
	</div>
	<div class="row margenBotLg">
		<div class="col-md-12">			
			<div class="col-md-8 col-xs-12">		    
				{!!Form::text('concepto', null, ['class'=>'form-control','placeholder' => 'Ingrese el concepto aquí'])!!}
			</div>
			<div class="col-md-4 col-xs-12">		    
				{!!Form::text('monto', null, ['class'=>'form-control','placeholder' => 'Ingrese el monto aquí'])!!}
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="col-md-5 col-xs-12">		
			{!!Form::submit('Dar Salida',['class'=>'btn btn-lg btn-success'])!!}
			</div>				 
		</div>
	</div>
	<input type="hidden" name="entidad" value="{{$entidad}}">
	<input type="hidden" name="fecha" value="{{$fecha}}">
	{!!Form::close()!!}		
	
@endsection