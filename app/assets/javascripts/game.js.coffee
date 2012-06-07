# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

if window.DeviceMotionEvent != undefined
  window.ondevicemotion = (e) ->
    ax = event.accelerationIncludingGravity.x * 5
    ay = event.accelerationIncludingGravity.y * 5
    document.getElementById("accelerationX").innerHTML = e.accelerationIncludingGravity.x
    document.getElementById("accelerationY").innerHTML = e.accelerationIncludingGravity.y
    document.getElementById("accelerationZ").innerHTML = e.accelerationIncludingGravity.z

    if e.rotationRate
      document.getElementById("rotationAlpha").innerHTML = e.rotationRate.alpha
      document.getElementById("rotationBeta").innerHTML = e.rotationRate.beta
      document.getElementById("rotationGamma").innerHTML = e.rotationRate.gamma

  setInterval ->
    landscapeOrientation = window.innerWidth / window.innerHeight > 1
    if landscapeOrientation
      vx = vx+ay
      vy = vy+ax
    else
      vy = vy - ay
      vx = vx + ax
    vx = vx * 0.98
    vy = vy * 0.98
    y = parseInt(y+vy/50)
    x = parseInt(x+vx/50)
    boundingBoxCheck()
    sphere.style.top = y + "px"
    sphere.style.left = x + "px"
  , 25

boundingBoxCheck ->
  if x < 0
    x = 0
    vx = -vx
  if y < 0
    y = 0
    vx = -vy
  if x > document.documentElement.clientWidth - 20
    x = document.documentElement.clientWidth - 20
    vx = -vx
  if y > document.documentElement.clientHeight - 20
    y = document.documentElement.clientHeight - 20
    vy = -vy
