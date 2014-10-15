$(function() {
    $('#animal-type-selector').change(function(){
        if( $('#animal-type-selector').val() == 1 ) {      
            $("#breed-cat").hide();
            $("#breed-dog").show();  
        } else {         
            $("#breed-dog").hide();
            $("#breed-cat").show();
        }
    });
});