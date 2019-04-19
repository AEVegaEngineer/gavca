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
        Reporte de Venta para la factura Nro.{{$factura}}</h3>
        <table class="table">
            <tr>
                <td>Fecha de compra</td>
                <td>Código del Cliente</td>
                <td>Documento de factura</td>   
            </tr>
            <tr class="warning">
                <td>{{$ventas[0]->ven_fecha}}</td>
                <td>{{$ventas[0]->cli_codigo}}</td>
                <td>{{$factura}}</td>
            </tr>
        </table>
        <table class="table">
            <tr>
                <td>Producto</td>
                <td>Cantidad</td>
                <td>Costo Unitario</td>
                <td>Alicuota</td>
                <td>Base Imponible</td>
                <td>IVA</td>
                <td>Total Producto</td>
            </tr>
            <?php $totalIva=0; $totalBase=0; $total=0;?>
            @foreach($ventas as $venta)
            <?php $cantidad = $venta->ven_cantidad;?>
            <tr>
                <td>{{$venta->rec_nombre}}</td>
                <td>{{$cantidad}}</td>          
                <td align="right">{{ number_format ( $venta->ven_costo , $decimals = 2 , "," , "." ) }}</td>
                <td>{{$venta->ven_iva}}%</td>
                <td align="right">{{ number_format ( $base = $venta->ven_costo*$cantidad , $decimals = 2 , "," , "." ) }}</td>
                <td align="right">{{ number_format ( $iva = $base*($venta->ven_iva/100) , $decimals = 2 , "," , "." ) }}</td>
                <td align="right">{{ number_format ( $base+$iva , $decimals = 2 , "," , "." ) }}</td>
                <?php $totalIva+=$iva; $totalBase+=$base; $total+=$base+$iva;?>
            </tr>
            @endforeach
            <tr class="success">
                <td><b>TOTALES</b></td>
                <td></td>
                <td></td>
                <td></td>
                <td align="right"><b>{{ number_format ( $totalBase , $decimals = 2 , "," , "." ) }}</b></td>
                <td align="right"><b>{{ number_format ( $totalIva , $decimals = 2 , "," , "." ) }}</b></td>             
                <td align="right"><b>{{ number_format ( $total , $decimals = 2 , "," , "." ) }}</b></td>
            </tr>
        </table>
     <script src="js/jquery.min.js"></script> 
     <script src="js/bootstrap.min.js"></script> 
    </body>
</html>