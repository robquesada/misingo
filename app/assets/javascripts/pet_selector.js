var selectBreeds;
selectBreeds = function() {

  $('#animal_type_id').change(function(){
    changeBreeds();
  });
  
  changeBreeds = function() {
    $('#pet_breed_id > option').each(function() {
      if($(this).attr('data-animal-type') != $('#animal_type_id option:selected').val()){
        $(this).hide();
      }else{
        $(this).show();
        $('#pet_breed_id').val($(this).val());
      }
    });
  };

  changeBreeds();
};

$(document).ready(selectBreeds);
$(document).on('page:load', selectBreeds);
