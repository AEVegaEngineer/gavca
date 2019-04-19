<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', 'FrontController@index');

Route::resource('usuario','UsuarioController');

Route::get('/trash/{id}',[
    'as' => 'receta.trash',
    'uses' => 'recetaController@trash'
]);
Route::resource('receta/view_trash', 'recetaController@view_trash');
Route::resource('receta','recetaController');

post('/getIngrediente', 'IngredienteController@getIngrediente');
post('/addIngrediente', 'IngredienteController@addIngrediente');
post('/addProduct', 'IngredienteController@addProduct');
Route::resource('ingrediente','IngredienteController');

Route::resource('log','LogController');

Route::get('admin', 'FrontController@admin');

Route::get('logout', 'LogController@logout');


post('/getParam', 'ParametroController@getParam');
Route::resource('parametro','ParametroController');

post('/storeSalario', 'SalarioController@storeSalario');
Route::resource('salario','SalarioController');

post('/getProveedor', 'ProveedorController@getProveedor');
post('/searchProveedor', 'ProveedorController@searchProveedor');
post('/storeProveedor', 'ProveedorController@storeProveedor');
Route::resource('proveedor','ProveedorController');

Route::get('/compra/trash/{id}',[
    'as' => 'compra.trash',
    'uses' => 'CompraController@trash'
]);
Route::resource('compra/view_trash', 'CompraController@view_trash');
Route::post('/compra/pass',[
    'as' => 'compra.pass',
    'uses' => 'CompraController@pass'
]);
Route::get('/compra/reporte/{factura_o_mensual}/{fecha?}/{factura?}',[
    'as' => 'compra.reporte',
    'uses' => 'CompraController@reporte'
]);

post('/checkCode', 'CompraController@checkCode');
post('/createParam', 'CompraController@createParam');
Route::resource('compra','CompraController');

post('/createMP', 'MateriaPrimaController@createMP');
Route::resource('materiaprima/insert', 'MateriaPrimaController@insert');
/*
Route::get('/materiaprima/reporte/{fecha_caja}',[
    'as' => 'materiaprima.reporte',
    'uses' => 'MateriaPrimaController@reporte'
]);
*/
Route::resource('materiaprima', 'MateriaPrimaController');

/*
Route::get('/listCardexMP', 'CardexMPController@listCardexMP');
Route::get('/listCardexPA', 'CardexMPController@listCardexPA');
Route::get('/listCardexPB', 'CardexMPController@listCardexPB');
Route::get('/listCardexPC', 'CardexMPController@listCardexPC');
*/
Route::resource('cardexMP', 'CardexMPController');
Route::get('/cardex/reporte/{fecha}/{item}',[
    'as' => 'cardexmp.reporte',
    'uses' => 'CardexMPController@reporte'
]);


Route::get('/InventarioPA', 'InventarioController@InventarioPA');
Route::get('/InventarioPB', 'InventarioController@InventarioPB');
Route::get('/InventarioPC', 'InventarioController@InventarioPC');

Route::get('/inventario/reporte/{fecha_caja}/{inventario}',[
    'as' => 'inventario.reporte',
    'uses' => 'InventarioController@reporte'
]);

post('/guardarCostos', 'ProduccionController@guardarCostos');

Route::resource('produccion/{prod}/insert', 'ProduccionController@insert');
Route::post('adjust',[
    'as' => 'produccion.adjust',
    'uses' => 'ProduccionController@adjust'
]);
Route::get('produccion/{id}/create', 'ProduccionController@createProd');
Route::post('pass',[
    'as' => 'produccion.pass',
    'uses' => 'ProduccionController@pass'
]);
post('/reqDepUpd', 'ProduccionController@reqDepUpd');
post('/reqUpd', 'ProduccionController@req_upd');
post('/checkDep', 'ProduccionController@checkDep');
post('/storeProd', 'ProduccionController@storeProd');
Route::get('/verProduccion/{id}', 'ProduccionController@verProduccion');
Route::resource('produccion','ProduccionController');


