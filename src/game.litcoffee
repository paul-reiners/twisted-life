    "use strict"

    @game =
      dialog: null
      screen: null
      fps: 4

      init: ->
        unless gfx.init()
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
        unless @running
            @start()
            @tick()

      tick: ->
<a id="conditionalModifier1"></a>An example of a conditional modifier:

        return unless @running
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
          if @screen.constructor is TitleScreen
            @screen.updateAndRender()
          else
            @screen.updateAndRender(gfx)

      render: ->
        gfx.clear()
        @screen.render gfx
<a id="conditionalModifier1"></a>An example of a conditional modifier:

        @dialog.render gfx if @dialog
