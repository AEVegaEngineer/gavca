@extends('layouts.admin')
<!-- Datepicker Files -->
    {!!Html::style('css/bootstrap-datepicker3.css')!!}
@section('content')
	@include('alerts.success')
	{!!Form::open(['route'=>'cuentaxpagar.store','method'=>'POST'])!!}
		<h2 class="form-signin-heading margenBotLg">Abonar a cuentas por pagar del proveedor código: {{$prov}}</h2>
		<div class="row margenBotMd">
			<div class="col-xs-12 col-md-12">
				<p>Ingresa un concepto.</p>
				<input class="form-control" type="text" required="" name="concepto" placeholder="Ingrese aquí el concepto">
			</div>
		</div>
		<div class="row margenBotMd">						
		    <div class="col-xs-12 col-md-4">
				<p>¿Se pagó contra Banco o Caja Chica?: </p>
				{!!Form::select('banco_o_caja', ['caja' => 'Caja Chica', 'banco' => 'Banco'], null, ['class'=>'form-control'])!!}
			</div>
		    <div id="banco">		    	
				<div class="col-xs-12 col-md-4">
					<p>¿Contra cual banco se pagó?: </p>
					{!! Form::select('banco', $bancos, null, ['class' => 'form-control']) !!}
				</div>			     
		    </div>
		    <div class="col-xs-12 col-md-4">
				<p>Dinero disponible en esta entidad: </p>
				<b><p id="disponible"></p></b>
			</div>
		</div>
		<div class="row margenBotLg">
			
			<div class="col-xs-12 col-md-4">
				<p>Esta cuenta se reflejará en caja de día: </p>
				{!!Form::text('fecha',$fecha,['class'=>'form-control','placeholder'=>'Click aquí seleccionar una fecha','required'=>'required','readonly'=>'readonly'])!!}
			</div>
			<div class="col-xs-12 col-md-4">
				<p>Ingresa la cantidad que desees abonar o pagar por completo.</p>
				<input class="form-control" required="" type="text" value="{{$deuda}}" name="abono" placeholder="Ingrese aquí la cantidad que desea abonar" >
			</div>
			<div class="col-xs-12 col-md-4">
				<b><p id="error-msg"></p></b>
			</div>
		</div>
		<div class="row margenBotMd">
			<div class="col-md-12">
				<p>NOTA: Recuerda que la deuda remanente al proveedor es <b>{{ number_format ( $deuda , $decimals = 2 , "," , "." ) }}</b> y puedes pagar la deuda total o parcialmente, los pagos se harán de la deuda mas antigua a la mas actual.</p>
			</div>
		</div>
		<input type="hidden" name="prov" value="{{$prov}}">
		<div class="row">
			<div class="col-md-12">
				{!!Form::submit('Pagar deuda',['class'=>'btn btn-lg btn-success'])!!}
			</div>
		</div>
		<input type="hidden" name="_token" value="{{csrf_token()}}" id="token">
		<input type="hidden" id="disponible_hidden">
		<input type="hidden" id="deuda" value="{{$deuda}}">
	{!!Form::close()!!}		
	<!-- Jquery -->
    {!!Html::script('js/jquery.min.js')!!}
    <!-- Formulario dinamico -->
    {!!Html::script('js/ctasxpagar/dynamicForm.js?9')!!}

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