post('/addDependencia', 'DependenciaController@addDependencia');
Route::resource('dependencia','DependenciaController');

Route::resource('aumento','AumentoController');

Route::resource('miscelaneo','MiscelaneoController');

Route::resource('costofijo','CostoFijoController');

Route::resource('produccionmes','ProduccionmesController');

Route::get('cuentaxpagar/view/{id}',[
    'as' => 'cuentaxpagar.view',
    'uses' => 'CtaxPagarController@view'
]);
Route::resource('cuentaxpagar','CtaxPagarController');

Route::get('cuentaxcobrar/view/{id}',[
    'as' => 'cuentaxcobrar.view',
    'uses' => 'CtaxCobrarController@view'
]);
Route::resource('cuentaxcobrar','CtaxCobrarController');

Route::post('caja/abrir',[
    'as' => 'caja.abrir',
    'uses' => 'CajaBancoController@abrir'
]);
Route::get('caja/volverfecha/{entidad}',[
    'as' => 'caja.volverfecha',
    'uses' => 'CajaBancoController@volverfecha'
]);
Route::get('caja/cerrar/{entidad}/{fecha}', [
	'as' => 'caja.cerrarcaja',
	'uses' => 'CajaBancoController@cerrarcaja'
]);
Route::get('caja/confirmar/{entidad}/{fecha}', [
	'as' => 'caja.confirmarcierre',
	'uses' => 'CajaBancoController@confirmarcierre'
]);
Route::get('caja/cierre/{entidad}/{fecha}', [
	'as' => 'caja.vercierre',
	'uses' => 'CajaBancoController@vercierre'
]);
Route::get('caja/reporte/{entidad}/{fecha}', [
	'as' => 'caja.reporte',
	'uses' => 'CajaBancoController@reporte'
]);
Route::get('caja/transferir/{entidad}/{fecha}', [
    'as' => 'caja.transferir',
    'uses' => 'CajaBancoController@transferir'
]);
Route::post('maketransfer',[
    'as' => 'caja.maketransfer',
    'uses' => 'CajaBancoController@maketransfer'
]);
Route::get('caja/entradaForm/{entidad}/{fecha}', [
    'as' => 'caja.entradaForm',
    'uses' => 'CajaBancoController@entradaForm'
]);
Route::get('caja/salidaForm/{entidad}/{fecha}', [
    'as' => 'caja.salidaForm',
    'uses' => 'CajaBancoController@salidaForm'
]);
Route::post('caja/generarEntrada', [
    'as' => 'caja.generarEntrada',
    'uses' => 'CajaBancoController@generarEntrada'
]);
Route::post('caja/generarSalida', [
    'as' => 'caja.generarSalida',
    'uses' => 'CajaBancoController@generarSalida'
]);
Route::resource('caja','CajaBancoController');
post('/getDisponible', 'CajaBancoController@getDisponible');
Route::post('venta/facturar', [
    'as' => 'venta.facturar',
    'uses' => 'VentaController@facturar'
]);
Route::get('venta/revertir/{factura}', [
    'as' => 'venta.revertir',
    'uses' => 'VentaController@revertir'
]);
Route::get('/venta/reporte/{factura_o_mensual}/{atributo}',[
    'as' => 'venta.reporte',
    'uses' => 'VentaController@reporte'
]);
Route::resource('venta','VentaController');

Route::resource('cliente','ClienteController');

Route::resource('banco','BancoController');

Route::post('ajustes/reiniciar-base-de-datos', [
    'as' => 'ajustes.reiniciarDB',
    'uses' => 'AjusteController@reiniciarDB'
]);
Route::post('ajustes/iniciar', [
    'as' => 'ajustes.iniciar',
    'uses' => 'AjusteController@iniciar'
]);
Route::get('ajustes/inventario/{target}/{id}', [
    'as' => 'ajustes.inventario',
    'uses' => 'AjusteController@inventario'
]);
Route::post('ajustes/setinventario', [
    'as' => 'ajustes.setinventario',
    'uses' => 'AjusteController@setinventario'
]);
Route::resource('ajustes','AjusteController');
