	<!-- Datepicker Files -->
    {!!Html::style('css/bootstrap-datepicker3.css')!!}
<div class="content">
<div class="form-group">
	<div class="row margenBotSm">

    	<div class="col-xs-12 col-md-4">
		    {!!Form::label('Fecha de la compra: ')!!}		
		</div>
		<div class="col-xs-12 col-md-5">	
			{!!Form::text('comp_fecha',$fecha,['class'=>'form-control','placeholder'=>'Click aquí para fijar fecha de compra','readonly'=>'true'])!!}	 
		</div>		
	</div>

	<div class="row margenBotSm">	
		<div class="col-xs-12 col-md-4">
		    {!!Form::label('Código o nombre del proveedor: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">	
			{!!Form::text('comp_proveedor', null,['class'=>'form-control','placeholder'=>'Ingresa el código o nombre del proveedor','id'=>'comp_proveedor'])!!}	 
		</div>
    </div> 
    <div class="row margenBotSm">	
		<div class="col-xs-12 col-md-12">
			<ul id="posibilities">
		    </ul>	
		</div>		
    </div>
    <div class="row margenBotSm">	
		<div id="livesearch" class="col-md-12"></div>
    </div> 
    
    <div class="row margenBotSm">	
		<div class="col-xs-12 col-md-4">
		    {!!Form::label('Documento de factura: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">	
			{!!Form::text('comp_doc', null,['class'=>'form-control','required'=>'','placeholder'=>'Ingresa el documento de factura','maxlength'=>'16'])!!}	 
		</div>
    </div>    
    <div class="row margenBotSm">	
		<div class="col-xs-12 col-md-4">
		    {!!Form::label('¿Esta compra fué a crédito o a contado?: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">	
			{!!Form::select('comp_cred_cont', ['credito' => 'Crédito', 'contado' => 'Contado'], null, ['class'=>'form-control'])!!}
		</div>
    </div>  
    <div id="banco_o_caja">
    	<div class="row margenBotSm">	
			<div class="col-xs-12 col-md-4">
			    {!!Form::label('¿Se pago contra Banco o Caja Chica?: ')!!}			
			</div>
			<div class="col-xs-12 col-md-5">	
				{!!Form::select('banco_o_caja', ['caja' => 'Caja Chica', 'banco' => 'Banco'], null, ['class'=>'form-control'])!!}
			</div>
	    </div>  
    </div>
    <div id="banco">
    	<div class="row margenBotSm">	
			<div class="col-xs-12 col-md-4">
			    {!!Form::label('¿Contra cual banco se pagó?: ')!!}			
			</div>
			<div class="col-xs-12 col-md-5">
				{!! Form::select('banco', $bancos, null, ['class' => 'form-control']) !!}
			</div>
	    </div>  
    </div>    
    <input type="hidden" name="codigo" value="{{ Session::get('codigo') }}" id="codigo">
    <input type="hidden" name="_token" value="{{csrf_token()}}" id="token">
</div>
</div>
<!-- Jquery -->
    {!!Html::script('js/jquery.min.js')!!}
	<!-- Datepicker Files -->    
    {!!Html::script('js/bootstrap-datepicker.js')!!}
    <!-- Languaje -->
    {!!Html::script('locales/bootstrap-datepicker.es.min.js')!!}
<script src="{{ asset('/js/proveedor/getProveedor.js?5') }}" type="text/javascript"></script>
<script type="text/javascript">
	$('.datepicker').datepicker({
	    format: "yyyy-mm-dd",
	    language: "es",
	    autoclose: true
	});
</script>