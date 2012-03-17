Mastermind
============

[Mastermind](http://en.wikipedia.org/wiki/Mastermind_(board_game)) is a code breaking game for
two players.

When Emily introduced me to the game for her school homework, I was immediately beaten. I had to understand the algorithm and write a program that could crack the code faster than her!

Method
------

There are 4 digits, each with 10 possible combinations (0..9)

* Generate an array of all possible permutations. p=10! (5040). Ruby's Array has [support](http://ruby-doc.org/core-1.9.3/Array.html#method-i-permutation) for this.

* The score for each guess can be written as 2 numbers between 0 and 4.

* For each guess, prune the permutation array keeping all elements that have the same score as
  the previous guess.  The secret code lies in this group.

* Select at random a guess from the perutation array. If the guess is correct you've cracked the
  code, otherwise reduce the set and try again.

