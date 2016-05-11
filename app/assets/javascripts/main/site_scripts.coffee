$(window).on "load resize", ->
  topOffset = 52
  width = if @window.innerWidth > 0 then @window.innerWidth else @screen.width
  if width < 768
    $('div.navbar-collapse').addClass 'collapse'
    topOffset = 100
    # 2-row-menu
  else
    $('div.navbar-collapse').removeClass 'collapse'
  height = (if @window.innerHeight > 0 then @window.innerHeight else @screen.height) - 1
  height = height - topOffset
  if height < 1
    height = 1
  if height > topOffset
    $('#page-content').css 'min-height', height + 'px'
