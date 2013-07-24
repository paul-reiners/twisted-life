@game =
  dialog: null
  screen: null
  fps: 4

  init: ->
    if not gfx.init()
      alert "Sorry, no canvas"
      return
    gfx.load ->
      game.reset()

  stop: -> @running = false

  start: -> @running = true

  reset: ->
    @dialog = null
    @screen = new TitleScreen()
    keys.reset()
    if not @running
        @start()
        @tick()

  tick: ->
    return if not @running
    @update()
    @render()
    if (@screen? and @screen.constructor is TitleScreen) or @dialog?
      setTimeout (=> @tick()), 33
    else
      setTimeout (-> requestAnimationFrame -> game.tick()), 1000 / @fps

  update: ->
    if @dialog?
      @dialog.update()
    else
      gfx.clear()
      @screen.updateAndRender(gfx)

  render: ->
    gfx.clear()
    @screen.render gfx
    @dialog.render gfx if @dialog
