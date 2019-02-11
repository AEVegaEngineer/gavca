	<!-- Datepicker Files -->
    {!!Html::style('css/bootstrap-datepicker3.css')!!}
    {!!Html::style('css/bootstrap-datepicker3.css')!!}
<div class="content">
<div class="form-group">
	<div class='row margenBotSm'>
    	<div class='col-xs-12 col-md-4'>
    		{!!Form::label('Código del proveedor: ')!!}
    	</div>
    	<div class='col-xs-12 col-md-5'>
    		{!!Form::text('prov_codigo', $codigo,['class'=>'form-control','placeholder'=>'Ingresa el Código del proveedor', 'required'=>'required','readonly'=>'readonly'])!!}    		
    	</div>
    </div>
	<div class='row margenBotSm'>
    	<div class='col-xs-12 col-md-4'>
    		{!!Form::label('Nombre del proveedor: ')!!}
    	</div>
    	<div class='col-xs-12 col-md-5'>
    		{!!Form::text('prov_nombre', null,['class'=>'form-control','placeholder'=>'Ingresa el nombre del proveedor', 'required'=>'required'])!!}    		
    	</div>
    </div>
    <div class='row margenBotSm'>
    	<div class='col-xs-12 col-md-4'>
    		{!!Form::label('Rif del proveedor: ')!!}
    	</div>
    	<div class='col-xs-12 col-md-5'>
    		{!!Form::text('prov_rif', null,['class'=>'form-control','placeholder'=>'Ingresa el rif del proveedor', 'required'=>'required'])!!}
    	</div>
    </div>
    <div class='row margenBotSm'>
    	<div class='col-xs-12 col-md-4'>
    		{!!Form::label('Dirección del proveedor: ')!!}
    	</div>
    	<div class='col-xs-12 col-md-5'>
    		{!!Form::text('prov_direccion', null,['class'=>'form-control','placeholder'=>'Ingresa la dirección del proveedor', 'required'=>'required'])!!}
    	</div>
    </div>
    <div class='row margenBotSm'>
    	<div class='col-xs-12 col-md-4'>
    		{!!Form::label('Contácto del proveedor: ')!!}
    	</div>
    	<div class='col-xs-12 col-md-5'>
    		{!!Form::text('prov_contacto', null,['class'=>'form-control','placeholder'=>'Ingresa el contácto del proveedor'])!!}
    	</div>
    </div>
    <div class='row margenBotSm'>
    	<div class='col-xs-12 col-md-4'>
    		{!!Form::label('Observaciones del proveedor: ')!!}
    	</div>
    	<div class='col-xs-12 col-md-5'>
    		{!!Form::text('prov_condiciones', null,['class'=>'form-control','placeholder'=>'Ingresa las observaciones del proveedor'])!!}
    	</div>
    </div>
    <input type="hidden" name="prov_retencion" value="0">
    <div class='row margenBotSm'>
    	<div class='col-xs-12 col-md-4'>
    		{!!Form::label('¿Al proveedor se le paga con crédito o de contado?')!!}
    	</div>
    	<div class='col-xs-12 col-md-5'>
    		{!!Form::select('prov_cred_o_cont', array('credito' => 'Crédito', 'contado' => 'Contado'),null,['class'=>'form-control','placeholder'=>'Selecciona el método de pago'])!!}
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
	$('.datepicker').datetimepicker();
</script>