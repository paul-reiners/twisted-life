    class LevelDialog extends Dialog
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

        left = 15
        yCoord = 45
        vertSpace = 20
        if @numLives is 1
          livesText = "1 life left."
        else
          livesText = "#{@numLives} lives left."
        text =
          ["#{@levelName}.", livesText, "Previous round score: #{@roundScore}",
           "Game score: #{@gameScore}", "", "Press space to start level..."]
        for line in text
          c.fillText line, left, yCoord
          yCoord += vertSpace

        c.restore()
