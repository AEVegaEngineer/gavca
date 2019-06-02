$(document).ready(function() {
	if ($('input[name=par_default]').is(':checked')) {
	}else{
		$('.escondido').hide();
	}
	
	$('input[name=par_default]').change(function(){
		if ($('input[name=par_default]').is(':checked')) {
			$('.escondido').fadeIn( "slow" );
		}else{
			$('.escondido').fadeOut( "slow" );
		}
	});
});