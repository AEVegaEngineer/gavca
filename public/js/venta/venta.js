$(document).ready(function() {
	//Ejecuta el script al cargar la pagina	
	
	$( 'input[name^=ven_cantidad]' ).each(function(index) {		
		$(this).keyup(function(){
			var total = 0;
			/*multiplica costo por cantidad y lo pone en columna de suma*/
			var cantidad = $(this).val();
			var costo = $('#ven_costo'+index+'').val();
			$('#suma'+index+'').html(cantidad*costo);
			/*totalizando*/
			
			$( 'td[id^=suma]' ).each(function() {
				total += parseFloat($(this).html());
			});
			$('#total').text(total);
			calcularIva();
			TotalMasIva();
		});
	});	
	$('input[name^=iva]').keyup(function(){
		calcularIva();
		TotalMasIva();
	});
	function calcularIva(){
		var iva = $('input[name^=iva]').val();
		iva = iva.replace("%", "");
		iva = iva/100;	
		var total = $('#total').text();
		$('#total-iva').text((total*iva).toFixed(2));
		TotalMasIva();
	}
	function TotalMasIva(){
		var total = $('#total').text();
		var totalIva = $('#total-iva').text();
		var totalMasIva = parseFloat(total)+parseFloat(totalIva);
		$('#totMasIva').val(totalMasIva);
		totalMasIva = addCommas(totalMasIva.toFixed(2));
		$('#totalMasIva').text(totalMasIva);
	}	
	function addCommas(nStr)
	{
	    nStr += '';
	    x = nStr.split('.');
	    x1 = x[0];
	    x2 = x.length > 1 ? '.' + x[1] : '';
	    var rgx = /(\d+)(\d{3})/;
	    while (rgx.test(x1)) {
	        x1 = x1.replace(rgx, '$1' + ',' + '$2');
	    }
	    return x1 + x2;
	}
});	