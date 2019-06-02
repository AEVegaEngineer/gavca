@extends('layouts.admin')
@section('content')
	@include('alerts.success')
	@include('alerts.request')
	@include('alerts.errors')
	{!!Form::open(['route'=>'caja.maketransfer','method'=>'POST'])!!}
	<div class="row margenBotLg">
		<div class="col-md-12">
			
			<h3>Por favor, seleccione a donde quiere hacer la transferencia, ingrese un concepto y un monto.</h3>
		</div>
	</div>
	<div class="row margenBotLg">
		<div class="col-md-12">			
			<div class="col-md-4 col-xs-12">		    
				{!!Form::select('destino', $bancos, null, ['class'=>'form-control'])!!}
			</div>	
			<div class="col-md-4 col-xs-12">		    
				{!!Form::text('concepto', null, ['class'=>'form-control','placeholder' => 'Ingrese el concepto aquí'])!!}
			</div>
			<div class="col-md-4 col-xs-12">		    
				{!!Form::text('saldo', null, ['class'=>'form-control','placeholder' => 'Ingrese el monto aquí'])!!}
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="col-md-5 col-xs-12">		
			{!!Form::submit('Transferir',['class'=>'btn btn-lg btn-success'])!!}
			</div>				 
		</div>
	</div>
	<input type="hidden" name="entidad" value="{{$entidad}}">
	<input type="hidden" name="fecha" value="{{$fecha}}">
	{!!Form::close()!!}		
	
@endsection