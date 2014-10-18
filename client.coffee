dotenv = require('dotenv')
dotenv.load()
require 'coffee-script/register'
beaglebone = require('./beaglebone')
door = require('./door')(beaglebone)
socket = require("socket.io-client")("http://sesame-server.herokuapp.com")
socket.on "connect", ->
  console.log "connected!"
  return

socket.on "door-command", (cmd) ->
  console.log "door-command " + cmd + " recieved"
  switch cmd
    #when "open"
      #open_door()
    #when "close"
      #close_door()
    when "toggle"
      socket.emit "log", "toggling door"
      door.toggle()
      socket.emit "door status", "toggled"
  
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

