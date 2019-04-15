$(document).ready(function() {
	var total = 0;
	var iva = 0;
	//Ejecuta el script al cargar la pagina	
	chequeaNullOMayorADisponible();
	updateByCantidad();
	updateByCosto();
	function updateByCantidad()
	{
		$( 'input[name^=ven_cantidad]').each(function(index) {		
			$(this).keyup(function(){
				var cantidad = $(this).val();
				var costo = $('input[name^=ven_costo]').eq( index ).val();
				calcularYMostrarTotales();
			});
		});
	}
	function updateByCosto()
	{
		$( 'input[name^=ven_costo]').each(function(index) {		
			$(this).keyup(function(){				
				var cantidad = $('input[name^=ven_cantidad]').eq( index ).val();
				var costo = $(this).val();
				calcularYMostrarTotales();
			});
		});	
	}
	function calcularYMostrarTotales()
	{
		chequeaNullOMayorADisponible();
		calcularSuma();				
		$('#total').text(addCommas((total).toFixed(2)));
		iva = calcularIva(total);
		TotalMasIva(total);
	}
	function calcularSuma()
	{
		/*multiplica costo por cantidad y lo pone en columna de suma*/				
		total = 0;
		$( 'td[id^=suma]').each(function(index){
			var costo = $('input[name^=ven_costo]').eq( index ).val();
			var cantidad = $('input[name^=ven_cantidad]').eq( index ).val();
			total+=costo*cantidad;
			$('#suma'+index+'').html(addCommas((costo*cantidad).toFixed(2)));
		});
	}
	$('input[name^=iva]').keyup(function(){
		calcularIva(total);
		TotalMasIva(total);
	});
	function calcularIva(total){
		var iva = $('input[name^=iva]').val();
		iva = iva.replace("%", "");
		iva = iva/100;	
		$('#total-iva').text(addCommas((total*iva).toFixed(2)));
		return iva;
	}
	function TotalMasIva(total){

		var totalMasIva = parseFloat(total)+total*iva;
		$('#totMasIva').val(totalMasIva);
		totalMasIva = addCommas(totalMasIva.toFixed(2));
		$('#totalMasIva').text(totalMasIva);
	}	
	function addCommas(nStr)
	{
	    nStr += '';
	    x = nStr.split('.');
	    x1 = x[0];
	    x2 = x.length > 1 ? ',' + x[1] : '';
	    var rgx = /(\d+)(\d{3})/;
	    while (rgx.test(x1)) {
	        x1 = x1.replace(rgx, '$1' + '.' + '$2');
	    }
	    return x1 + x2;
	}
	function chequeaNullOMayorADisponible()
	{
		var flag;
		$( 'td[id^=ven_disponibilidad]' ).each(function(index) {
			var disponibilidad = parseInt($('#ven_disponibilidad'+index).html());
			var cantidad = $('input[name^=ven_cantidad]').eq( index ).val();
			var costo = $('input[name^=ven_costo]').eq( index ).val();
			//console.log("comparando cost: "+costo+" con cantidad: "+cantidad);
			if(cantidad < 0 || (disponibilidad > 0 && cantidad > disponibilidad) || (disponibilidad == 0 && cantidad > 0) || (costo == "" && cantidad > 0))
				flag = false;
			else if(flag != false && (disponibilidad >= cantidad ) && cantidad != "" && costo != "")
				flag = true;
		});	
		$(':input[type="submit"]').prop('disabled', !flag);			
	}
});	