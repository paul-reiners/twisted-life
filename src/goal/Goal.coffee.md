    class Goal
      constructor: (@x, @y, @size) ->
      render: (gfx) -> gfx.drawSquare(@x, @y, @size, "green")
      won: (playerX, playerY) -> @x is playerX and @y is playerY
