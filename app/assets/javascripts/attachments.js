/*window.PetProject = window.PetProject || {}
PetProject.Attachment = PetProject.Attachment || {}

(function(Attachment){
    var New = function(args){
        this.imageSelector = args['imageSelector'];
    };

    Attachment.New = New;

    New.prototype.bind = function(){
        this.imageSelector.change(function(){
            this.displayImage();
        });
    };
    
    New.prototype.displayImage = function(){
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
              localStorage.setItem('img', e.target.result);
                $('#image').attr('src', e.target.result).width(100).height(100);
            };
            $('#image').css('display','block');
            reader.readAsDataURL(this.files[0]);
        }   
    };
    
}(PetProject.Attachment));*/

$('.image-selector').change(function(){
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

$('.animal-type-selector').change(function(){
    //alert("");
    $('#breed-selector').replaceWith('<%= escape_javascript(collection_select(:pet, :id_animal_type, AnimalType.all, :id, :name})) %>');
});