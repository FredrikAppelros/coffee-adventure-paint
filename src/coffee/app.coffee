canvas = document.getElementById 'canvas'
size = document.getElementById 'size'
clear = document.getElementById 'clear'
colors = document.getElementsByClassName 'color'

ctx = canvas.getContext '2d'
ctx.lineCap = 'round'
ctx.lineJoin = 'round'
ctx.fillStyle = 'white'

updateBrush = ->
  selected = document.getElementsByClassName('selected')[0]
  color = window.getComputedStyle(selected).backgroundColor

  ctx.lineWidth = size.value
  ctx.strokeStyle = color

onMouseDown = (event) ->
  ctx.beginPath()
  ctx.moveTo event.layerX, event.layerY
  ctx.stroke()

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

onColorClick = (event) ->
  c.classList.remove 'selected' for c in colors
  event.target.classList.add 'selected'
  updateBrush()

onClearClick = ->
  ctx.fillRect 0, 0, canvas.width, canvas.height

updateBrush()

canvas.addEventListener 'mousedown', onMouseDown
size.addEventListener 'change', updateBrush
clear.addEventListener 'click', onClearClick
c.addEventListener 'click', onColorClick for c in colors
