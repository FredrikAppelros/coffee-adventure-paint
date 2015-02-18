canvas = document.getElementById 'canvas'
size = document.getElementById 'size'
clear = document.getElementById 'clear'
colors = document.getElementsByClassName 'color'

ctx = canvas.getContext '2d'
ctx.lineCap = 'round'
ctx.lineJoin = 'round'

onMouseDown = (event) ->
  ctx.beginPath()
  ctx.moveTo event.layerX, event.layerY

  canvas.addEventListener 'mousemove', onMouseMove
  canvas.addEventListener 'mouseup', onMouseUp
  canvas.removeEventListener 'mousedown', onMouseDown

onMouseMove = (event) ->
  ctx.lineTo event.layerX, event.layerY
  ctx.stroke()

onMouseUp = (event) ->
  canvas.addEventListener 'mousedown', onMouseDown
  canvas.removeEventListener 'mousemove', onMouseMove
  canvas.removeEventListener 'mouseup', onMouseUp

updateSize = ->
  ctx.lineWidth = size.value

updateColor = (element) ->
  color = window.getComputedStyle(element).backgroundColor
  ctx.strokeStyle = color

onClearClick = ->
  ctx.clearRect 0, 0, canvas.width, canvas.height

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
