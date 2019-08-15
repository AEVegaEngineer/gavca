@extends('layouts.admin')

@section('content')
	@include('alerts.success')
	@include('alerts.errors')
	@include('alerts.request')
		<h2 class="form-signin-heading" style="display: inline-block; margin-right: 50px;">Lista de Compras</h2> 
		
		<div class="col-md-12">
			<div class="col-md-6 col-sm-12">
				{!!Form::text('fecha',null,['class'=>'form-control datepicker','placeholder'=>'Click aquí para seleccionar el mes del reporte','required'=>'required', 'readonly'=>'readonly'])!!}
			</div>
			<div class="col-md-6 col-sm-12">
				{!!link_to_route('compra.reporte', $title = 'Generar reporte', array($parameters = "mensual",$fecha="2019-02"), $attributes = ['class'=>'btn btn-primary','id'=>'btn_reporte'])!!}
			</div>
		</div>
				
		<table class="table">
			<thead>
				<th>Fecha de Compra</th>
				<th>Documento de factura</th>	
				<th>Código del Proveedor</th>
				<th>Tipo</th>
				<th>Entidad</th>				
				<th>Monto</th>
				<th>Operaciones</th>
			</thead>
			@foreach($compras as $compra)
			<tbody>
				<td>{{date("d/m/Y", strtotime($compra->comp_fecha))}}</td>
				<td>{{$compra->comp_doc}}</td>
				<td>{{$compra->comp_proveedor}}</td>
				<td>{{$compra->comp_cred_cont}}</td>
				<?php				
				if($compra->comp_entidad == ""){
					$entidad = "Cuenta por pagar";
					if($compra->comp_cred_cont == "contado")
						$entidad = "Caja Chica";
				}
				?>
				<td>{{$entidad}}</td>	

				<td align="right">{{ number_format ( $compra->comp_monto , $decimals = 2 , "," , "." ) }}</td>
				<td>					
					{!!Form::open(['route'=>['compra.destroy',$compra->id],'method'=>'DELETE'])!!}
						<div class="btn-group">
						{!!link_to_route('compra.show', $title = 'Ver Factura', $parameters = $compra->id, $attributes = ['class'=>'btn btn-primary btn-xs'])!!}					
						</div>
					{!!Form::close()!!}					
				</td>
			</tbody>
			@endforeach
		</table>
		{!!$compras->render()!!}
		<!-- Jquery -->
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
		var link_mensual = "http://localhost/compra/reporte/mensual/";
		$('input[name=fecha]').change(function(e){
			
			$('#btn_reporte').attr({
				href: link_mensual+$(this).val(),
				disabled: false
			});
			
		});

		
	</script>	
@endsection