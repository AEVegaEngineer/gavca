@extends('layouts.admin')
@section('content')
	<div class="salarios">
		@include('alerts.success')
		<h2 class="form-signin-heading">Cálculo de salarios</h2>

		
		@foreach($salarios as $salario)
			<?php 
			$sal_cargado = $salario->sal_mensual; 
			$u_tributaria = $salario->unidad_tributaria;
			$cant_cesta_ticket = $salario->cant_cesta_ticket;
			?>
		@endforeach
		<?php 
		//echo 'sal_cargado: '.$sal_cargado.'<br';
		?>
		@foreach($aumentos as $aumento)
		<?php 
		$aumento_escalar = ($aumento->aum_aumento * 0.01) + 1;
		$sal_cargado *= $aumento_escalar;
		//echo 'aumento_escalar: '.$aumento_escalar.'<br';
		?> 
		@endforeach

		<div class="row">
			<div class="btn-group">	
				<div class="col-md-6 col-xs-12">
					{!!link_to_route('salario.edit', $title = 'Editar salario base, aumentos o unidad tributaria', $parameters = $salario->id, $attributes = ['class'=>'btn btn-primary btn-md'])!!}
				</div>
			</div>
		</div>

		<table class="table table-bordered">
			<thead>
				<th></th>
				<th>Anual</th>
				<th>Mensual</th>
				<th>Diario</th>
			</thead>
			<tbody>
				<tr>
					<td>SALARIO MENSUAL BASE</td>
					<td align="right">{{number_format ( $sal_anual = $sal_cargado*12 , $decimals = 2 , "," , "." )}}</td>
					<td align="right">{{number_format ( $sal_anual = $sal_cargado , $decimals = 2 , "," , "." )}}</td>
					<td align="right">{{number_format ( $sal_diario = $sal_cargado/30 , $decimals = 2 , "," , "." )}}</td>
				</tr>
				<tr>
					<td>BONO VACACIONAL (15 DIAS AL AÑO)</td>
					<td align="right">{{number_format ( $bono_vac_anual = $sal_diario*15 , $decimals = 2 , "," , "." )}}</td>
					<td align="right">{{number_format ( $bono_vac_mensual = $bono_vac_anual/12 , $decimals = 2 , "," , "." )}}</td>
					<td align="right">{{number_format ( $bono_vac_diario = $bono_vac_mensual/30 , $decimals = 2 , "," , "." )}}</td>
				</tr>
				<tr>
					<td>VACACIONES (15 DIAS EL PRIMER AÑO, TOMAMOS 21)</td>
					<td align="right">{{number_format ( $vac_anual = $sal_diario*21 , $decimals = 2 , "," , "." )}}</td>
					<td align="right">{{number_format ( $vac_mensual = $vac_anual/12 , $decimals = 2 , "," , "." )}}</td>
					<td align="right">{{number_format ( $vac_diario = $vac_mensual/30 , $decimals = 2 , "," , "." )}}</td>
				</tr>
				<tr>

					<td>BONO DE FIN DE AÑO (30 DÍAS AL AÑO)</td>
					<td align="right">{{number_format ( $bon_fin_anual = $sal_diario*30 , $decimals = 2 , "," , "." )}}</td>
					<td align="right">{{number_format ( $bon_fin_mensual = $bon_fin_anual/12 , $decimals = 2 , "," , "." )}}</td>
					<td align="right">{{number_format ( $bon_fin_diario = $bon_fin_mensual/30 , $decimals = 2 , "," , "." )}}</td>
				</tr>
				<tr>

					<td>CESTA TIKET</td>
					<?php $c_tick_mensual = ($cant_cesta_ticket*$u_tributaria)*30 ?>
					<td align="right">{{number_format ( $c_tick_anual = $c_tick_mensual*$cant_cesta_ticket , $decimals = 2 , "," , "." )}}</td>
					<td align="right">{{number_format ( $c_tick_mensual , $decimals = 2 , "," , "." )}}</td>
					<td align="right">{{number_format ( $c_tick_diario = $c_tick_mensual/30 , $decimals = 2 , "," , "." )}}</td>
				</tr>
				<tr>

					<td>PRESTACIONES (5 DIAS DE SALARIO AL AÑO)</td>
					<td align="right">{{number_format ( $pres_anual = $sal_diario*5 , $decimals = 2 , "," , "." )}}</td>
					<td align="right">{{number_format ( $pres_mensual = $pres_anual/12 , $decimals = 2 , "," , "." )}}</td>
					<td align="right">{{number_format ( $pres_diario = $pres_mensual/30 , $decimals = 2 , "," , "." )}}</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><b>TOTAL SALARIO INTEGRAL</b></td>
					<td align="right"><b>{{number_format ( $total_sal_anual = $sal_anual+$bono_vac_anual+$vac_anual+$bon_fin_anual+$c_tick_anual+$pres_anual , $decimals = 2 , "," , "." )}}</b></td>
					<td align="right"><b>{{number_format ( $total_sal_mensual = $sal_cargado+$bono_vac_mensual+$vac_mensual+$bon_fin_mensual+$c_tick_mensual+$pres_mensual , $decimals = 2 , "," , "." )}}</b></td>
					<td align="right" id="salario_integral"><b>{{number_format ( $total_sal_mensual/20 , $decimals = 2 , "," , "." )}}</b></td>
				</tr>
			</tbody>			
		</table>
		<p><b>VALOR DE LA UNIDAD TRIBUTARIA: {{$u_tributaria}}</b></p>
		<p>
			El salario diario integral se calcula sobre 20 días/mes ya que se trabajan 5 días a la semana
		</p>
		<p>
			En las vacaciones tomamos 21 días pues son 15 días para el primer año, sumandole un día cada año consecutivo del trabajador y como el proyecto está evaluado a 10 años hacemos un prorrateo.
		</p>
		<p>
			Aunque las prestaciones son calculadas a valor actual ellas son retroactivas ante un aumento salarial.
		</p>
		<input type="hidden" name="_token" value="{{csrf_token()}}" id="token">
			
	</div>
@endsection

@section('scripts')
	{!!Html::script('js/salario/salario.js')!!}
@endsection