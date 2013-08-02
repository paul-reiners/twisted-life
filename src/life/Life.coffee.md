Life.litcoffee
==============
<link href="../docs.css" rel="stylesheet"></link>
![John Horton Conway](../img/250px-John_H_Conway_2005.jpg)

John Horton Conway, inventor of Life

![John Horton Conway](../img/Gospers_glider_gun.gif)

A single Gosper's Glider Gun creating "gliders"

Life class
==========
<a id="classKeyword"></a>An example of using the class keyword:

    class Life
Constructor
-----------

      constructor: (@radius, @size, density) ->
        # Random universe
        diameter = 2 * @radius + 1
        @count = 0
        @universe = (
          for [0 ... diameter]
            for [0 ... diameter]
              r = Math.random()
              if r <= density
                @count++
                1
              else
                0)
        @sideLen = @universe.length

getNextGen function
-------------------

      getNextGen: ->
        nextGen = (
          for y in [0 ... @sideLen]
            for x in [0 ... @sideLen]
              @isAlive x, y)
        nextGen

isAlive function
----------------

      isAlive: (x, y) ->
        liveNeighbors = 0
        for dy in [-1 .. 1]
          for dx in [-1 .. 1]
            neighborY = (y + dy + @sideLen) % @sideLen
            neighborX = (x + dx + @sideLen) % @sideLen
            if (dy isnt 0 or dx isnt 0) and @universe[neighborY][neighborX] is 1
              liveNeighbors++
        if @universe[y][x] is 1
Any live cell with fewer than two live neighbours dies, as if caused by under-population.

          if liveNeighbors < 2
            0
Any live cell with two or three live neighbours lives on to the next generation.

          else if liveNeighbors is 2 or liveNeighbors is 3
            1
Any live cell with more than three live neighbours dies, as if by overcrowding.

          else
            0
        else
Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

          if liveNeighbors is 3
            1
          else
            0

getRandomDeadCell function
--------------------------

      getRandomDeadCell: ->
        c = @count
        foundDeadCell = false
        playerX = -1
        playerY = -1
        for y in [0 ... @universe.length]
          for x in [0 ... @universe[y].length]
            if @universe[y][x] is 0
              r = utils.rand c
              if r is 0
                playerY = y
                playerX = x
                foundDeadCell = true
                break
              else
                c--
          if foundDeadCell
            break

        [playerX, playerY]
