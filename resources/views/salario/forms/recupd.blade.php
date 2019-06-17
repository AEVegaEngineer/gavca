
<div class="content">
<div class="form-group">
	{!!Form::model($salario,['route'=>['salario.update',$salario->id],'method'=>'put'])!!}
	<div class="row margenBotSm">	

		
		<div class="col-md-4 col-xs-12 margenBotSm">
			<div class="col-xs-12 col-md-6">
		    	{!!Form::label('Salario base mensual: ')!!}			
			</div>
			<div class="col-xs-12 col-md-6">		    
				{!!Form::text('sal_mensual',null,['class'=>'form-control','placeholder'=>'Ej:425,200.00'])!!}
			</div>
		</div>
		<div class="col-md-4 col-xs-12 margenBotSm">
			<div class="col-xs-12 col-md-6">
			    {!!Form::label('Unidad Tributaria: ')!!}			
			</div>
			<div class="col-xs-12 col-md-6">		    
				{!!Form::number('unidad_tributaria',null,['class'=>'form-control','placeholder'=>'Ingresa el salario base mensual'])!!}
			</div>
		</div>
		<div class="col-md-4 col-xs-12 margenBotSm">
			<div class="col-xs-12 col-md-6">
			    {!!Form::label('Cantidad de Unidades Tributarias de cesta ticket por día trabajado: ')!!}			
			</div>
			<div class="col-xs-12 col-md-6">		    
				{!!Form::number('cant_cesta_ticket',null,['class'=>'form-control','placeholder'=>'Ingresa la cantidad de unidades tributarias en cesta ticket por día trabajado'])!!}
			</div>
		</div>
	</div>
	<div class="row margenBotLg">
		<div class="col-md-2"></div>
		<div class="col-md-4 col-xs-12">
			{!!Form::submit('Actualizar',['class'=>'btn btn-success btn-block'])!!}
		</div>
		<div class="col-md-4 col-xs-12">
			<a href="/salario" class="btn btn-success btn-block">Volver a Cálculo de Salarios</a>
		</div>
	</div>
		
	{!!Form::close()!!}	

		
    
    <div class="row">	
		<div class="col-md-6 col-xs-12">
			{!!link_to_route('aumento.create', $title = 'Registrar un nuevo aumento',null, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
		</div>
	</div>
    <table class="table table-bordered">
		<thead>
			<th>Descripción del aumento</th>
			<th>Porcentaje sobre la base del aumento</th>
			<th>Operación</th>
		</thead>
		<tbody>
			@foreach($aumentos as $aumento)
			<tr>
				<td>{{$aumento->aum_descripcion}}</td>
				<td>{{$aumento->aum_aumento}}%</td>
				<td>
					{!!Form::open(['route'=>['aumento.destroy',$aumento->id],'method'=>'DELETE'])!!}
						<div class="btn-group">
						{!!link_to_route('aumento.edit', $title = 'Editar',$parameters = $aumento->id, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
						{!!Form::submit('Eliminar',['class'=>'btn btn-danger btn-sm'])!!}
						</div>

					{!!Form::close()!!}
				</td>
			</tr>
			@endforeach
		</tbody>
	</table>
</div>
</div>