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
        <h3  style="display: inline-block; vertical-align: middle; margin-left: 5px;">
        Reporte de Ventas para el mes de {{$mes_long}} del año {{$fecha_format->year}}</h3>
        <table class="table table-bordered">
            <tr>
                <td>Fecha de Venta</td>
                <td>Factura de Venta</td>
                <td>Código del Cliente</td>             
                <td>Condición</td>
                <td>Entidad</td>
                <td>Precio de Venta</td>
            </tr>
            <?php $total_ventas = 0;?>
            @foreach($totalesventas as $key => $totalventa)
                @foreach($elementos as $key => $elemento)
                <?php if($totalventa->ven_factura == $elemento->ven_factura){?>
                <tr>
                    <td>{{$elemento->ven_fecha}}</td>
                    <td>{{$totalventa->ven_factura}}</td>
                    <td>{{$elemento->cli_codigo}}</td>          
                    <td>{{$elemento->ven_condicion}}</td>
                    <td>{{$elemento->ven_entidad}}</td>
                    <td align="right">{{ number_format ( $totalventa->ven_total , $decimals = 2 , "," , "." ) }}</td>                    
                </tr>
                <?php 
                $total_ventas += $totalventa->ven_total;
                } 
                ?>
                @endforeach
            @endforeach 
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><b>TOTAL</b></td>
                <td align="right"><b><?php echo number_format ( $total_ventas , $decimals = 2 , "," , "." ); ?></b></td>                
            </tr>
        </table>
     <script src="js/jquery.min.js"></script> 
     <script src="js/bootstrap.min.js"></script> 
    </body>
</html>