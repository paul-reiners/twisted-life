class DeadDialog extends Dialog
  constructor: (@gameScore) ->

  update: ->
    game.reset() if keys.space
            
  render: (gfx) ->
    c = gfx.ctx
    c.save()
    c.translate 100, 150
    c.fillStyle = "hsla(5, 40%, 50%, 0.8)"
    c.fillRect 0, 0, 350, 200

    c.fillStyle = "#e0e0e0"

    left = 10
    yCoord = 70
    vertSpace = 20
    text =
      ["You're dead, buddy!", "Game score: #{@gameScore}", "", "Press space for a new game..."]
    for line in text
      c.fillText line, left, yCoord
      yCoord += vertSpace

    c.restore()

