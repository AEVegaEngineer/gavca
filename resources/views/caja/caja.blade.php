@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<nav class="navbar navbar-default">
			<div class="container-fluid">
			    <div class="navbar-header">
			      	<a class="navbar-brand" href="#">Caja Banco</a>
			    </div>
			    <ul class="nav navbar-nav">
			    	<?php if($caja == ""){ $caja = "Caja Chica";?>

			    		<li class="active">{!!link_to_route('caja.show', $title = 'Caja Chica', $parameters = 'Caja Chica')!!}</li>

			    	<?php }else { ?>

			        	<li>{!!link_to_route('caja.show', $title = 'Caja Chica', $parameters = 'Caja Chica')!!}</li>

			        <?php } ?>
			        
			    	@foreach($bancos as $banco)

			    	<?php if($caja == $banco->ban_nombre){ ?>

			    		<li class="active">{!!link_to_route('caja.show', $title = $banco->ban_nombre, $parameters = $banco->ban_nombre)!!}</li>

			    	<?php }else { ?>

			        	<li>{!!link_to_route('caja.show', $title = $banco->ban_nombre, $parameters = $banco->ban_nombre)!!}</li>

			        <?php } ?>

			    	@endforeach      	
			    </ul>
			</div>
		</nav>
		<?php 
		echo "<h3>".$caja." - ".date("d/m/Y", strtotime(Session::get('caja_fecha')))."</h3>";
		
		?>
		<div class="row">
			<div class="btn-group">
				<?php if($saldo_existe === null){ ?>
				<?php if(Auth::user()->privilegio == "admin" || Auth::user()->privilegio == "tipo1") { ?>
					{!!link_to_route('caja.transferir', $title = 'Transferir Saldo', $parameters = ['entidad'=>$caja,'fecha'=>Session::get('caja_fecha')], $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
				<?php } ?>	
				
					<?php if(Auth::user()->privilegio == "admin") { ?>
					{!!link_to_route('caja.entradaForm', $title = 'Dar Entrada', $parameters = ['entidad'=>$caja,'fecha'=>Session::get('caja_fecha')], $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
					{!!link_to_route('caja.salidaForm', $title = 'Dar Salida', $parameters = ['entidad'=>$caja,'fecha'=>Session::get('caja_fecha')], $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
					<?php } ?>		

				<?php } ?>		
				
				{!!link_to_route('caja.volverfecha', $title = 'Seleccionar Fecha Diferente', $parameters = ['entidad'=>$caja], $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
				
			</div>
		</div>		
		<table class="table">
			<thead>			
				<td>Concepto</td>
				<td align="center">Debe</td>				
				<td align="center">Haber</td>
				<td align="center">Saldo</td>
				<td align="center">Opciones</td>
			</thead>
			<?php $t_sale = 0; $t_entra = 0; $t_saldo = 0; ?>
			@foreach($records as $record)
			<tr>
				<td>{{$record->cb_concepto}}</td>
				<?php 
				//sobreescribo el saldo xq me interesa el ultimo valor q se escriba

				$t_saldo = $record->cb_saldo;
				if($record->cb_debe_haber == "DEBE"){
					$t_entra += $record->cb_monto;
					echo '<td align="right">'.number_format ( $record->cb_monto , $decimals = 2 , "," , "." ).'</td><td align="right"></td>';
				}else if($record->cb_debe_haber == "HABER"){
					$t_sale += $record->cb_monto;
					echo '<td align="right"></td><td align="right">'.number_format ( $record->cb_monto , $decimals = 2 , "," , "." ).'</td>';
				}
				?>				
				<td align="right">{{number_format ( $record->cb_saldo , $decimals = 2 , "," , "." )}}</td>				
				<td align="right">
					<?php if($record->cb_compra_id !== null){ ?>
					<div class="btn-group">
						<?php if($caja_actual == Session::get('caja_fecha') && $record->cb_activo != 0){ ?>
							{!!link_to_route('compra.show', $title = 'Ver Factura', $parameters = $record->cb_compra_id, $attributes = ['class'=>'btn btn-primary btn-xs'])!!}		
							<?php if(Auth::user()->privilegio == "admin" && isset($ultima_v_c) && $ultima_v_c == $record->id && 0){ ?>			
								{!!link_to_route('compra.trash', $title = 'Revertir Compra', $parameters = $record->cb_compra_id, $attributes = ['class'=>'btn btn-danger btn-xs'])!!}
							<?php } ?>
						<?php } ?>
				    </div>
					<?php } ?>
					<?php if($record->cb_concepto == 'Venta'){ ?>
					<div class="btn-group">
						<?php if($caja_actual == Session::get('caja_fecha') && $record->cb_activo != 0){ ?>
							{!!link_to_route('venta.show', $title = 'Ver Factura', $parameters = $record->cb_venta_id, $attributes = ['class'=>'btn btn-success btn-xs'])!!}	
							<?php if(Auth::user()->privilegio == "admin" && isset($ultima_v_c) && $ultima_v_c == $record->id && 0){ ?>			
								{!!link_to_route('venta.revertir', $title = 'Revertir Venta', $parameters = $record->cb_venta_id, $attributes = ['class'=>'btn btn-danger btn-xs'])!!}
							<?php } ?>
						<?php } ?>
					</div>
					<?php } ?>
				</td>
			</tr>
			@endforeach	
			<tr>
				<td><b>TOTAL</b></td>
				<td align="right"><b>{{number_format ( $t_entra , $decimals = 2 , "," , "." )}}</b></td>
				<td align="right"><b>{{number_format ( $t_sale , $decimals = 2 , "," , "." )}}</b></td>
				<td align="right"><b>{{number_format ( $t_saldo , $decimals = 2 , "," , "." )}}</b></td>
				<td></td>
			</tr>		
		</table>
		
		<div class="row">			
			<div class="col-md-12">
				<?php if($saldo_existe === null){ ?>
					<?php if($caja == "Caja Chica"){ ?>
						<?php if(Auth::user()->privilegio == "admin" || Auth::user()->privilegio == "tipo1"){?>
							{!!link_to_route('caja.confirmarcierre', $title = 'Cerrar Día', $parameters = ['entidad'=>$caja,'fecha'=>Session::get('caja_fecha')], $attributes = ['class'=>'btn btn-success'])!!}
						<?php } ?>
					<?php } ?>
				<?php } else { ?>
				<h3>-- Día Cerrado --</h3>
					<h2>Este día esta cerrado, si desea ver o imprimir el cierre de caja haga click en el siguiente vínculo.</h2>
					{!!link_to_route('caja.reporte', $title = 'Generar reporte PDF', $parameters = ['entidad'=>$caja,'fecha'=>Session::get('caja_fecha')], $attributes = ['class'=>'btn btn-primary'])!!}
				<?php } ?>
			</div>
		</div>
	
@endsection