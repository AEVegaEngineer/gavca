@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
		<h2 class="form-signin-heading">Misceláneos</h2>
		<div class="row">	
			<div class="col-md-6 col-xs-12">
				{!!link_to_route('miscelaneo.edit', $title = 'Modificar valores de las tablas', $parameters = 1, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
			</div>
		</div>
		<h3 class="form-signin-heading">Costo por el kilo de la trucha</h3>
		<table class="table">
			<thead>
				<th>Costo por kilo de la trucha</th>
				<th>Cantidad</th>
				<th>Costo Unit.</th>
				<th>Costo Tot.</th>
			</thead>
			@foreach($miscelaneos as $miscelaneo)
			<tr>
				<td>Truchas en unidades</td>
				<td>{{number_format($tru_cant = $miscelaneo->tru_cant,$decimals = 2 , "," , ".")}}</td>
				<td>{{number_format($tru_cost_unit = $miscelaneo->tru_cost_unit,$decimals = 2 , "," , ".")}}</td>
				<td>{{number_format($tru_cost_tot = $tru_cant * $tru_cost_unit,$decimals = 2 , "," , ".")}}</td>
			</tr>
			<tr>
				<td>Truchas en kilogramos</td>
				<td>{{number_format($tru_kilo = $miscelaneo->tru_kilo,$decimals = 2 , "," , ".")}}</td>
				<td>{{number_format($tru_kilo_cost = $tru_cost_tot / $tru_kilo,$decimals = 2 , "," , ".")}}</td>
				<td></td>
			</tr>
			@endforeach
		
		</table>

		<hr>
		<h3 class="form-signin-heading">Estándar del costo del gas por un 1%</h3>
		<table class="table">
			<thead>
				<th>Porcentaje útil de bombona llena</th>
				<th>Costo de la bombona</th>
				<th>Gas (Costo de 1% de consumo)</th>
			</thead>
			@foreach($miscelaneos as $miscelaneo)
			<tr>
				<td>{{number_format($gas_porc_util = $miscelaneo->gas_porc_util,$decimals = 2 , "," , ".")}}%</td>
				<td>{{number_format($gas_cost_bomb = $miscelaneo->gas_cost_bomb,$decimals = 2 , "," , ".")}}</td>
				<td>{{number_format($gas_cost_1porc = $gas_cost_bomb/$gas_porc_util,$decimals = 2 , "," , ".")}}</td>
			</tr>
			@endforeach
		</table>

		
			
	</div>
@endsection
