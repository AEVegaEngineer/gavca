@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
		<h2 class="form-signin-heading" style="display: inline-block; margin-right: 50px;">Historial de producciones</h2>		
		<div class="col-md-12">
			<div class="col-md-6 col-sm-12">
				{!!Form::text('fecha',null,['class'=>'form-control datepicker','placeholder'=>'Click aquí para seleccionar el mes del reporte','required'=>'required', 'readonly'=>'readonly'])!!}
			</div>
			<div class="col-md-6 col-sm-12">
				{!!link_to_route('produccion.reporteCardex', $title = 'Generar reporte', array($factura_o_mensual = "mensual",$atributo="2019-02"), $attributes = ['class'=>'btn btn-primary','id'=>'btn_reporte'])!!}
			</div>
		</div>
		<table class="table">
			<thead>
				<th>Receta usada</th>
				<th>Fecha de producción</th>
				<th>Cantidad de producción</th>
				<th>Etapa de la producción</th>
				<th>Costo Unitario</th>
				<th>Operaciones</th>
			</thead>
			<tbody>
			@foreach($producciones as $produccion)
			<?php 
				if($produccion->pro_costo!=null){
			?>
			
			<tr>
				<td>{{$produccion->rec_nombre}}</td>				
				<td>{{date_format(date_create($produccion->pro_fecha),"d/m/Y")}}</td>
				<td>{{$produccion->pro_produccion}}</td>
				<td>
					<?php 
					if($produccion->pro_etapa == 'PA') 
						echo "Semiprocesado";
					else if($produccion->pro_etapa == 'PB') 
						echo "Terminado";
					else if($produccion->pro_etapa == 'PC') 
						echo "Presentación";
					?>
				</td>
				<td>{{number_format ( $produccion->pro_costo , $decimals = 2 , "," , "." )}}</td>
				<td>					
					<div class="btn-group">
						<?php 
						if($produccion->pro_costo!=null){
						?>
						<a href="/verProduccion/{{$produccion->id}}" class="btn btn-primary btn-sm">Ver Producción</a>	
						<?php } ?>
					</div>
				</td>
			</tr>
			<?php } ?>
			@endforeach
			</tbody>
		</table>			
	</div>
	{!!$producciones->render()!!}
	{!!Html::script('js/jquery.min.js')!!}
		<!-- Datepicker Files -->    
	    {!!Html::script('js/bootstrap-datepicker.js')!!}
	    <!-- Languaje -->
	    {!!Html::script('locales/bootstrap-datepicker.es.min.js')!!}
		<script type="text/javascript">	
			// establece el seleccionador de fechas para escala a años y meses
			$('.datepicker').datepicker({
				format: "yyyy-mm",
			    language: "es",
			    autoclose: true,
			    startView: 1,
			    minViewMode: 1,
			    maxViewMode: 2,
			});

			$('#btn_reporte').attr({disabled: true});
			var link = "http://localhost/Producciones/reporte/";
			$('input[name=fecha]').change(function(e){
				
				$('#btn_reporte').attr({
					href: link+$(this).val(),
					disabled: false
				});
				
			});

			
		</script>
@endsection
