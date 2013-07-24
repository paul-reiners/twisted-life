Kind of Funny Looking
=====================
Steve Buscemi, JavaScript, and CoffeeScript
-------------------------------------------

Version 0.0.1 - Thu 18 Jul 2013

by Paul Reiners  


Looks aren't everything (or are they?)
--------------------------------------

<!---
<iframe width="560" height="315" src="//www.youtube.com/embed/x-XEHwUBubk" frameborder="0" allowfullscreen></iframe>
-->
<object width="560" height="315"><param name="movie" value="http://www.youtube.com/v/x-XEHwUBubk&amp;hl=en_US&amp;fs=1"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/x-XEHwUBubk&amp;hl=en_US&amp;fs=1" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="560" height="315"></embed></object>

Steve Buscemi is a Real ("real" as in "serious") Actor.  JavaScript is a Real Language.  As Douglas Crockford has said, JavaScript
is "Lisp in C's clothing":

> JavaScript's C-like syntax, including curly braces and the clunky for statement, makes it appear to be an ordinary procedural language. This is 
> misleading because JavaScript has more in common with functional languages like Lisp or Scheme than with C or Java. It has arrays instead of lists and 
> objects instead of property lists. Functions are first class. It has closures. You get lambdas without having to balance all those parens.

> --- Douglas Crockford in ["JavaScript: The World's Most Misunderstood Programming Language"](http://javascript.crockford.com/javascript)

However, like Steve Buscemi, JavaScript is kind of funny looking.

    Life.prototype.isAlive = function(x, y) {
      var dx, dy, liveNeighbors, neighborX, neighborY, _i, _j;
      liveNeighbors = 0;
      for (dy = _i = -1; _i <= 1; dy = ++_i) {
        for (dx = _j = -1; _j <= 1; dx = ++_j) {
          neighborY = (y + dy + this.sideLen) % this.sideLen;
          neighborX = (x + dx + this.sideLen) % this.sideLen;
          if ((dy !== 0 || dx !== 0) && this.universe[neighborY][neighborX] === 1) {
            liveNeighbors++;
          }
        }
      }
      if (this.universe[y][x] === 1) {
        if (liveNeighbors < 2) {
          return 0;
        } else if (liveNeighbors === 2 || liveNeighbors === 3) {
          return 1;
        } else {
          return 0;
        }
      } else {
        if (liveNeighbors === 3) {
          return 1;
        } else {
          return 0;
        }
      }
    };

CoffeeScript, on the other hand, is a Real Language and it **looks** like a Real Language:

	  isAlive: (x, y) ->
		liveNeighbors = 0
		for dy in [-1 .. 1]
		  for dx in [-1 .. 1]
			neighborY = (y + dy + @sideLen) % @sideLen
			neighborX = (x + dx + @sideLen) % @sideLen
			if (dy isnt 0 or dx isnt 0) and @universe[neighborY][neighborX] is 1
			  liveNeighbors++
		if @universe[y][x] is 1
		  if liveNeighbors < 2
			0
		  else if liveNeighbors is 2 or liveNeighbors is 3
			1
		  else
			0
		else
		  if liveNeighbors is 3
			1
		  else
			0

The readability alone, I think, should make one prefer CoffeeScript over JavaScript.

But, hey, looks aren't everything.

So...

5 good reasons to use CoffeeScript (besides its good looks)
------------------------------------------------------------

This list is from ["10 good reasons to use CoffeeScript"](http://www.netmagazine.com/features/10-good-reasons-use-coffeescript)
by Caike Souza.

1. Cleaner syntax (okay, this is its good looks---make that 4)
4. [String interpolation](./dialogs/LevelDialog.html#stringInterpolation)
5. [List comprehensions](./life/Life.html#listComprehension)
6. Conditional modifiers
 * [Example 1](./game.html#conditionalModifier1)
 * [Example 2](./game.html#conditionalModifier2)
7. [The class keyword](./life/Life.html#classKeyword)

One last shallow observation on the shallowness (or 'shallowness'?) of good looks
---------------------------------------------------------------------------------

This whole presentation is executable CoffeeScript.  You see, CoffeeScript allows
literate programming by embedding your code in Markdown files.

What other language do you know of that lets you display a picture of Brigitte Bardot inline?
![Brigitte Bardot](./img/brigitte.jpg)
