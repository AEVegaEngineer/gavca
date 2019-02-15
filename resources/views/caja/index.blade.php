@extends('layouts.admin')

@section('content')	
	@include('alerts.errors')
	<!-- Datepicker Files -->
    {!!Html::style('css/bootstrap-datepicker3.css')!!}
    {!!Html::style('css/bootstrap-datepicker3.css')!!}
    
	@include('alerts.success')
	{!!Form::open(['route'=>'caja.abrir','method'=>'POST'])!!}
	<div class="row">
		<div class="col-md-12 margenBotLg">
			<h3>Selecciona una fecha para abrir el día de operación. Debes seleccionar una fecha igual o anterior a la actual ({{$hoy}}), sólo puedes seleccionar una fecha si el día anterior a la misma tiene sus cajas cerradas.</h3>
			<?php if($caja_actual != null){ ?>
			<h3>Actualmente hay un día abierto de fecha {{$caja_actual}}</h3>
			<?php }else if($ultima_caja != null){?>
			<h3>El último día que fue cerrado tiene fecha {{$ultima_caja}}</h3>
			<?php } ?>
		</div>		
	</div>
	<div class="row margenBotSm">    	
		<div class="col-xs-12 col-md-5">	
			{!!Form::text('caja_fecha',$caja_actual,['class'=>'form-control datepicker','placeholder'=>'Click aquí seleccionar una fecha','required'=>'required'])!!}	
			<?php if(isset($entidad)){ ?>
			<input type="hidden" name="entidad" value="{{$entidad}}"> 
			<?php } ?>
		</div>		
	</div>
	{!!Form::submit('Abrir',['class'=>'btn btn-lg btn-success'])!!}
	{!!Form::close()!!}
		

	<!-- Jquery -->
    {!!Html::script('js/jquery.min.js')!!}
	<!-- Datepicker Files -->    
    {!!Html::script('js/bootstrap-datepicker.js')!!}
    <!-- Languaje -->
    {!!Html::script('locales/bootstrap-datepicker.es.min.js')!!}

<script type="text/javascript">	

	$('.datepicker').datepicker({
	    format: "yyyy-mm-dd",
	    language: "es",
	    autoclose: true
	});
</script>
		
	
@endsection