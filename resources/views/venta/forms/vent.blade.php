<!-- Datepicker Files -->
    {!!Html::style('css/bootstrap-datepicker3.css')!!}
<div class="content">
<div class="form-group">
	<div class="row margenBotSm">	
		<div class="col-xs-12 col-md-2">
		    {!!Form::label('Seleccione un cliente: ')!!}			
		</div>
		<div class="col-xs-12 col-md-4">		    
			{!! Form::select('cli_codigo', $clientes, null, ['class' => 'form-control']) !!}
		</div>
		<div class="col-xs-12 col-md-2">
		    {!!Form::label('Fecha de venta (seleccionada en caja): ')!!}			
		</div>
		<div class="col-xs-12 col-md-4">		    
			{!!Form::text('ven_fecha',$fecha,['class'=>'form-control','placeholder'=>'Click aquí seleccionar una fecha','required'=>'required','readonly'=>'true'])!!}	
		</div>
    </div>
    <div class="row margenBotSm">	
		<div class="col-xs-12 col-md-2">
		    {!!Form::label('Número de factura: ')!!}			
		</div>
		<div class="col-xs-12 col-md-4">    
			{!!Form::text('ven_factura',$factura,['readonly'=>'readonly','class'=>'form-control','placeholder'=>'Nro. Factura','required'=>'required'])!!}
		</div>
		<div class="col-xs-12 col-md-2">
		    {!!Form::label('Condición de la venta (crédito o contado): ')!!}			
		</div>
		<div class="col-xs-12 col-md-4">		    
			{!!Form::select('ven_condicion', ['credito' => 'Crédito', 'contado' => 'Contado'], null, ['class'=>'form-control','placeholder' => 'Escoje una condición de venta...'])!!}
		</div>
    </div>
    <div class="row margenBotSm">
    	<div id="banco_o_caja">
    		<div class="col-xs-12 col-md-2">
			    {!!Form::label('¿Se cobró contra Banco o Caja Chica?: ')!!}			
			</div>
			<div class="col-xs-12 col-md-4">		
				{!!Form::select('banco_o_caja', ['caja' => 'Caja Chica', 'banco' => 'Banco'], null, ['class'=>'form-control'])!!}
			</div> 
    	</div>
    	<div id="banco">
    		<div class="col-xs-12 col-md-2">
			    {!!Form::label('¿Contra cual banco se cobró?: ')!!}			
			</div>
			<div class="col-xs-12 col-md-4">
				{!! Form::select('banco', $bancos, null, ['class' => 'form-control']) !!}
			</div>
	    </div>  
    </div>
</div>
</div>
<!-- Jquery -->
    {!!Html::script('js/jquery.min.js')!!}
	<!-- Datepicker Files -->    
    {!!Html::script('js/bootstrap-datepicker.js')!!}
    <!-- Languaje -->
    {!!Html::script('locales/bootstrap-datepicker.es.min.js')!!}

<script type="text/javascript">
	$('.datepicker').datepicker({
	    format: "yyyy-mm-dd",
	    language: "es",
	    autoclose: true
	});
</script>
<script src="{{ asset('/js/venta/makeForm.js') }}" type="text/javascript"></script>