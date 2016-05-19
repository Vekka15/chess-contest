$ ->
  $icon = $('.icon')
  $text = $('.text')
  $text.hide()
  $icon.each (item, ele) =>
    element = $text[item]
    $(ele).mouseenter ->
      $(element).toggle( "slide" )

    $(ele).mouseleave ->
      $(element).toggle( "slide" )
