@extends('layouts.admin')

@include('alerts.errors')
@section('content')
	<div class="col-md-12">
		<h2>Sistema de Administración Gavca</h2>
		<h3>Bienvenido, {!!Auth::user()->name!!}</h3>
		<p>Diríjase al menú de la izquierda para comenzar.</p>
	</div>
@endsection