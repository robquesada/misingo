$ ->
  $(".js--onHoverShowElement").mouseover ->
    $this = $(this)
    $hoverElement = $this.find($this.data("element"))
    $hoverElement.removeClass("hidden")

    $hoverElement.on 'click', ->
      $(@).addClass("hidden")

  $(".js--onHoverShowElement").mouseout ->
    $this = $(this)
    $hoverElement = $this.find($this.data("element"))
    $hoverElement.addClass("hidden")
