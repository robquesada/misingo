$ ->
  $('#image-selector').change ->
    if this.files && this.files[0]
      reader = new FileReader()
      reader.onload = (e) ->
        localStorage.setItem('img', e.target.result)
        $('#image').attr('src', e.target.result).width(150).height(150)

      $('#image').css('display','block')
      reader.readAsDataURL(this.files[0])
