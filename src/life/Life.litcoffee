<link href="../docs.css" rel="stylesheet"></link>
![John Horton Conway](../img/250px-John_H_Conway_2005.jpg)

<a id="classKeyword"></a>An example of using the class keyword:

    class Life
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

      update: ->
        nextGen = @getNextGen()
        twistedNextGen = @twist(nextGen)
        @universe = twistedNextGen

      twist: (newGen) ->
<a id="listComprehension"></a>An example of list comprehension:

          twisted = (
            for i in [-@radius .. @radius]
              for j in [-@radius .. @radius]
                  absI = Math.abs i
                  absJ = Math.abs j
                  dist = Math.max absI, absJ
                  iOffSet = 0
                  jOffSet = 0
                  if i is 0 and j is 0
                    iOffSet = 0
                    jOffSet = 0
                  else if dist is absI and i < 0 and not (i is -@radius and j is -@radius)
                      iOffSet =  0
                      jOffSet = -1
                  else if dist is absJ and j > 0
                      iOffSet = -1
                      jOffSet =  0
                  else if dist is absI and i > 0
                      iOffSet = 0
                      jOffSet = 1
                  else
                    iOffSet = 1
                    jOffSet = 0
                  x = ((i + @radius + iOffSet) + @sideLen) % @sideLen
                  y = ((j + @radius + jOffSet) + @sideLen) % @sideLen
                  newGen[x][y])

          twisted

      getNextGen: ->
        nextGen = (
          for y in [0 ... @sideLen]
            for x in [0 ... @sideLen]
              @isAlive x, y)
        nextGen

      render: (gfx) ->
        for y in [0 ... @sideLen]
          for x in [0 ... @sideLen]
            if @universe[y][x] is 1
              gfx.drawSquare(y, x, @size)
            else
              gfx.drawSquare(y, x, @size, "black")

      isAlive: (x, y) ->
        liveNeighbors = 0
        for dy in [-1 .. 1]
          for dx in [-1 .. 1]
            neighborY = (y + dy + @sideLen) % @sideLen
            neighborX = (x + dx + @sideLen) % @sideLen
            if (dy isnt 0 or dx isnt 0) and @universe[neighborY][neighborX] is 1
              liveNeighbors++
        if @universe[y][x] is 1
          # Any live cell with fewer than two live neighbours dies, as if caused by under-population.
          if liveNeighbors < 2
            0
          # Any live cell with two or three live neighbours lives on to the next generation.
          else if liveNeighbors is 2 or liveNeighbors is 3
            1
          # Any live cell with more than three live neighbours dies, as if by overcrowding.
          else
            0
        else
          # Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
          if liveNeighbors is 3
            1
          else
            0

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
