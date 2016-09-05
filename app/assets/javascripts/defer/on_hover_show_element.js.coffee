$ ->
  $(".js--onHoverShowElement").mouseover ->
    $this = $(this)
    $hoverElement = $this.find($this.data("element"))
    $unavailable = $this.data("unavailable")
    $hoverElement.removeClass("hidden") if !$unavailable

  $(".js--onHoverShowElement").mouseout ->
    $this = $(this)
    $hoverElement = $this.find($this.data("element"))
    $hoverElement.addClass("hidden")
