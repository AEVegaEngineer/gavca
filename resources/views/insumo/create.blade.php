@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotSm">Por favor, ingrese un nuevo insumo</h2>
@include('alerts.request')
{!!Form::open(['route'=>'insumo.store','method'=>'POST'])!!}
@include('insumo.forms.ins')
{!!Form::submit('Registrar',['class'=>'btn btn-lg btn-success'])!!}
{!!Form::close()!!}	
@stop