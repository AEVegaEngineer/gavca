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
        <h3>Reporte de {{$caja}} de fecha {{$records[0]->cb_fecha}}</h3>
        <table class="table table-bordered">
            <tr>             
                <td>Concepto</td>
                <td>Entra</td>              
                <td>Sale</td>
                <td>Saldo</td>
            </tr>
            <?php $t_sale = 0; $t_entra = 0; $t_saldo = 0; ?>
            @foreach($records as $record)
            <tr>
                <td>{{$record->cb_concepto}}</td>
                <?php 
                //sobreescribo el saldo xq me interesa el ultimo valor q se escriba
                $t_saldo = $record->cb_saldo;
                if($record->cb_debe_haber == "DEBE"){
                    $t_entra += $record->cb_monto;
                    echo '<td>'.$record->cb_monto.'</td><td></td>';
                }else if($record->cb_debe_haber == "HABER"){
                    $t_sale += $record->cb_monto;
                    echo '<td></td><td>'.$record->cb_monto.'</td>';
                }
                ?>
                <td>{{$record->cb_saldo}}</td>              
            </tr>
            @endforeach 
            <tr>
                <td><b>TOTAL</b></td>
                <td><b>{{$t_entra}}</b></td>
                <td><b>{{$t_sale}}</b></td>
                <td><b>{{$t_saldo}}</b></td>
            </tr>
        </table>
     <script src="js/jquery.min.js"></script> 
     <script src="js/bootstrap.min.js"></script> 
    </body>
</html>