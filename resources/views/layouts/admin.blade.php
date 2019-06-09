<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Administración Gavca</title>

    {!!Html::style('css/bootstrap.min.css')!!}
    {!!Html::style('css/metisMenu.min.css')!!}
    {!!Html::style('css/sb-admin-2.css')!!}
    {!!Html::style('css/font-awesome.min.css')!!}
    {!!Html::style('css/estilosPersonalizados.css')!!}

</head>

<body>

    <div id="wrapper">
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">Gavca - Administración</a>
            </div>
            <ul class="nav navbar-top-links navbar-right">
                 <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        {!!Auth::user()->name!!}<i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        
                        <li><a href="/usuario/{!!Auth::user()->id!!}/edit"><i class="fa fa-user fa-fw"></i> Perfil de Usuario</a>
                        </li>                       

                        <li class="divider"></li>
                        
                        <li><a href="/logout"><i class="fa fa-sign-out fa-fw"></i> Cerrar sesión</a>
                        </li>
                    </ul>
                </li>
            </ul>

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <?php if(Auth::user()->privilegio == 'admin'){ ?>
                        <li>
                            <a href="#"><i class="fa fa-users fa-fw"></i> Usuarios<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="{!!URL::to('/usuario/create')!!}"><i class='fa fa-plus fa-fw'></i> Registrar Usuario</a>
                                </li>
                                <li>
                                    <a href="{!!URL::to('/usuario')!!}"><i class='fa fa-list-ol fa-fw'></i> Ver Usuarios</a>
                                </li>
                            </ul>
                        </li>  
                        <?php } ?>
                        <li>
                            <a href="#"><i class="fa fa-list fa-fw"></i> Caja Banco<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="{!!URL::to('/caja')!!}"><i class='fa fa-list-ol fa-fw'></i> Ver Caja Banco</a>
                                </li>
                                <?php if(Auth::user()->privilegio == 'admin'){ ?>
                                <li>
                                    <a href="#"><i class="fa fa-building fa-fw"></i> Bancos<span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">   
                                        <li>
                                            <a href="{!!URL::to('/banco')!!}"><i class='fa fa-list fa-fw'></i> Ver Bancos</a>
                                        </li>  
                                        <li>
                                            <a href="{!!URL::to('/banco/create')!!}"><i class='fa fa-plus fa-fw'></i> Crear Nuevo Banco</a>
                                        </li>                             
                                    </ul>
                                </li>
                                <?php } ?>      
                            </ul>
                        </li> 
                        <li>
                            <a href="#"><i class="fa fa-list fa-fw"></i> Procesos Productivos<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="{!!URL::to('/receta')!!}"><i class='fa fa-list-ol fa-fw'></i> Ver Procesos Productivos</a>
                                </li>
                                <?php if(Auth::user()->privilegio == "admin"){?>
                                <li>
                                    <a href="{!!URL::to('/receta/create')!!}"><i class='fa fa-plus fa-fw'></i> Crear nuevo proceso</a>
                                </li> 
                                
                                <li>
                                    <a href="{!!URL::to('/receta/view_trash')!!}"><i class='fa fa-trash fa-fw'></i> Papelera de reciclaje de procesos</a>
                                </li>                             <?php } ?>                              
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-check-square fa-fw"></i> Proveedores<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="{!!URL::to('/proveedor')!!}"><i class='fa fa-list-ol fa-fw'></i> Ver proveedores</a>
                                </li>
                                <?php if(Auth::user()->privilegio == "admin" || Auth::user()->privilegio == "tipo1"){?>  
                                    <li>
                                        <a href="{!!URL::to('/proveedor/create')!!}"><i class='fa fa-plus fa-fw'></i> Crear nuevo proveedor</a>
                                    </li>                   
                                <?php } ?>
                            </ul>
                        </li> 
                        <li>
                            <a href="#"><i class="fa fa-check-square fa-fw"></i> Compras<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="{!!URL::to('/compra')!!}"><i class='fa fa-list-ol fa-fw'></i> Ver Compras</a>
                                </li>
                                <?php if(Auth::user()->privilegio == "admin" || Auth::user()->privilegio == "tipo1"){?> 
                                <li>
                                    <a href="{!!URL::to('/compra/create')!!}"><i class='fa fa-plus fa-fw'></i> Ingresar una nueva compra</a>
                                </li>
                                <?php } ?>                                                           
                            </ul>
                        </li> 
                        <li>
                            <a href="#"><i class="fa fa-lemon-o fa-fw"></i> Inventario<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="{!!URL::to('/materiaprima')!!}"><i class='fa fa-list-ol fa-fw'></i> Inventario de Materias Primas</a>
                                </li>   
                                <li>
                                    <a href="{!!URL::to('/InventarioPA')!!}"><i class='fa fa-list-ol fa-fw'></i> Inventario de Productos Semiprocesados</a>
                                </li>
                                <li>
                                    <a href="{!!URL::to('/InventarioPB')!!}"><i class='fa fa-list-ol fa-fw'></i> Inventario de Productos Terminados</a>
                                </li>
                                <li>
                                    <a href="{!!URL::to('/InventarioPC')!!}"><i class='fa fa-list-ol fa-fw'></i> Presentaciones </a>
                                </li>

                            </ul>
                        </li>                         
                        <li>
                            <a href="#"><i class="fa fa-cube fa-fw"></i> Producción<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="{!!URL::to('/produccion')!!}"><i class='fa fa-list-ol fa-fw'></i> Ver Producción</a>
                                </li>                               
                            </ul>
                        </li>  
                        <li>
                            <a href="#"><i class="fa fa-line-chart fa-fw"></i> Clientes<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="{!!URL::to('/cliente')!!}"><i class='fa fa-list-ol fa-fw'></i> Ver Clientes</a>
                                </li>
                                <?php if(Auth::user()->privilegio == "admin" || Auth::user()->privilegio == "tipo1"){?>
                                    <li>
                                        <a href="{!!URL::to('/cliente/create')!!}"><i class='fa fa-plus fa-fw'></i> Crear Nuevo Cliente</a>
                                    </li>   
                                <?php } ?> 
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-line-chart fa-fw"></i> Ventas<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="{!!URL::to('/venta')!!}"><i class='fa fa-list-ol fa-fw'></i> Ver Ventas</a>
                                </li>
                                <?php if(Auth::user()->privilegio == "admin" || Auth::user()->privilegio == "tipo1"){?>
                                <li>
                                    <a href="{!!URL::to('/venta/create')!!}"><i class='fa fa-plus fa-fw'></i> Crear Nueva Venta</a>
                                </li> 
                                <?php } ?>                                                                                              
                            </ul>
                        </li>    
                        
                        <li>
                            <a href="#"><i class="fa fa-cubes fa-fw"></i> Parámetros<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="{!!URL::to('/parametro')!!}"><i class='fa fa-list-ol fa-fw'></i> Ver Parámetros</a>
                                </li>
                                <?php if(Auth::user()->privilegio == "admin" || Auth::user()->privilegio == "tipo1"){?>
                                <li>
                                    <a href="{!!URL::to('/parametro/create')!!}"><i class='fa fa-plus fa-fw'></i> Crear nuevo parámetro</a>
                                </li> 
                                <?php } ?>                          
                            </ul>
                        </li>  
                        <li>
                            <a href="#"><i class="fa fa-cubes fa-fw"></i> Insumos<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="{!!URL::to('/insumo')!!}"><i class='fa fa-list-ol fa-fw'></i> Ver Insumos</a>
                                </li>
                                <?php if(Auth::user()->privilegio == "admin" || Auth::user()->privilegio == "tipo1"){?>
                                <li>
                                    <a href="{!!URL::to('/insumo/create')!!}"><i class='fa fa-plus fa-fw'></i> Crear nuevo Insumo</a>
                                </li> 
                                <?php } ?>                          
                            </ul>
                        </li>  
                        <li>
                            <a href="#"><i class="fa fa-cubes fa-fw"></i> Parámetros Calculados<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="{!!URL::to('/salario')!!}"><i class='fa fa-money fa-fw'></i> Salarios</a>
                                </li>
                                <!--
                                <li>
                                    <a href="{!!URL::to('/miscelaneo')!!}"><i class='fa fa-money fa-fw'></i> Misceláneos</a>
                                </li> 
                            -->
                                <li>
                                    <a href="{!!URL::to('/costofijo')!!}"><i class='fa fa-money fa-fw'></i> Estandar de costos fijos</a>
                                </li>                            
                            </ul>
                        </li> 
                        <?php if(Auth::user()->privilegio == 'admin'){ ?> 
                        <li>
                            <a href="#"><i class="fa fa-navicon fa-fw"></i> Opciones<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="{!!URL::to('/ajustes')!!}"><i class='fa fa-cog fa-spin fa-fw'></i> Ajustes</a>
                                </li>                                                           
                            </ul>
                        </li>            
                        <?php } ?> 
                    </ul>
                </div>
            </div>

     </nav>

        <div id="page-wrapper">
            @yield('content')
        </div>

    </div>
    

    {!!Html::script('js/jquery.min.js')!!}
    
    {!!Html::script('js/bootstrap.min.js')!!}
    {!!Html::script('js/metisMenu.min.js')!!}
    {!!Html::script('js/sb-admin-2.js')!!}

    @section('scripts')
    @show    
    <!--
    lo mismo que lo de arriba
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/metisMenu.min.js"></script>
    <script src="js/sb-admin-2.js"></script>
    -->
</body>

</html>
