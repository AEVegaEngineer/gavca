@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
		<h2 class="form-signin-heading margenBotLg">Venta {{$ven_factura}} de fecha {{$ven_fecha}}</h2>
		{!!Form::open(['route'=>'venta.store','method'=>'POST'])!!}
		<table class="table">
			<thead>
				<th>Producción</th>
				<th>Unidad</th>
				<th>Disponibilidad</th>
				<th>Costo</th>
				<th>Cantidad a vender</th>
				<th>Suma</th>
			</thead>
			<tbody>
			@foreach($produccionc as $key => $produccion)
			<tr>
				<td>{{$produccion->rec_nombre}}</td>
				<td>{{$produccion->rec_unidad}}</td>
				<input type="hidden" name="pro_produccion[]" value="{{$produccion->pro_produccion}}">
				<td id="ven_disponibilidad{{$key}}">{{$produccion->pro_produccion}}</td>
				<input type="hidden" name="rec_nombre[]" value="{{$produccion->rec_nombre}}">
				<td>{!!Form::number('ven_costo[]',$costos[$key],['class'=>'form-control','placeholder'=>'Debes especificar un costo','min'=>'1'])!!}</td>
				<input type="hidden" id="ven_costo{{$key}}" value="{{$costos[$key]}}">
				<td>{!!Form::number('ven_cantidad[]',null,['class'=>'form-control','placeholder'=>'No mayor a disponibilidad','min'=>'1'])!!}</td>
				<td id="suma{{$key}}" align="right">0</td>
			</tr>
			@endforeach
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td><b>TOTAL</b></td>
				<td></td>
				<td align="right"><b><span id="total">0</span></b></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td><b>IVA</b></td>
				<td>{!!Form::text('iva','12%',['class'=>'form-control','placeholder'=>'Debes especificar un IVA'])!!}</td>
				<td align="right"><b><span id="total-iva">0</span></b></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td><b>TOTAL+IVA</b></td>
				<td></td>
				<td align="right"><b><span id="totalMasIva">0</span></b></td>
			</tr>
			</tbody>
		</table>

		<input type="hidden" name="cli_codigo" value="{{$cli_codigo}}">
		<input type="hidden" name="ven_fecha" value="{{$ven_fecha}}">
		<input type="hidden" name="ven_factura" value="{{$ven_factura}}">
		<input type="hidden" name="ven_condicion" value="{{$ven_condicion}}">
		<input type="hidden" name="banco_o_caja" value="{{$banco_o_caja}}">
		<input type="hidden" name="banco" value="{{$banco}}">
		<input type="hidden" name="totMasIva" id="totMasIva" value="">
		{!!Form::submit('Registrar Venta',['class'=>'btn btn-lg btn-success'])!!}
		{!!Form::close()!!}

		{!!Html::script('js/jquery.min.js')!!}
		{!!Html::script('js/venta/venta.js?7')!!}	
	</div>
@endsection
