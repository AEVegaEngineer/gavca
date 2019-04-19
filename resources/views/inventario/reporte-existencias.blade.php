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
        Reporte de Existencias de productos de {{$proc}} para el mes de {{$mes_long}} del año {{$fecha_formateada->year}}</h3>
        <table class="table">
            <tr>
                <?php if($proc == "Proceso C (Terminados)"){ ?>
                <td>Producto Terminado</td>
                <?php }else{?>
                <td>Producto Intermedio {{$proc}}</td>
                <?php }?>
                <td>Unidad</td>
                <td>Cantidad</td>
                <td>Ultima Modificación</td>
            </tr>
        @foreach($inventarios as $inventario)
            <tr>             
                <td>{{$inventario->rec_nombre}}</td>
                <td>{{$inventario->rec_unidad}}</td>        
                <td>{{$inventario->pro_produccion}}</td>
                <td>{{date("Y/m/d", strtotime($inventario->updated_at))}}</td>
            </tr>
        @endforeach
        </table>
     <script src="js/jquery.min.js"></script> 
     <script src="js/bootstrap.min.js"></script> 
    </body>
</html>