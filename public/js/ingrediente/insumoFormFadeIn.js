$(document).ready(function() {
	if ($('input[name=insing_default]').is(':checked')) {
	}else{
		$('.escondido-2').hide();
	}
	
	$('input[name=insing_default]').change(function(){
		if ($('input[name=insing_default]').is(':checked')) {
			$('.escondido-2').fadeIn( "slow" );
		}else{
			$('.escondido-2').fadeOut( "slow" );
		}
	});
});