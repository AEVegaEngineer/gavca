@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotLg">Por favor, ingrese los datos de una nueva venta</h2>
@include('alerts.request')
@include('alerts.errors')
{!!Form::open(['route'=>'venta.facturar','method'=>'POST'])!!}
@include('venta.forms.vent')
{!!Form::submit('Registrar',['class'=>'btn btn-lg btn-success'])!!}
{!!Form::close()!!}
@stop