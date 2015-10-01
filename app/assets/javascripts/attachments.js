var showPreview;
showPreview = function() {
  $('#image-selector').change(function(){
    if (this.files && this.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        localStorage.setItem('img', e.target.result);
        $('#image').attr('src', e.target.result).width('auto').height(150);
      };
      $('#image').css('display','block');
      reader.readAsDataURL(this.files[0]);
    }
  });
};

$(document).ready(showPreview);
$(document).on('page:load', showPreview);
