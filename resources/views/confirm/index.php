@extends('layouts.admin')
@section('content')
	<div class="recetas">
		@include('alerts.success')
		<h2 class="form-signin-heading">Confirme que desea eliminar</h2>

		<div class="row">
			<div class="col-md-4">a</div>
			<div class="col-md-4">b</div>
		</div>
		
			
	</div>
	{!!$recetas->render()!!}
@endsection
