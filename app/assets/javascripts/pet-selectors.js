var selectBreeds;
selectBreeds = function() {
  $('#animal_type_id').change(function(){
    $('#pet_breed_id > option').each(function() {
      if($(this).attr('data-animal-type') != $('#animal_type_id option:selected').val()){
        $(this).hide();
      }else{
        $(this).show();
        $('#pet_breed_id').val($(this).val());
      }
    });
  });  
};

$(document).ready(selectBreeds);
$(document).on('page:load', selectBreeds);
