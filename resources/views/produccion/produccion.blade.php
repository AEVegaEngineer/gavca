@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
		<h2 class="form-signin-heading margenBotLg">Producción de {!!$rec_nombre!!} de fecha {!!$req_fecha!!}</h2>
		<div class="row">					
			<div class="col-md-6 col-xs-12">
				{!!link_to_route('produccion.edit', $title = 'Modificar producción de '.$rec_nombre, $parameters = $produccion->id, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}	
			</div>		
			<?php 
			$req = $produccion->pro_mano_obra;
			$prod = $produccion->pro_produccion;
			?>
			<div class="col-md-3 col-xs-12 form-inline">
				<label for="produccion">Producción: {{$prod}}    </label>	
				<?php 
					if($produccion->pro_lote != null){ 
						echo '<label>LOTE: ';
						$numlength = strlen((string)$produccion->pro_lote);
						for ($i=0; $i < 6-$numlength; $i++) { 
							echo '0';
						}
						echo $produccion->pro_lote;
						echo '</label>';
					}
				?>	
			</div>
		</div>
		<table class="table table-bordered">
			<thead>
				<th colspan = "3">INFORMACIÓN SEGÚN PARÁMETROS</th> 		
				<th colspan = "2">REQUERIMIENTOS</th> 
				<th colspan = "2">COSTOS</th>
				<th>SOBRE <br>EL TOTAL</th>
			</thead>
			<thead>
				<th>Materia prima e insumos</th>
				<th>Unidad</th>
				<th>Costo</th>
				<th>Total</th>
				<th>Unitario</th>
				<th>Total</th>
				<th>Unitario</th>
				<th></th>
			</thead>
			<?php
			$costosTotales = 0;
			$costosUnit=0;
			$costoTotalObra = 0;
			$costoUnitObra = 0;
			$costoTotalMat = 0;
			$costoUnitMat = 0;
			$i=0;
			?>

			@foreach($dependencias as $key => $dependencia)
			<?php if($recetas->rec_proc != 'PA'){ 
				$req_total = $dependencia->requerimiento;
				$req_unitario = $req_total/$prod;				
				//$req_total = $produccion*$dependencia->requerimiento;
				$costo = $costos[$key]->pro_costo;
				$costo_total = $costo*$req_total;
				//$req_unitario = $req_total/$produccion;
				$costo_unitario = $costo*$req_unitario;
			?>

			<tr>
				<td>{{$dependencia->dep_hijo}}</td>
				<td>{{$dependencia->rec_unidad}}</td>
				<td align="right">{{bcdiv($costo, '1', 2)}}</td>		
				<td>{{number_format($req_total,$decimals = 2 , "," , ".")}}</td>
				<td>{{number_format($req_unitario,$decimals = 4 , "," , ".")}}</td>
				<td align="right">{{number_format($costo_total,$decimals = 2 , "," , ".")}}</td>
				<td align="right" id="unit-{{$i}}">{{number_format($costo_unitario,$decimals = 2 , "," , ".")}}</td>
				<td id="over-{{$i}}"></td>
			</tr>
			<?php
				$costosTotales+=$costo_total;
				$costosUnit+=$costo_unitario;
				$i++;
				} 
			?>
			@endforeach
			<?php
			function round_a($number, $precision = 2)
			{
			    $fig = (int) str_pad('1', $precision, '0');
			    return (floor($number * $fig) / $fig);
			}
			?>
		@foreach($parametros as $parametro)			
			<?php
			
			$req_total = $parametro->req_total;
			$costo = $parametro->par_costo;
			$costo_total = $costo*$req_total;
			$req_unitario = round_a($req_total/$prod,5);

			$costo_unitario = $costo*$req_unitario;
			
			?>
			<tbody>
				<td>{{$parametro->par_nombre}}</td>
				<td>{{$parametro->par_unidad}}</td>			

				<td align="right">{{number_format($parametro->par_costo,$decimals = 2 , "," , ".")}}</td>
				<td>{{number_format($parametro->req_total,$decimals = 2 , "," , ".")}}</td>
				<td>{{number_format($req_unitario,$decimals = 2 , "," , ".")}}</td>
				<td align="right">{{number_format($costo_total,$decimals = 2 , "," , ".")}}</td>
				<td align="right" id="unit-{{$i}}">{{number_format($costo_unitario,$decimals = 2 , "," , ".")}}</td>
				<td id="over-{{$i}}"></td>
				
			</tbody>
		<?php 
			$costosTotales+=$parametro->par_costo*$parametro->req_total;
			$costosUnit+=$parametro->par_costo*($parametro->req_total/$prod);	
			$i++;
		?>
		@endforeach
		@foreach($salarios as $salario)
			<?php 
			$sal_cargado = $salario->sal_mensual; 
			$u_tributaria = $salario->unidad_tributaria;
			$salario_integral = $salario->salario_integral;
			?>
		@endforeach
		@foreach($aumentos as $aumento)
			<?php 
			$aumento_escalar = ($aumento->aum_aumento * 0.01) + 1;
			$sal_cargado *= $aumento_escalar;
			?>
		@endforeach		
			<?php
			$mano_de_obra = $sal_cargado;
			

			//CALCULO DE TOTALES
			$cos_tot_obra = $req*$salario_integral;
			$cos_unit_obra = $cos_tot_obra / $prod;
			
			$costoDirTotal = $costosTotales+$cos_tot_obra;
			$costoDirUnit = $costosUnit+$cos_unit_obra;

			$total_cf = ($miscelaneo->std_x_frasco/3)*$prod;
			$unit_cf = $total_cf/$prod;
			$total_unit = $costoDirUnit+$unit_cf;


			?>
			<tr class="success">
				<td colspan = "5" align="right">TOTAL MATERIA PRIMA E INSUMOS</td>
				<td align="right">{{number_format($costosTotales,$decimals = 2 , "," , ".")}}</td> 
				<td align="right" id="totalMat">{{number_format($costosUnit,$decimals = 2 , "," , ".")}}</td> 
				<td id="matOver">{{number_format(($costosUnit/$total_unit)*100,$decimals = 2 , "," , ".")}}%</td>
			</tr>			
			<tr>
				<td>MANO DE OBRA</td>
				<td>JORNAL</td>

				<td align="right">{{number_format($salario_integral,$decimals = 2 , "," , ".")}}</td>
				<td>{{number_format($req,$decimals = 2 , "," , ".")}}</td>
				<td>{{number_format($req/$prod,$decimals = 4 , "," , ".")}}</td>
				<td align="right">{{number_format($cos_tot_obra,$decimals = 2 , "," , ".")}}</td>
				<td align="right">{{number_format($cos_unit_obra,$decimals = 2 , "," , ".")}}</td>
				<td>{{number_format(($cos_unit_obra/$total_unit)*100,$decimals = 2 , "," , ".")}}%</td>
			</tr>
			<tr class="success">

				<td colspan = "5" align="right">TOTAL COSTOS DIRECTOS</td>
				<td align="right">{{number_format($costoDirTotal,$decimals = 2 , "," , ".")}}</td> 
				<td align="right">{{number_format($costoDirUnit,$decimals = 2 , "," , ".")}}</td> 
				<td>{{number_format(($costoDirUnit/$total_unit)*100,$decimals = 2 , "," , ".")}}%</td>
			</tr>
			<!--CALCULOS PARA PROCESO B-->
			<tr>
				<td>ESTANDAR DE COSTOS FIJOS POR UNIDAD PRODUCIDA</td>
				<td>STD UNITARIO</td>				
				<td align="right">{{number_format(($costoDirUnit/$total_unit)*100,$decimals = 2 , "," , ".")}}</td>
				<td align="right">{{$prod}}</td>
				<td align="right">{{number_format(1,2)}}</td>
				<td align="right" id="total_cf">{{number_format($total_cf,$decimals = 2 , "," , ".")}}</td>
				<td align="right" id="unit_cf">{{number_format($unit_cf,$decimals = 2 , "," , ".")}}</td>
				<td align="left" id="over_cf">{{number_format(($unit_cf/$total_unit)*100,$decimals = 2 , "," , ".")}}%</td>
			</tr>
			<tr class="success">
				<td colspan = "5" align="right">TOTAL COSTOS DIRECTOS MÁS ESTÁNDAR DE COSTO FIJO</td>
				<td align="right">{{number_format($costoDirTotal+$total_cf,$decimals = 2 , "," , ".")}}</td> 
				<td align="right" id="total">{{number_format($total_unit,$decimals = 2 , "," , ".")}}</td> 
				<td id="totalOver">100%</td>
			</tr>
			<input type="hidden" name="rec_nombre" id="rec_nombre" value="{{$rec_nombre}}">
			<input type="hidden" name="pro_fecha" id="pro_fecha" value="{{$req_fecha}}">
			<input type="hidden" name="_token" value="{{csrf_token()}}" id="token">
		</table>
		
	</div>
	<!-- SEGUN LA PRODUCCIÓN QUE SEA SE EJECUTA UNO U OTRO SCRIPT PARA CALCULAR PORCENTAJES Y TOTALES -->
	{!!Html::script('js/jquery.min.js')!!}
	{!!Html::script('js/produccion/PB.js')!!}
	

@endsection