@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
		<h2 class="form-signin-heading">Lista de Ventas</h2>

		<div class="col-md-12">
			<div class="col-md-6 col-sm-12">
				{!!Form::text('fecha',null,['class'=>'form-control datepicker','placeholder'=>'Click aquí para seleccionar el mes del reporte','required'=>'required', 'readonly'=>'readonly'])!!}
			</div>
			<div class="col-md-6 col-sm-12">
				{!!link_to_route('venta.reporte', $title = 'Generar reporte', array($factura_o_mensual = "mensual",$atributo="2019-02"), $attributes = ['class'=>'btn btn-primary','id'=>'btn_reporte'])!!}
			</div>
		</div>

		<table class="table">
			<thead>
				<th>Fecha de Venta</th>
				<th>Factura de Venta</th>
				<th>Código del Cliente</th>				
				<th>Condición</th>
				<th>Entidad</th>
				<th>Precio de Venta</th>
			</thead>
			<tbody>
			@foreach($totalesventas as $key => $totalventa)
				@foreach($elementos as $key => $elemento)
				<?php if($totalventa->ven_factura == $elemento->ven_factura){?>
				<tr>
					<?php $fecha = date_create($elemento->ven_fecha); ?>
					<td>{{date_format($fecha,"d/m/Y")}}</td>
					<td>{{$totalventa->ven_factura}}</td>
					<td>{{$elemento->cli_codigo}}</td>			
					<td>{{$elemento->ven_condicion}}</td>
					<td>{{$elemento->ven_entidad}}</td>
					<td align="right">{{ number_format ( $totalventa->ven_total , $decimals = 2 , "," , "." ) }}</td>
					<td>{!!link_to_route('venta.show', $title = 'Ver Factura', $parameters = $totalventa->id, $attributes = ['class'=>'btn btn-success btn-xs'])!!}</td>
				</tr>
				<?php } ?>
				@endforeach
			@endforeach
			</tbody>
		</table>
	</div>
	{!!$totalesventas->render()!!}
	{!!Html::script('js/jquery.min.js')!!}
		<!-- Datepicker Files -->    
    {!!Html::script('js/bootstrap-datepicker.js')!!}
    <!-- Languaje -->
    {!!Html::script('locales/bootstrap-datepicker.es.min.js')!!}
	<script type="text/javascript">	
		// establece el seleccionador de fechas para escala a años y meses
		$('.datepicker').datepicker({
			_resolveViewName: "months",
		    format: "yyyy-mm",
		    language: "es",
		    autoclose: true,
		    startView: 1,
		    minViewMode: 1
		});
		$('#btn_reporte').attr({disabled: true});
		var link_mensual = "http://localhost/venta/reporte/mensual/";
		$('input[name=fecha]').change(function(e){
			
			$('#btn_reporte').attr({
				href: link_mensual+$(this).val(),
				disabled: false
			});
			
		});

		
	</script>	
@endsection
