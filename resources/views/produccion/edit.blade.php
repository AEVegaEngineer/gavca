@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotLg">Por favor, ingrese datos de producción para el proceso productivo</h2>
@include('alerts.request')
{!!Form::model($produccion,['route'=>['produccion.update',$produccion->id],'method'=>'put'])!!}
@include('produccion.forms.updprd')
{!!Form::submit('Actualizar',['class'=>'btn btn-lg btn-success'])!!}
{!!Form::close()!!}
	
@stop