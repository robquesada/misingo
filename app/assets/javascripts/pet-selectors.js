$(function() {
    $('#animal-type-selector').change(function(){
      $.get('/breed/'+ $('#animal-type-selector').val());
    });
});