class Door
  constructor: (@beaglebone) ->

  open: ->
    toggle() unless status() == 'open'

  close: ->
    toggle() unless status() == 'closed'

  toggle: ->
    @beaglebone.toggleGarageDoor()

  status: ->
    return @beaglebone.readGarageDoorStatus()

module.exports = (beaglebone) ->
  new Door(beaglebone)