@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading">Cardex de Materia Prima {{$cardexs[0]->par_nombre}}</h2>
		<div class="col-md-12">
			<div class="col-md-6 col-sm-12">
				{!!Form::text('fecha',null,['class'=>'form-control datepicker','placeholder'=>'Click aquí para seleccionar el mes del reporte','required'=>'required', 'readonly'=>'readonly'])!!}
			</div>
			<div class="col-md-6 col-sm-12">
				{!!link_to_route('cardexmp.reporte', $title = 'Generar reporte', array($fecha = "mensual",$atributo="2019-02",$mp_codigo = $cardexs[0]->mp_codigo), $attributes = ['class'=>'btn btn-primary','id'=>'btn_reporte'])!!}
			</div>
		</div>
		<br>
		<h3>Existencia actual: {{$existencia}} {{$cardexs[0]->par_unidad}}</h3>
		
		<table class="table">
			<thead>
				<td>Fecha</td>
				<td>Concepto</td>				
				<td>Entra</td>
				<td>Sale</td>
				<td>Disponible</td>	
				<td align="right">Costo de Compra</td>			
			</thead>
			<?php $debe=0;$haber=0;$disponible=0; ?>

			@foreach($cardexs as $cardex)
			<?php 
				$cantidad = $cardex->car_valor_actual - $cardex->car_valor_anterior;	  
				$debe_haber = (isset($cardex->comp_fecha)) ? true : false;
				$costo = $cardexs[0]->car_costo; 

			?>
			<tr>
				<td>
					<?php 
					$fecha_compra=date_create($cardex->comp_fecha);
					echo $fecha = (isset($cardex->comp_fecha)) ? date_format($fecha_compra,"Y-m-d") : $cardex->car_fecha;
					?>					
				</td>
				<?php 
				echo ''.($debe_haber ? '<td>Compra de factura: '.$cardex->comp_doc.'</td>' : '<td>'.$cardex->car_concepto.'</td>');
				?>
				
				<?php 
				$findme = 'Ajuste -';
				$pos = strpos($cardex->car_concepto, $findme);
				if($pos === true){ 
					if($cardex->car_valor_anterior < $cardex->car_valor_actual)
					{
						echo '<td>'.$cantidad.'</td><td></td>';
						$debe+=$cantidad;
					}
					else
					{
						echo '<td></td><td>'.$cantidad*(-1).'</td>';
						$haber+=$cantidad;
					}
				}
				else
				{
					echo ''.($debe_haber ? '<td>'.$cantidad.'</td><td></td>' : '<td></td><td>'.$cantidad*(-1).'</td>');
				}
				?>	
				<td>{{(int)$cardex->car_valor_actual}}</td>
				<td align="right">
					<?php echo ''.($debe_haber ? number_format ( $cardex->car_costo , $decimals = 2 , "," , "." ) : ''); ?>					
				</td>
			</tr>
			
			@endforeach	
			
		</table>
		
		{!!$cardexs->render()!!}
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
		var link_mensual = "http://localhost/cardex/reporte/";
		$('input[name=fecha]').change(function(e){
			
			$('#btn_reporte').attr({
				href: link_mensual+$(this).val()+"/{{$cardexs[0]->mp_codigo}}",
				disabled: false
			});
			
		});	

	</script>	
@endsection