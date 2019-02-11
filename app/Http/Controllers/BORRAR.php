<?php
//produccion.store
//REVISO CUAL PRODUCCION SE ESTA LLEVANDO A CABO Y GUARDO ESE VALOR AL CREAR LA PRODUCCION
        $receta = receta::where('rec_nombre',$request['rec_nombre'])->first();

        $fecha = $request['pro_fecha'];
        $rec_nombre = $request['rec_nombre'];
        $pro_produccion = $request['pro_produccion'];
        $pro_mano_obra = $request['pro_mano_obra'];

        /*SE DEBE REVISAR SI HAY EXISTENCIA DE MATERIA PRIMA COMPRADA PARA CREAR LA PRODUCCION*/
        /*
        function checkIngredients(){
            $ingredientes = ingrediente::where('rec_nombre',$rec_nombre)->get();          
            foreach ($ingredientes as $ingrediente) {
                $existencia;

                if(1){}
            }
        }

        if($receta->rec_proc == "PA"){

        }
        */

        /*
        REVISO CUALES SON LAS DEPENDENCIAS DE LA RECETA A CREAR Y CUALES SON LAS RECETAS HIJAS DE ESTA, SI HAY EXISTENCIA DE LAS RECETAS HIJAS SE PUEDE CREAR LA RECETA SI NO, NO.
        */
        if($receta->rec_proc != "PA"){
            $dependencias = dependencia::where('dep_padre',$rec_nombre)->get();
            foreach ($dependencias as $dependencia) {
                $existencia;
                if($receta->rec_proc == "PB"){
                    $existencia = producciona::where('rec_nombre',$dependencia->dep_hijo)->first()->pro_produccion;     
                }else if($receta->rec_proc == "PC") {
                    $existencia = produccionb::where('rec_nombre',$dependencia->dep_hijo)->first()->pro_produccion; 
                }      
                if($existencia === null)
                    $existencia = 0;
                $requiere = $pro_produccion;
                //return $existencia."-".$requiere;
                if($requiere>$existencia){
                    //return "requiere(".$requiere.") > existencia(".$existencia.")";
                    return redirect('produccion/'.$rec_nombre.'/create')->with('message', 'No hay suficiente '.$dependencia->dep_hijo.' para crear esta cantidad de producción!');                
                }else{
                    //return "requiere(".$requiere.") < existencia(".$existencia.")";
                    //RESTO LO QUE SE UTILIZÓ DEL PRODUCTO DE LA EXISTENCIA
                    $etapa_hijo;
                    if($receta->rec_proc == "PB"){
                        producciona::where('rec_nombre',$dependencia->dep_hijo)
                        ->update(['pro_produccion' => $existencia-$requiere]);
                        $etapa_hijo = "PA";
                    }else if($receta->rec_proc == "PC"){
                        produccionb::where('rec_nombre',$dependencia->dep_hijo)
                        ->update(['pro_produccion' => $existencia-$requiere]);
                        $etapa_hijo = "PB";
                    }
                    //CREO EL LOG DE CARDEX DE PRODUCCION PARA EL CAMBIO EN EL DEP_HIJO
                    
                    $prod = produccion::where('rec_nombre',$dependencia->dep_hijo)
                        ->orderBy('pro_fecha', 'desc')
                        ->first();
                    $man_obr = $prod->pro_mano_obra;
                    $costo = $prod->pro_costo;
                    produccion::create([
                        'pro_fecha' => $fecha,
                        'rec_nombre' => $dependencia->dep_hijo,
                        'pro_etapa' => $etapa_hijo,
                        'pro_produccion' => $existencia-$requiere,
                        'pro_mano_obra' => $man_obr,
                        'pro_costo' => $costo,
                    ]);                    
                }
            }
        }

        // ACTUALIZO EL VALOR DE DEP_PRODUCCION EN DEPENDENCIAS EL CUAL
        // HACE REFERENCIA AL PRODUCTO, CON EL FIN DE SACAR DE AHI EL COSTO DEL 
        // PRODUCTO
        if(isset($request['dep_produccion'])){
            foreach ($request['dep_produccion'] as $dep_produccion => $valor) {
                $input = explode("_", $valor);            
                dependencia::where('dep_hijo',$input[1])
                ->update(['dep_produccion' => $input[0]]);
            }
        }
        
        /*SECCION PARA CREAR O ACTUALIZAR EL INVENTARIO DE PRODUCCION*/
        if($receta->rec_proc == "PA"){
            $producciona = producciona::where('rec_nombre',$rec_nombre)->first();
            if($producciona === null){
                producciona::create([
                    'rec_nombre' => $rec_nombre,
                    'pro_produccion' => $pro_produccion,
                ]);
            }else{
                producciona::where('rec_nombre',$rec_nombre)              
                    ->update(['pro_produccion' => $producciona->pro_produccion+$pro_produccion]);
            }
            
        }else if($receta->rec_proc == "PB"){
            $produccionb = produccionb::where('rec_nombre',$rec_nombre)->first();
            if($produccionb === null){
                produccionb::create([
                    'rec_nombre' => $rec_nombre,
                    'pro_produccion' => $pro_produccion,
                ]);
            }else{
                produccionb::where('rec_nombre',$rec_nombre)              
                    ->update(['pro_produccion' => $produccionb->pro_produccion+$pro_produccion]);
            }

        }else if($receta->rec_proc == "PC"){
            $produccionc = produccionc::where('rec_nombre',$rec_nombre)->first();
            if($produccionc === null){
                produccionc::create([
                    'rec_nombre' => $rec_nombre,
                    'pro_produccion' => $pro_produccion,
                ]);
            }else{
                produccionc::where('rec_nombre',$rec_nombre)              
                    ->update(['pro_produccion' => $produccionc->pro_produccion+$pro_produccion]);
            }
        }
        /*FIN DE SECCION PARA CREAR O ACTUALIZAR EL INVENTARIO DE PRODUCCION*/

        //return $receta->rec_proc;
        $producciones = produccion::where('pro_fecha',$fecha)->where('rec_nombre',$rec_nombre)->first();
        if($producciones === null){
            produccion::create([
                'pro_fecha' => $fecha,
                'rec_nombre' => $rec_nombre,
                'pro_etapa' => $receta->rec_proc,
                'pro_produccion' => $pro_produccion,
                'pro_mano_obra' => $pro_mano_obra,
            ]);
        }
        
        /*

        Obtengo todos los ingredientes que pertenezcan a esta receta y creo sus campos de requerimientos, lo que significa que la fecha del requerimiento sera la misma fecha que la de la producción.
        */
        $requerimientos = requerimiento::where('req_fecha',$fecha)->where('rec_nombre',$rec_nombre)->first();
        $ingredientes = ingrediente::where('rec_nombre',$rec_nombre)->get();

        foreach ($ingredientes as $ingrediente) {            
            $par = parametro::where('par_nombre',$ingrediente->ing_ingrediente)->first();
            if($ingrediente->rec_nombre == $rec_nombre && $requerimientos === null){
                //return $par."<br>".$requerimientos."<br>".$rec_nombre;
                requerimiento::create([
                    'req_fecha' => $fecha,
                    'rec_nombre' => $rec_nombre,
                    'req_ingrediente' => $ingrediente->ing_ingrediente,
                    'req_default' => $par->par_default,
                    ]);
            }
        }

        /*
        Paso las dependencias de este padre como requerimientos para obtener el valor y expresarlo en la hoja de datos para los calculos.
        */
        $dependencias = dependencia::where('dep_padre',$rec_nombre)->get();
        //return $rec_nombre;
        
        //MUESTRA EL FORMULARIO PARA LA EDICION DE LOS REQUERIMIENTOS DE LOS INGREDIENTES
        $produccion = produccion::where('rec_nombre',$rec_nombre)->first();
        $cantidad_produccion = $produccion->pro_produccion;
        $requerimientos = requerimiento::where('rec_nombre',$rec_nombre)->where('req_fecha',$fecha)->get();        
        //return $cantidad_produccion;
        return view('produccion.req',compact('rec_nombre','fecha','requerimientos','produccion','dependencias','cantidad_produccion'));

        ?>