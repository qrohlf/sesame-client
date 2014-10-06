
# beaglebone = require('./beaglebone')();
# door = require('./door')(beaglebone);

open_door = ->
  socket.emit "door-status", "opening"
  setTimeout (->
    socket.emit "door-status", "opened"
    return
  ), 5000
  return
close_door = ->
  socket.emit "door-status", "closing"
  setTimeout (->
    socket.emit "door-status", "closed"
    return
  ), 5000
  return
toggle_door = ->
  if Math.random() > 0.5
    open_door()
  else
    close_door()
  return
socket = require("socket.io-client")(process.env.SERVER_PATH or "http://localhost:3000")
socket.on "connect", ->
  console.log "connected!"
  return

socket.on "door-command", (cmd) ->
  console.log "door-command " + cmd + " recieved"
  switch cmd
    when "open"
      open_door()
    when "close"
      close_door()
    when "toggle"
      toggle_door()

socket.on "disconnect", ->
  console.log "disconnected!"
  return

socket.on "reconnect", ->
  console.log "reconnected!"
  return

socket.on "reconnecting", (num) ->
  console.log "attempting to reconnect"
  console.log "attempt number " + num
  return

