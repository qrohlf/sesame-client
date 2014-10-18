HIGH = true
LOW = false

class BeagleBone
  constructor: ->
    @board = require('bonescript')
    @GARAGE_DOOR_PIN = 'P8_13'
    @board.pinMode(@GARAGE_DOOR_PIN, 'out');
    @state = false;

  toggleGarageDoor: ->
    #@state = !@state
    #@board.digitalWrite(@GARAGE_DOOR_PIN, @state)
    this.pingPin(@GARAGE_DOOR_PIN)

  pingPin: (pin, state = HIGH) ->
    @board.digitalWrite(pin, state)
    flip = => @board.digitalWrite(pin, !state)
    setTimeout(flip, 2000)

  readGarageDoorStatus: ->
    return false #not yet implemented

module.exports = new BeagleBone