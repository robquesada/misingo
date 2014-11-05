$(function(){
  $('#image-selector').change(function(){
    if (this.files && this.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        localStorage.setItem('img', e.target.result);
        $('#image').attr('src', e.target.result).width(150).height(150);
      };
      $('#image').css('display','block');
      reader.readAsDataURL(this.files[0]);
    }
  });

  // pet-selectors, needs refactor
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
});
