ready = ->
  $calendar = $('.show_calendar')
  $icon = $('.icon')
  $text = $('.text')
  $calendar.datepicker();
  $text.hide()
  $icon.each (item, ele) =>
    element = $text[item]
    $(ele).mouseenter ->
      $(element).toggle( "slide")

    $(ele).mouseleave ->
      $(element).toggle( "slide")

$(document).ready(ready)
$(document).on('page:load', ready)
