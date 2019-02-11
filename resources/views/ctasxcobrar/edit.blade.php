@extends('layouts.admin')
<!-- Datepicker Files -->
    {!!Html::style('css/bootstrap-datepicker3.css')!!}
@section('content')
	@include('alerts.success')
	{!!Form::open(['route'=>'cuentaxcobrar.store','method'=>'POST'])!!}
		<h2 class="form-signin-heading margenBotLg">Cobrar deudas pendientes de cliente código: {{$cliente}}</h2>
		<div class="row margenBotMd">
			<div class="col-xs-12 col-md-12">
				<p>Ingresa un concepto.</p>
				<input class="form-control" type="text" name="concepto" placeholder="Ingrese aquí el concepto">
			</div>
		</div>
		<div class="row margenBotMd">
			<div class="col-xs-12 col-md-4">
				<p>Ingresa la cantidad que desees cobrar.</p>
				<input class="form-control" type="text" name="abono" placeholder="Ingrese aquí la cantidad que desea cobrar">
			</div>
		    <div class="col-xs-12 col-md-4">
				<p>¿Se cobró en Banco o Caja Chica?: </p>
				{!!Form::select('banco_o_caja', ['caja' => 'Caja Chica', 'banco' => 'Banco'], null, ['class'=>'form-control'])!!}
			</div>
		    <div id="banco">		    	
				<div class="col-xs-12 col-md-4">
					<p>¿Contra cual banco se cobró?: </p>
					{!! Form::select('banco', $bancos, null, ['class' => 'form-control']) !!}
				</div>			     
		    </div>
		</div>
		<div class="row margenBotLg">
			<div class="col-xs-12 col-md-4">
				<p>Se reflejará en caja el día: </p>
				{!!Form::text('fecha',$fecha,['class'=>'form-control','placeholder'=>'Click aquí seleccionar una fecha','required'=>'required','readonly'=>'readonly'])!!}
			</div>
		</div>
		<div class="row margenBotMd">
			<div class="col-md-12">
				<p>NOTA: Recuerda que la deuda remanente del cliente es <b>{{ number_format ( $deuda , $decimals = 2 , "," , "." ) }}</b> y puedes cobrar la deuda total o parcialmente, los cobros se harán de la deuda mas antigua a la mas actual.</p>
			</div>
		</div>
		<input type="hidden" name="cliente" value="{{$cliente}}">
		<div class="row">
			<div class="col-md-12">
				{!!Form::submit('Pagar deuda',['class'=>'btn btn-lg btn-success'])!!}
			</div>
		</div>
	{!!Form::close()!!}		
	<!-- Jquery -->
    {!!Html::script('js/jquery.min.js')!!}
    <!-- Formulario dinamico -->
    {!!Html::script('js/ctasxpagar/dynamicForm.js')!!}

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