changeBreeds = ->
  $('#pet_breed_id > option').each ->
    $this = $(this)

    if $this.attr('data-animal-type') != $('#animal_type_id option:selected').val()
      $this.hide()
    else
      $this.show()
      $('#pet_breed_id').val($this.val())

$ ->
  $('#animal_type_id').change ->
    changeBreeds()
