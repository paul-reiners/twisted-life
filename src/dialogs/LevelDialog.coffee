class LevelDialog extends Dialog
  time: 50
  constructor: (@levelName, @numLives, @roundScore, @gameScore) ->
    keys.reset()

  update: ->
    if keys.space
      keys.reset()
      game.dialog = null

  render: (gfx) ->
    c = gfx.ctx
    c.save()
    c.translate 100, 150
    c.fillStyle = "hsla(205, 40%, 50%, 0.8)"
    c.fillRect 0, 0, 350, 200

    c.fillStyle = "#e0e0e0"
    c.fillText "#{@levelName}.", 50, 70
    c.fillText "#{@numLives} lives left.", 50, 90
    c.fillText "Previous round score: #{@roundScore}", 50, 110
    c.fillText "Game score: #{@gameScore}", 50, 130
    c.restore()
