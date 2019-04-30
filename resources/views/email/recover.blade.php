@section('content')

<div class="content">
	<div class="col-md-12" style="background-color:#000; color:#FFF; text-align:center;"><h3>Sistema Administrativo Gavca</h3></div>
	<div style="margin: 30px">
		@include('alerts.errors')	
		@include('alerts.request')
		<h1 class="margenBotSm">Recuperación de Contraseña</h1>
		<p>Usted ha requerido el restablecimiento de la contraseña para su cuenta en el sistema administrativo GAVCA</p>
		<p>Para hacerlo por favor siga el siguiente vínculo: </p>		
		{!!link_to('/',$tittle = 'Volver a formulario de Iniciar Sesión', $attributes = null, $secure = null)!!}
		<p>Si usted no ha requerido ningún restablecimiento o desconoce el motivo de este mail, por favor, ignórelo.</p>
	</div>
</div>