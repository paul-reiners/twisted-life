class GameScreen extends Screen
  levelNumber: 0
  size: 8
  radius: 32
  numLives: 4
  roundScore: 1000
  gameScore: 0
  this.DECAY = 0.99

  constructor: ->
    @startLevel()

  updateAndRender: (gfx) ->
    # Update level, player, and check collisions
    # 1. Update player
    @player.update()
    # 2. Render
    @render(gfx)
    # 3. Check for goal or collision
    @level.check()
    # 4. Update Life
    @level.update()
    # 5. Render
    @render(gfx)
    # 3. Check for goal or collision
    @level.check()
    @roundScore = Math.round(@roundScore * GameScreen.DECAY)

  startLevel: ->
    @level = new Level @levelNumber, @
    [playerX, playerY] = @level.getRandomDeadCell()
    diameter = 2 * @radius + 1
    @player = new Player playerX, playerY, @size, diameter
    game.dialog = new LevelDialog(@level.name, @numLives, @roundScore)

  levelComplete: ->
    @levelNumber++
    @startLevel()

  lifeLost: ->
    @gameScore = @gameScore + @roundScore
    @roundScore = 1000
    @numLives--
    if @numLives <= 0
      game.dialog = new DeadDialog()
    else
      if @levelNumber > 0
        @levelNumber--
      @startLevel()

  render: (gfx) ->
    @level.render gfx
    @player.render gfx
