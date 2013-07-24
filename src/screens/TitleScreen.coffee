class TitleScreen extends Screen
  min: 20

  updateAndRender: () ->
    return if @min-- > 0
    game.screen = new GameScreen() if keys.space

  render: (gfx) ->
    c = gfx.ctx
          
    gfx.clear()
    c.drawImage gfx.title, 180, 10
    # Some instructions
    c.fillStyle = "#e0e0e0"
    c.font = "14pt monospace"
    c.fillText "Go to the green square.", 50, 210
    c.fillText "Press space to start...", 50, 240 