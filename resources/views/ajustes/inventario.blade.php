@extends('layouts.admin')
@section('content')
	@include('alerts.success')
	{!!Form::open(['route'=>'ajustes.setinventario','method'=>'POST'])!!}
		<?php 
		$front_target;
		if($target == 'materiaprima')
			$front_target = 'materia prima';
		else if($target == 'producciona')
			$front_target = 'Producción A';
		else if($target == 'produccionb')
			$front_target = 'Producción B';
		else if($target == 'produccionc')
			$front_target = 'Producción C';
		?>
		<h2 class="form-signin-heading margenBotLg">Ajustar inventario de {{$front_target}} para {{$id}}</h2>
		<div class="row margenBotMd">
			<div class="col-xs-12 col-md-12">
				<p>Ingresa un concepto.</p>
				<input class="form-control" type="text" name="concepto" placeholder="Ingrese aquí el concepto" required="required">
			</div>
		</div>
		<div class="row margenBotMd">
			<div class="col-xs-12 col-md-12">
				<p>La existencia actual para este inventario es de {{$existencia}}, ingrese en los campos inferiores, ya sea una entrada o una salida, puede dejar cualquier campo vacío.</p>
			</div>
		</div>
		<div class="row margenBotMd">
			<div class="col-xs-6 col-md-4">
				<p>Entra</p>
				<input class="form-control" type="text" name="entra" placeholder="Ingrese la entrada">
			</div>	
			<div class="col-xs-6 col-md-4">
				<p>Sale</p>
				<input class="form-control" type="text" name="sale" placeholder="Ingrese la salida">
			</div>				    
		</div>		
		<input type="hidden" name="id" value="{{$id}}">
		<input type="hidden" name="target" value="{{$target}}">
		<div class="row">
			<div class="col-md-12">
				{!!Form::submit('Actualizar Inventario',['class'=>'btn btn-lg btn-success'])!!}
			</div>
		</div>
	{!!Form::close()!!}		
	<!-- Jquery -->
    {!!Html::script('js/jquery.min.js')!!}

@endsection