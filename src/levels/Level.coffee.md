    class Level
      constructor: (@level, @game, @density) ->
        @createUniverse()
        @name = "Level " + level

      update: ->
        @life.update()
        @check()

      check: ->
        result = @checkForWin @game.player, @goal
        if result
          @game.player.render(gfx)
        else
          result = @checkCollision @game.player, @life
        result

      checkCollision: (player, life) ->
          if life.isAlive(player.y, player.x)
            sound.play "boom"
            @game.lifeLost()
            true
          else
            false

      checkForWin: (player, goal) ->
          if goal.won(player.y, player.x)
            sound.play "secosmic_lo"
            @game.levelComplete()
            true
          else
            false

      render: ->
        @life.render gfx
        @goal.render gfx

      createUniverse: ->
        @life = new TwistedLife @game.radius, @game.size, @density
        center = @game.radius + 1
        @goal = new Goal center, center, @game.size

      getRandomDeadCell: ->
        @life.getRandomDeadCell()
