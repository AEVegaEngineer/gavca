@extends('layouts.admin')

@section('content')	
	@include('alerts.errors')
	<!-- Datepicker Files -->
    {!!Html::style('css/bootstrap-datepicker3.css')!!}
    {!!Html::style('css/bootstrap-datepicker3.css')!!}
    
	@include('alerts.success')
	{!!Form::open(['route'=>'ajustes.iniciar','method'=>'POST'])!!}
	<div class="row">
		<div class="col-md-12 margenBotLg">
			<h3>Selecciona una fecha para iniciar operaciones y abrir caja.</h3>
		</div>		
	</div>
	<div class="row margenBotSm">    	
		<div class="col-xs-12 col-md-5">	
			{!!Form::text('fecha',null,['class'=>'form-control datepicker','placeholder'=>'Click aquí seleccionar una fecha','required'=>'required'])!!}			
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