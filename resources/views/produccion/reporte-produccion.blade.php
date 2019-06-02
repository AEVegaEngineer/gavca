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
            Producción de {!!$rec_nombre!!} de fecha {!!$req_fecha!!}
        </h3>
        <div class="row">                   
                 
            <?php 
            $req = $produccion->pro_mano_obra;
            $prod = $produccion->pro_produccion;
            ?>
            <div class="col-md-3 col-xs-12 form-inline">
                <label for="produccion">Producción: {{$prod}}    </label>   
                <?php 
                    if($produccion->pro_lote != null){ 
                        echo '<label>LOTE: ';
                        $numlength = strlen((string)$produccion->pro_lote);
                        for ($i=0; $i < 6-$numlength; $i++) { 
                            echo '0';
                        }
                        echo $produccion->pro_lote;
                        echo '</label>';
                    }
                ?>  
            </div>
        </div>
        <table class="table table-bordered">
            <tr>
                <td colspan = "3">INFORMACIÓN SEGÚN PARÁMETROS</td>         
                <td colspan = "2">REQUERIMIENTOS</td> 
                <td colspan = "2">COSTOS</td>
                <td>SOBRE <br>EL TOTAL</td>
            </tr>
            <tr>
                <td>Materia prima e insumos</td>
                <td>Unidad</td>
                <td>Costo</td>
                <td>Total</td>
                <td>Unitario</td>
                <td>Total</td>
                <td>Unitario</td>
                <td></td>
            </tr>
            <?php
            $costosTotales = 0;
            $costosUnit=0;
            $costoTotalObra = 0;
            $costoUnitObra = 0;
            $costoTotalMat = 0;
            $costoUnitMat = 0;
            $i=0;
            ?>
            <?php
            if($recetas->rec_proc != 'PA'){ 
                foreach($dependencias as $key => $dependencia)
                {
                    
                    $req_total = $dependencia->pro_produccion;
                    $req_unitario = $req_total/$prod;               
                    //$req_total = $produccion*$dependencia->requerimiento;
                    $costo = $costos[$key]->pro_costo;
                    $costo_total = $costo*$req_total;
                    //$req_unitario = $req_total/$produccion;
                    $costo_unitario = $costo*$req_unitario;
                    
                    $costosTotales+=$costo_total;
                    $costosUnit+=$costo_unitario;
                    
                }
            }
            foreach($parametros as $parametro) 
            {
                $costosTotales+=$parametro->par_costo*$parametro->req_total;
                $costosUnit+=$parametro->par_costo*($parametro->req_total/$prod);  
            }
            foreach ($insumosrequeridos as $insumorequerido) 
            {
                $costosTotales+=$insumorequerido->ins_costo*$insumorequerido->ins_req_total;
                $costosUnit+=$insumorequerido->ins_costo*($insumorequerido->ins_req_total/$prod);
            }
            ?>
            @foreach($salarios as $salario)
                <?php 
                $sal_cargado = $salario->sal_mensual; 
                $u_tributaria = $salario->unidad_tributaria;
                $salario_integral = $salario->salario_integral;
                ?>
            @endforeach
            @foreach($aumentos as $aumento)
                <?php 
                $aumento_escalar = ($aumento->aum_aumento * 0.01) + 1;
                $sal_cargado *= $aumento_escalar;
                ?>
            @endforeach     
            <?php
            $mano_de_obra = $sal_cargado;
            

            //CALCULO DE TOTALES
            $cos_tot_obra = $req*$salario_integral;
            $cos_unit_obra = $cos_tot_obra / $prod;
            
            $costoDirTotal = $costosTotales+$cos_tot_obra;
            $costoDirUnit = $costosUnit+$cos_unit_obra;

            if($produccion->pro_lote != null)
                $total_cf = $miscelaneo->std_x_frasco*$prod;
            else
                $total_cf = 0;
            $unit_cf = $total_cf/$prod;
            $total_unit = $costoDirUnit+$unit_cf;



            ?>


            <?php if($recetas->rec_proc != 'PA'){ ?>
            @foreach($dependencias as $key => $dependencia)
                <?php
                    $costosTotales = 0;
                    $costosUnit=0;
                    $req_total = $dependencia->pro_produccion;
                    $req_unitario = $req_total/$prod;               
                    //$req_total = $produccion*$dependencia->requerimiento;
                    $costo = $costos[$key]->pro_costo;
                    $costo_total = $costo*$req_total;
                    //$req_unitario = $req_total/$produccion;
                    $costo_unitario = $costo*$req_unitario;
                    
                    $costosTotales+=$costo_total;
                    $costosUnit+=$costo_unitario;
                ?>

                <tr>
                    <td>{{$dependencia->dep_hijo}}</td>
                    <td>{{$dependencia->rec_unidad}}</td>
                    <td align="right">{{bcdiv($costo, '1', 2)}}</td>        
                    <td>{{number_format($req_total,$decimals = 2 , "," , ".")}}</td>
                    <td>{{number_format($req_unitario,$decimals = 4 , "," , ".")}}</td>
                    <td align="right">{{number_format($costo_total,$decimals = 2 , "," , ".")}}</td>
                    <td align="right" id="unit-{{$i}}">{{number_format($costo_unitario,$decimals = 2 , "," , ".")}}</td>
                    <td id="over-{{$i}}">{{number_format($costo_unitario/$total_unit*100,$decimals = 2 , "," , ".")}}%</td>
                </tr>
                <?php $i++; ?>
                
            @endforeach
            <?php } ?>
            <?php
            function round_a($number, $precision = 2)
            {
                $fig = (int) str_pad('1', $precision, '0');
                return (floor($number * $fig) / $fig);
            }
            ?>
        

        @foreach($parametros as $parametro)         
            <?php
            
            $req_total = $parametro->req_total;
            $costo = $parametro->par_costo;
            $costo_total = $costo*$req_total;
            $req_unitario = round_a($req_total/$prod,5);

            $costo_unitario = $costo*$req_unitario;
            
            ?>
            <tr>
                <td>{{$parametro->par_nombre}}</td>
                <td>{{$parametro->par_unidad}}</td>         

                <td align="right">{{number_format($parametro->par_costo,$decimals = 2 , "," , ".")}}</td>
                <td>{{number_format($parametro->req_total,$decimals = 2 , "," , ".")}}</td>
                <td>{{number_format($req_unitario,$decimals = 2 , "," , ".")}}</td>
                <td align="right">{{number_format($costo_total,$decimals = 2 , "," , ".")}}</td>
                <td align="right" id="unit-{{$i}}">{{number_format($costo_unitario,$decimals = 2 , "," , ".")}}</td>
                <td id="over-{{$i}}" align="right">{{number_format($costo_unitario/$total_unit*100,$decimals = 2 , "," , ".")}}%</td>
                
            </tr>
        <?php 
            $costosTotales+=$parametro->par_costo*$parametro->req_total;
            $costosUnit+=$parametro->par_costo*($parametro->req_total/$prod);  
            $i++;
        ?>
        @endforeach
        @foreach($insumosrequeridos as $insumorequerido)            
            <?php
            
            $req_total = $insumorequerido->ins_req_total;
            $costo = $insumorequerido->ins_costo;
            $costo_total = $costo*$req_total;
            $req_unitario = round_a($req_total/$prod,5);
            $costo_unitario = $costo*$req_unitario;
            
            ?>
            <tr>
                <td>{{$insumorequerido->ins_nombre}}</td>
                <td>{{$insumorequerido->ins_unidad}}</td>           

                <td align="right">{{number_format($costo,$decimals = 2 , "," , ".")}}</td>
                <td>{{number_format($insumorequerido->ins_req_total,$decimals = 2 , "," , ".")}}</td>
                <td>{{number_format($req_unitario,$decimals = 2 , "," , ".")}}</td>
                <td align="right">{{number_format($costo_total,$decimals = 2 , "," , ".")}}</td>
                <td align="right" id="unit-{{$i}}">{{number_format($costo_unitario,$decimals = 2 , "," , ".")}}</td>
                <td id="over-{{$i}}" align="right">{{number_format($costo_unitario/$total_unit*100,$decimals = 2 , "," , ".")}}%</td>
                
            </tr>
        <?php   
            $costosTotales+=$insumorequerido->ins_costo*$insumorequerido->ins_req_total;
            $costosUnit+=$insumorequerido->ins_costo*($insumorequerido->ins_req_total/$prod);          
            $i++;
        ?>
        @endforeach
        
            <tr class="success">
                <td colspan = "5" align="right">TOTAL MATERIA PRIMA E INSUMOS</td>
                <td align="right">{{number_format($costosTotales,$decimals = 2 , "," , ".")}}</td> 
                <td align="right" id="totalMat">{{number_format($costosUnit,$decimals = 2 , "," , ".")}}</td> 
                <td id="matOver" align="right">{{number_format(($costosUnit/$total_unit)*100,$decimals = 2 , "," , ".")}}%</td>
            </tr>           
            <tr>
                <td>MANO DE OBRA</td>
                <td>JORNAL</td>

                <td align="right">{{number_format($salario_integral,$decimals = 2 , "," , ".")}}</td>
                <td>{{number_format($req,$decimals = 2 , "," , ".")}}</td>
                <td>{{number_format($req/$prod,$decimals = 4 , "," , ".")}}</td>
                <td align="right">{{number_format($cos_tot_obra,$decimals = 2 , "," , ".")}}</td>
                <td align="right">{{number_format($cos_unit_obra,$decimals = 2 , "," , ".")}}</td>
                <td align="right">{{number_format(($cos_unit_obra/$total_unit)*100,$decimals = 2 , "," , ".")}}%</td>
            </tr>
            <tr class="success">

                <td colspan = "5" align="right">TOTAL COSTOS DIRECTOS</td>
                <td align="right">{{number_format($costoDirTotal,$decimals = 2 , "," , ".")}}</td> 
                <td align="right">{{number_format($costoDirUnit,$decimals = 2 , "," , ".")}}</td> 
                <td align="right">{{number_format(($costoDirUnit/$total_unit)*100,$decimals = 2 , "," , ".")}}%</td>
            </tr>
            <!--CALCULOS PARA PROCESO B-->
            <?php if($produccion->pro_lote != null){ ?>
            <tr>
                <td>ESTANDAR DE COSTOS FIJOS POR UNIDAD PRODUCIDA</td>
                <td>STD UNITARIO</td>               
                <td align="right">{{number_format($miscelaneo->std_x_frasco,$decimals = 2 , "," , ".")}}</td>
                <td align="right">{{$prod}}</td>
                <td align="right">{{number_format(1,2)}}</td>
                <td align="right" id="total_cf">{{number_format($total_cf,$decimals = 2 , "," , ".")}}</td>
                <td align="right" id="unit_cf">{{number_format($unit_cf,$decimals = 2 , "," , ".")}}</td>
                <td align="left" id="over_cf">{{number_format(($unit_cf/$total_unit)*100,$decimals = 2 , "," , ".")}}%</td>
            </tr>
            <tr class="success">
                <td colspan = "5" align="right">TOTAL COSTOS DIRECTOS MÁS ESTÁNDAR DE COSTO FIJO</td>
                <td align="right">{{number_format($costoDirTotal+$total_cf,$decimals = 2 , "," , ".")}}</td> 
                <td align="right" id="total">{{number_format($total_unit,$decimals = 2 , "," , ".")}}</td> 
                <td id="totalOver">100%</td>
            </tr>
            <?php } ?>
            <input type="hidden" name="rec_nombre" id="rec_nombre" value="{{$rec_nombre}}">
            <input type="hidden" name="pro_fecha" id="pro_fecha" value="{{$req_fecha}}">
            <input type="hidden" name="_token" value="{{csrf_token()}}" id="token">
        </table>
     <script src="js/jquery.min.js"></script> 
     <script src="js/bootstrap.min.js"></script> 
    </body>
</html>