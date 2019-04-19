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
        Reporte de Compras para el mes de {{$mes_long}} del año {{$fecha_format->year}}</h3>
        <table class="table table-bordered">
            <tr>
                <td>Fecha de Compra</td>
                <td>Documento de factura</td>   
                <td>Código del Proveedor</td>
                <td>Tipo</td>
                <td>Entidad</td>                
                <td>Monto</td>
            </tr>
            <?php $total_compras = 0;?>
            @foreach($compras as $compra)
            <tr>
                <td>{{date("Y/m/d", strtotime($compra->comp_fecha))}}</td>
                <td>{{$compra->comp_doc}}</td>
                <td>{{$compra->comp_proveedor}}</td>
                <td>{{$compra->comp_cred_cont}}</td>
                <td>{{$compra->comp_entidad}}</td>                  
                <td align="right">{{ number_format ( $compra->comp_monto , $decimals = 2 , "," , "." ) }}</td>           
            </tr>
            <?php $total_compras+=$compra->comp_monto;?>
            @endforeach 
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><b>TOTAL</b></td>
                <td align="right"><b><?php echo number_format ( $total_compras , $decimals = 2 , "," , "." ); ?></b></td>                
            </tr>
        </table>
     <script src="js/jquery.min.js"></script> 
     <script src="js/bootstrap.min.js"></script> 
    </body>
</html>