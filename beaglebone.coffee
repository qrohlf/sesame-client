class BeagleBone
  constructor: ->
    @board = require('bonescript')

  toggleGarageDoor: ->
    pingPin(GARAGE_DOOR_PIN)

  pingPin: (pin, state = HIGH) ->
    @board.digitalWrite(pin, state)
    flip = -> board.digitalWrite(pin, !state)
    setTimeout(flip, 100)

  readGarageDoorStatus: ->
    return false #not yet implemented

module.exports = BeagleBone