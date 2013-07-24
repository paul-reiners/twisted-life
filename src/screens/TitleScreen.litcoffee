    class TitleScreen extends Screen
      min: 20

      updateAndRender: () ->
        return if @min-- > 0
        game.screen = new GameScreen() if keys.space

      render: (gfx) ->
        c = gfx.ctx

        gfx.clear()
        c.fillStyle = "#00ff00"
        c.font = "20pt monospace"
        c.fillText "Twisted Life", 160, 110
        # Some instructions
        c.fillStyle = "#e0e0e0"
        c.font = "14pt monospace"
        left = 40
        yCoord = 210
        vertSpace = 30
        text =
          ["You're the blue square.", "Hold down arrow keys to move.", "Go to the green square in the middle.",
           "Don't let the Twisted Life forms get you.", "You're gonna die, buddy.", "", "Press space to start..."]
        for line in text
          c.fillText line, left, yCoord
          yCoord += vertSpace
