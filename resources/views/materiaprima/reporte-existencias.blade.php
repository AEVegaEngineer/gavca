<!-- pdf.blade.php -->

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <script type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/estilosPersonalizados.css">
    </head>
    <body>
        <img src="img/gavcalogo.png" alt="logo de la empresa" style="display: inline-block;">
        <h3  style="display: inline-block; vertical-align: middle; margin-left: 5px; width: 500px">
        Reporte de Existencias de materias primas para el mes de {{$mes_long}} del año {{$fecha_formateada->year}}</h3>
        <table class="table">
            <tr>
                <td>Código</td>
                <td>Materia Prima</td>
                <td>Unidad</td>
                <td>Cantidad</td>
                <td>Ultima Modificación</td>
            </tr>
        @foreach($materiasprimas as $materiaprima)
            <tr>
                <td>{{$materiaprima->mp_codigo}}</td>
                <td>{{$materiaprima->par_nombre}}</td>
                <td>{{$materiaprima->par_unidad}}</td>  
                
                <td>{{$materiaprima->mp_cantidad}}</td>
                <td>{{date("Y/m/d", strtotime($materiaprima->updated_at))}}</td>                
            </tr>
        @endforeach
        </table>
     <script src="js/jquery.min.js"></script> 
     <script src="js/bootstrap.min.js"></script> 
    </body>
</html>