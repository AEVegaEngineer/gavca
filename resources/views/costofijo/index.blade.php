@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
		<h2 class="form-signin-heading margenBotMd">Determinación del estándar de costos fijo por unidad de producto</h2>
		<div class="row">	
			<div class="col-md-6 col-xs-12">
				<a href="{!!URL::to('/costofijo/create')!!}" class="btn btn-primary btn-sm">Agregar un nuevo costo fijo</a>
			</div>
		</div>
		<table class="table">
			<thead>
				<th>Concepto</th>
				<th align="right">Monto mes</th>
				<th align="right">Estándar por frasco</th>
				<th>Actualizado al</th>
				<th>Operaciones</th>
			</thead>
			<?php 
			$cf_montomes_tot = 0;
			$cf_estandar_tot = 0;
			$i = 0;
			?>
		@foreach($costofijos as $costofijo)

			<tr>
				<td>{{$costofijo->cf_concepto}}</td>
				<td align="right" id="mes-{{$i}}">
					{{number_format($costofijo->cf_montomes,$decimals = 2 , "," , ".")}}
				</td>
				<td align="right" id="">
					{{number_format($costofijo->cf_montomes/$produccionmess->produccion,$decimals = 2 , "," , ".")}}
				</td>
				<td>{{date_format($costofijo->updated_at,"d/m/Y")}}</td>
				<td>
					{!!Form::open(['route'=>['costofijo.destroy',$costofijo->id],'method'=>'DELETE'])!!}
						<div class="btn-group-xs">
						{!!link_to_route('costofijo.edit', $title = 'Editar', $parameters = $costofijo->id, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
						{!!Form::submit('Eliminar',['class'=>'btn btn-danger btn-sm'])!!}
						</div>
					{!!Form::close()!!}
				</td>
			</tr>
			<?php 
			$cf_montomes_tot += $costofijo->cf_montomes;
			$i++;
			?>
		@endforeach
			<tr>
				<td>TOTAL</td>
				<td align="right">{{number_format($cf_montomes_tot,$decimals = 2 , "," , ".")}}</td>
				<td align="right">{{number_format($cf_montomes_tot/$produccionmess->produccion,$decimals = 2 , "," , ".")}}</td>
			</tr>
		</table>
		<div class="col-md-6 col-xs-12">
				<a href="{!!URL::to('/produccionmes/1/edit')!!}" class="btn btn-primary btn-sm">Actualizar producción</a>
			</div>
		<table class="table">
			<thead>
				<td>Producción ultimo mes actualizado en fecha</td>
				<td>Número de frascos producidos</td>
			</thead>
			<tr>
				<td>{{date_format($produccionmess->updated_at,"d/m/Y")}}</td>
				<td id="total">{{$produccionmess->produccion}}</td>
			</tr>			
		</table>
		<p><b>Estandar de costo fijo por unidad de producción: {{number_format($costo_fijo_unitario,$decimals = 2 , "," , ".")}}</b></p>
	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script>
	//Calculo de porcentajes sobre el total de los parámetros
	$i=0;

	var str = $("#total").html();
	str = str.replace(/\,/g, ''); // Igual que un .replace normal pero con /g "global"
	$total = parseFloat(str);
	$tot_std = 0;
	//alert($total);

	$("td[id^=std]").each(function(){
		str = $("#mes-"+$i).html();
		str = str.replace(/\,/g, ''); // Igual que un .replace normal pero con /g "global"
		$mes = parseFloat(str);

		$result = parseFloat($mes/$total).toFixed(2);
		$("#std-"+$i).html($result);
		$tot_std+=$result*1;
		//alert($mes/$total*100);
		$i++;
		//alert($(this).html());
	});
	$('#tot_std').html(parseFloat($tot_std).toFixed(2));
	//Calculo de porcentajes sobre el total de los totales
	
	/*
	str = $("#totalMat").html();
	str = str.replace(",","");
	$totalMat = parseFloat(str);

	$result = parseFloat($totalMat/$total*100).toFixed(2);
	$("#matOver").html($result+"%");
	$("#totalOver").html("100%");
	*/
	

	
	</script>
@endsection

