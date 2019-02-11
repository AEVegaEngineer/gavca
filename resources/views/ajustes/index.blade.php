@extends('layouts.admin')

@section('content')
	@include('alerts.success')
	<h3 class="form-signin-heading">Ajustes</h3>			
	<p class="alert alert-warning">Los ajustes realizados en esta página no son reversibles, no haga cambios en esta página si no esta seguro de que desea realizarlos.</p>
	<div class="row">
		<div class="col-md-12 margenBotSm">
			<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modalReiniciarDB">Reiniciar bases de datos (Limpia compras, ventas, caja, inventarios, produccion, cuentas por pagar y cuentas por cobrar)</button>
		</div>
		
	</div>
	<!-- Modal -->
	{!!Form::open(['route'=>['ajustes.reiniciarDB',null],'method'=>'POST'])!!}
	<div id="modalReiniciarDB" class="modal fade" role="dialog">
		<div class="modal-dialog">
	    	<!-- Modal content-->
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal">&times;</button>
	        		<h4 class="modal-title">Reiniciar Bases de Datos</h4>
	      		</div>
	      		<div class="modal-body">
	      			<div class="row margenBotSm">
	      				<div class="col-md-12">
		      				<p>¿Está seguro que desea reinciar estas bases de datos?</p>
		      				<p>Todos los datos almacenados en compras, ventas, caja, inventarios, producción, cuentas por pagar y cuentas por cobrar serán eliminados irreversiblemente.</p>
		      			</div>
		      		</div>       	
	      		</div>
	      		<div class="modal-footer">
	      			<div class="btn-group">
	      				{!!Form::submit('Reiniciar Bases de Datos',['class'=>'btn btn-danger btn-lg'])!!}
	        			<button type="button" class="btn btn-default btn-lg" data-dismiss="modal">Cerrar</button>
	      			</div>	      	
	      		</div>
	    	</div>
	  	</div>
	</div>	
	{!!Form::close()!!}
	<script src="{{ asset('/js/jquery.min.js') }}" type="text/javascript"></script>	
@endsection
