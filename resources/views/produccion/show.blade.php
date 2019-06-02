@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading">Cardex de producto {{$producciones[0]->rec_nombre}}</h2>
		<div class="col-md-12">
			<div class="col-md-6 col-sm-12">
				{!!Form::text('fecha',null,['class'=>'form-control datepicker','placeholder'=>'Click aquí para seleccionar el mes del reporte','required'=>'required', 'readonly'=>'readonly'])!!}
			</div>
			<div class="col-md-6 col-sm-12">
				{!!link_to_route('produccion.reporteCardex', $title = 'Generar reporte', array($factura_o_mensual = "mensual",$atributo="2019-02"), $attributes = ['class'=>'btn btn-primary','id'=>'btn_reporte'])!!}
			</div>
		</div>	
		<br>
		<h3>Existencia Actual: {{number_format ( $existencia , $decimals = 2 , "," , "." )}}</h3>
		<table class="table">
			<thead>
				<td>Fecha</td>
				<td>Concepto</td>
				<td align="right">Entra</td>
				<td align="right">Sale</td>
				<td align="right">Disponible</td>
				<td align="right">Costo Producción</td>
			</thead>
			<?php $totalEntra = 0; $totalSale = 0; ?>
			@foreach($producciones as $produccion)
			<?php
			$debe_haber = false;
			if($produccion->pro_concepto == "Producción de ".$producciones[0]->rec_nombre)
			{
				$debe_haber = true;
			}
			else if(isset($produccion->pro_costo))
			{
				$debe_haber = false;
			}
			?>
			<tr>
				<td>{{$produccion->pro_fecha}}</td>
				<td>{{$produccion->pro_concepto}}</td>
				<?php 
				
				echo ''.($debe_haber ? '<td align="right">'.number_format ( $produccion->pro_produccion , $decimals = 2 , "," , "." ).'</td><td></td>' : '<td></td><td align="right">'.number_format ( $produccion->pro_produccion , $decimals = 2 , "," , "." ).'</td>');
				?>
				<td align="right">{{number_format ( $produccion->pro_disponible , $decimals = 2 , "," , "." )}}</td>
				<td align="right">
					<?php if (isset($produccion->pro_costo)) echo number_format ( $produccion->pro_costo , $decimals = 2 , "," , "." );?>					
				</td>
			</tr>
			@endforeach				
			

		
		</table>		
		{!!$producciones->render()!!}
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
			var link = "http://localhost/cardexProduccion/reporte/";
			$('input[name=fecha]').change(function(e){
				
				$('#btn_reporte').attr({
					href: link+$(this).val()+"/{{$producciones[0]->pro_etapa}}/{{$producciones[0]->rec_nombre}}",
					disabled: false
				});
				
			});

			
		</script>	
	
@endsection