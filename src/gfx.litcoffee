    gfx =
      init: ->
        canvas = $("#game")[0]
        @ctx = canvas?.getContext? "2d"
        return false if not @ctx
        @w = canvas.width
        @h = canvas.height
        true
      clear: -> @ctx.clearRect 0, 0, @w, @h
      load: (onload) ->
        @title = new Image()
        @title.src = "resources/title.png"
        onload()
      drawSquare: (x, y, size, color = "white") ->
        @ctx.fillStyle = color
        @ctx.fillRect x * size, y * size, size, size
