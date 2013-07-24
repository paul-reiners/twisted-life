class Level
  constructor: (@level, @game) ->
    @createUniverse()
    @name = "Level " + level

  update: ->
    @life.update()
    @check()

  check: ->
    @checkForWin @game.player, @goal
    @checkCollision @game.player, @life

  checkCollision: (player, life) ->
      if life.isAlive(player.y, player.x)
        sound.play "boom"
        @game.lifeLost()

  checkForWin: (player, goal) ->
      if goal.won(player.y, player.x)
        sound.play "particle"
        @game.levelComplete()

  render: ->
    @life.render gfx
    @goal.render gfx

  createUniverse: ->
    sparseness = 8

    @life = new Life @game.radius, @game.size, sparseness
    center = @game.radius + 1
    @goal = new Goal center, center, @game.size

  getRandomDeadCell: ->
    @life.getRandomDeadCell()
