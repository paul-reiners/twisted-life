<link href="docs.css" rel="stylesheet"></link>

Kind of Funny Looking
=====================
<!-- width="225" height="39" -->
Steve Buscemi, JavaScript, and <img src="./img/logo.png" width="169" height="29" alt="CoffeeScript" />
-------------------------------------------

Version 1.0.0 - Sun 04 Aug 2013

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

    var MyClass = (function() {
      function MyClass() {
        alert('constructor');
      }

      MyClass.prototype.doSomething = function() {
        alert('doing something');
      };

      return MyClass;
    })();

    c = new MyClass();
    c.doSomething();

CoffeeScript, on the other hand, is a Real Language and it **looks** like a Real Language:

	class MyClass
      constructor: ->
        alert 'constructor'

      doSomething: ->
        alert 'doing something'

    c = new MyClass()
    c.doSomething()

(The two examples above are taken from
["Should You Learn CoffeeScript?"](http://net.tutsplus.com/articles/interviews/should-you-learn-coffeescript/) by
Jeffrey Way.)

The readability alone, I think, should make one prefer CoffeeScript over JavaScript.

> The core idea with CoffeeScript is to express JavaScript semantics in as readable and minimal a syntax as we can find.

> ---Jeremy Ashkenas, the author of CoffeeScript

> That JS and CoffeeScript are formally co-expressive — have the same semantics — is huge. Yes, this means you could
have just written JS. But productivity and **beauty** (in the eyes of some beholders) matter; syntax matters.

> ---Brendan Eich, the creator of JavaScript, and co-founder of Mozilla.

> It doesn’t take much effort to learn; CoffeeScript is basically the sum of a few dozen syntactic sugars on top of
JavaScript. And the reward is that you get to write more **beautiful** code, when you want it.

> ---Trevor Burnham, author of <i>CoffeeScript: Accelerated JavaScript Development</i>

> Of course it’s possible to write ugly code in any language, but I definitely think CoffeeScript has an inherent
aesthetic **beauty** to it, in both the language and the community; much more so than traditional JavaScript.

> ---Alex MacCaw, Ruby/JavaScript developer at Twitter, O'Reilly author

[More slavering over CoffeeScript.](https://www.google.com/search?q=beauty+coffeescript&oq=beauty+coffeescript)

But, hey, looks aren't everything.

So...

5 good reasons to use CoffeeScript (besides its good looks)
------------------------------------------------------------

This list is from ["10 good reasons to use CoffeeScript"](http://www.netmagazine.com/features/10-good-reasons-use-coffeescript)
by Caike Souza.

1. Cleaner syntax (okay, this is its good looks---make that 4)
4. [String interpolation](./dialogs/LevelDialog.html#stringInterpolation)
5. [List comprehensions](./life/TwistedLife.html#listComprehension)
6. Conditional modifiers
 * [Example 1](./game.html#conditionalModifier1)
 * [Example 2](./game.html#conditionalModifier2)
7. [The class keyword](./life/Life.html#classKeyword)

Actually, *all* of those contribute to CoffeeScript's good looks.

One last shallow observation on the shallowness (or 'shallowness'?) of good looks
---------------------------------------------------------------------------------

This whole presentation is executable CoffeeScript.  You see, CoffeeScript allows
literate programming (but not in the sense of Knuth, so try not to get all worked up about that) by embedding your code
in Markdown files.

What other language do you know of that lets you [display a picture of Brigitte Bardot inline](./life/TwistedLife.html#brigitte)?

Demo
----

* [Play](http://www.automatous-monk.com/twistedlife/)
* Source
  * [game](game.html)
  * [GameScreen](./screens/GameScreen.html)
  * [Life](./life/Life.html)
  * [TwistedLife](./life/TwistedLife.html)


References
----------

* [CoffeeScript](http://coffeescript.org/)
*  ["JavaScript: The World's Most Misunderstood Programming Language"](http://javascript.crockford.com/javascript) by Douglas Crockford
* ["Should You Learn CoffeeScript?"](http://net.tutsplus.com/articles/interviews/should-you-learn-coffeescript/) by Jeffrey Way
* <i>Jump Start CoffeeScript </i>by Earle Castledine
* <i>The Little Book on CoffeeScript </i> by Alex MacCaw
* <i>CoffeeScript: Accelerated JavaScript Development </i> by Trevor Burnham
