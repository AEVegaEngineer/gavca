@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
	{!!Form::open(['route'=>'compra.store','method'=>'POST'])!!}
		<h3 class="form-signin-heading margenBotSm">Ingrese las materias primas adquiridas con la compra</h3>
		<div class="col-md-12">
			<p>Para agregar productos a la compra seleccionalos de la lista desplegable y haz click en agregar producto a compra</p>
			<div class="col-md-3">
				<select name="sel_param" id="sel_param" class="form-control" placeholder="Escoje un Producto...">
				    @foreach($parametros as $parametro)
				    	<option value="{{ $parametro->par_codigo }}">{{ $parametro->par_codigo }} -- {{ $parametro->par_nombre}}</option>
				    	
				    @endforeach
				</select>
			</div>						
			<a href="#" class="btn btn-primary btn-sm" id="add">Agregar Producto a Compra</a>
			<br>
			<br>
			<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">Crear nuevo Producto y Agregarlo a Compra</button>
			<br>
			<br>	
			<b><p id="error-msg" align="right"></p></b>	
			{!!Form::submit('Guardar Cambios y Terminar',['class'=>'btn btn-success pull-right'])!!}
			<hr>

			<input type="hidden" name="comp_fecha" value="{{$comp_fecha}}" id="comp_fecha">
			<input type="hidden" name="comp_proveedor" value="{{$proveedor}}" id="comp_proveedor">
			<input type="hidden" name="comp_doc" value="{{$comp_doc}}" id="comp_doc">
			<input type="hidden" name="comp_cred_cont" value="{{$comp_cred_cont}}" id="comp_cred_cont">
			<input type="hidden" name="banco_o_caja" value="{{$banco_o_caja}}" id="banco_o_caja">
			<input type="hidden" name="banco" value="{{$banco}}" id="banco">
			<input type="hidden" name="comp_monto" value="0" id="comp_monto">
			<input type="hidden" name="_token" value="{{csrf_token()}}" id="token">		
			<input type="hidden" name="entidad" id="entidad" value="{{$entidad}}">

		</div>
		<div class="col-md-12">
			<table class="table table-bordered" id="content" style="overflow-x: auto; width: 1024px;">			
				<thead>
					<th>Materia Prima</th>
					<th>Código M.P.</th>
					<th>Perecedero</th>
					<th>Cantidad</th>
					<th>Unidad</th>
					<th>Costo</th>
					<th>Actualizar Costo</th>			
					<th>Alicuota</th>
					<th>IVA</th>	
					<th>Costo Producto</th>					
					<th>Operación</th>
				</thead>	
			</table>
			<!--
			<a href="#" class="btn btn-primary btn-sm" id="actualizar">Actualizar costos totales</a>-->
			<div class="row">
				<div class="col-md-7"></div>
				<div class="col-md-5">
					<table class="table table-bordered" id="totals">	
						<tr>
							<td colspan="2">Total</td>
							<td id="total">0.00</td>
						</tr>
						<tr>
							<td colspan="2">Iva</td>
							<td id="totalIva">0.00</td>
						</tr>	
						<tr>
							<td colspan="2">Total + Iva</td>
							<td id="totalMasIva">0.00</td>
						</tr>		
					</table>	
				</div>
			</div>
		</div>
					
	</div>


	{!!Form::close()!!}

	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">

	    <!-- Modal content-->
	    <div class="modal-content">
	      	<div class="modal-header">
	        	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<h4 class="modal-title">Crear Nuevo Producto</h4>
	      	</div>
	      	<div class="modal-body">
	      		<div class="row margenBotSm">
	      			<div class="col-md-5">
		      			<label>Nombre del Producto:</label>
		      		</div>
		      		<div class="col-md-7">
		        		<input type='text' class='form-control' name='par_nombre' id='par_nombre'>
	        		</div>
	      		</div>
	        	<div class="row margenBotSm">
	        		<div class="col-md-5">
		      			<label>Unidad:</label>
		      		</div>
		      		<div class="col-md-7">
		        		<input type='text' class='form-control' name='par_unidad' id='par_unidad'>
	        		</div>
	      		</div>
	      		<div class="row margenBotSm">
	        		<div class="col-md-5">
		      			<label>Costo:</label>
		      		</div>
		      		<div class="col-md-7">
		        		<input type='text' class='form-control' name='par_costo' id='par_costo'>
	        		</div>
	      		</div>
	      		<div class="row margenBotSm">
	      			<div class="col-md-5">
		      			<label>Observación:</label>
		      		</div>
		      		<div class="col-md-7">
		        		<input type='text' class='form-control' name='par_observacion' id='par_observacion'>
	        		</div>
	      		</div>
	      		<div class="row margenBotSm">
	      			<div class="col-md-5">
		      			<label>¿Es perecedero o imperecedero?</label>
		      		</div>
		      		<div class="col-md-7">
		        		<select name='mpomi' id='mpomi' class='form-control' placeholder='Escoje el estado perecedero...'>
		        			<option disabled selected value> -- selecciona una opción -- </option>
		        			<option value='1'>Perecedero</option>
		        			<option value='2'>Imperecedero</option>
		        		</select>
	        		</div>
	      		</div>
	      		<input type="hidden" name="par_codigo" id="par_codigo">
	      	</div>
	      	<div class="modal-footer">
	      		<div class="btn-group">
	      			<a href="#" class="btn btn-success" id="create_mp">Crear y agregar a tabla</a>
	        		<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
	      		</div>	      	
	      	</div>
	    </div>

	  </div>
	</div>	
	<script src="{{ asset('/js/jquery.min.js') }}" type="text/javascript"></script>	

	<script src="{{ asset('/js/materiaprima/crear_mp.js?118') }}" type="text/javascript"></script>
@endsection