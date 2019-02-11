@extends('layouts.admin')

@section('content')
<h3 class="form-signin-heading margenBotMd">Por favor, seleccione un nuevo parámetro para ingresarlo en la receta de {!!$rec_nombre!!}</h3>
@include('alerts.request')
{!!Form::open(['route'=>'ingrediente.store','method'=>'POST'])!!}
@include('ingrediente.forms.prm')
{!!Form::submit('Agregar',['class'=>'btn btn-lg btn-success'])!!}
{!!Form::close()!!}
@stop