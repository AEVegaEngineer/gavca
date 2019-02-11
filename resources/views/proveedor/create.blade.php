@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotSm">Por favor, ingrese un nuevo proveedor</h2>
@include('alerts.request')
{!!Form::open(['route'=>'proveedor.store','method'=>'POST'])!!}
@include('proveedor.forms.prov')
{!!Form::submit('Registrar',['class'=>'btn btn-lg btn-success'])!!}
{!!Form::close()!!}
@stop