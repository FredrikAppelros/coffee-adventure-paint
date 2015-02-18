canvas = document.getElementById 'canvas'
size = document.getElementById 'size'
clear = document.getElementById 'clear'
colors = document.getElementsByClassName 'color'

ctx = canvas.getContext '2d'
ctx.lineCap = 'round'
ctx.lineJoin = 'round'

onMouseDown = (event) ->
  # We should probably do something here

  canvas.addEventListener 'mousemove', onMouseMove
  canvas.addEventListener 'mouseup', onMouseUp
  canvas.removeEventListener 'mousedown', onMouseDown

onMouseMove = (event) ->
  # This might be a good place to do stuff

onMouseUp = (event) ->
  canvas.addEventListener 'mousedown', onMouseDown
  canvas.removeEventListener 'mousemove', onMouseMove
  canvas.removeEventListener 'mouseup', onMouseUp

updateSize = ->
  # Hmmm, shouldn't I be doing something here?

updateColor = (element) ->
  color = window.getComputedStyle(element).backgroundColor
  # Hey, did I forget to do something?

onClearClick = ->
  # This place seems empty

onColorClick = (event) ->
  c.classList.remove 'selected' for c in colors
  event.target.classList.add 'selected'
  updateColor event.target

updateSize()
updateColor document.getElementsByClassName('selected')[0]

canvas.addEventListener 'mousedown', onMouseDown
size.addEventListener 'change', updateSize
clear.addEventListener 'click', onClearClick
c.addEventListener 'click', onColorClick for c in colors
