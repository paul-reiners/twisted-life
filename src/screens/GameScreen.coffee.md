GameScreen.coffee.md
==============
<link href="../docs.css" rel="stylesheet"></link>

    class GameScreen extends Screen
      this.DECAY = 0.99
      this.STARTING_DENSITY = 0.125
      this.MAX_DENSITY = 0.375

      levelNumber: 0
      size: 8
      radius: 32
      numLives: 4
      roundScore: 0
      prevRoundScore: @roundScore
      gameScore: 0
      density: this.STARTING_DENSITY

      constructor: ->
        @startLevel()

      updateAndRender: (gfx) ->
        # Update level, player, and check collisions
        # 1. Update player
        @player.update()
        # 2. Render
        @render(gfx)
        # 3. Check for goal or collision
        result = @level.check()
        if result
          return
        # 4. Update Life
        @level.update()
        # 5. Render
        @render(gfx)
        # 3. Check for goal or collision
        @level.check()
        @roundScore = Math.round(@roundScore * GameScreen.DECAY)

      startLevel: ->
        @prevRoundScore = @roundScore
        @roundScore = 1000
        @level = new Level @levelNumber, @, @density
        [playerX, playerY] = @level.getRandomDeadCell()
        diameter = 2 * @radius + 1
        @player = new Player playerX, playerY, @size, diameter
        game.dialog = new LevelDialog(@level.name, @numLives, @prevRoundScore, @gameScore)

      levelComplete: ->
        @levelNumber++
        @density = (63 * @density + GameScreen.MAX_DENSITY) / 64
        @gameScore = @gameScore + @roundScore
        @startLevel()

      lifeLost: ->
        @roundScore = 0
        @numLives--
        if @numLives <= 0
          game.dialog = new DeadDialog(@gameScore)
        else
          if @levelNumber > 0
            @levelNumber--
          @density = (15 * @density) / 16
          @startLevel()

      render: (gfx) ->
        @level.render gfx
        @player.render gfx
