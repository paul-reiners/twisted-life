class Player
  constructor: (@x, @y, @size, @universeDiameter) ->
  update: ->
    if keys.left
      @x = (@x - 1 + @universeDiameter) % @universeDiameter
    if keys.right
      @x = (@x + 1) % @universeDiameter
    if keys.down
      @y = (@y + 1) % @universeDiameter
    if keys.up
      @y = (@y - 1 + @universeDiameter) % @universeDiameter
  render: (gfx) -> gfx.drawSquare(@x, @y, @size, "blue")
