#!/usr/bin/env ruby

module Mastermind

  class Game

    def initialize output, digits= 4
      @output = output
      @digits = digits
      @permutations = (0..9).to_a.permutation(@digits).to_a
    end

    def start
      welcome
      guesses = []
      begin
        guesses << next_guess
        @output.puts "#{guesses.size}: Guess '#{guesses.last.join}'"
        bulls, hits = prompt("  -> Score (bulls,hits)? ").split(',')
        score guesses.last, [bulls.to_i, hits.to_i]
      end while not bulls.to_i == @digits
      output.puts "\nDone! It took me #{guesses.size} guesses. Thanks for playing!\n\n"
    end

    private
    def prompt(*args)
      @output.print(*args)
      gets
    end

    def next_guess
      @permutations.sample
    end

    def score guess, guess_score
      @permutations.reject! do |p|
        bulls = p.zip(guess).count { |c| c[0] == c[1] }
        hits = p.count { |c| guess.include? c } - bulls
        [bulls, hits] != guess_score
      end
    end

    def output
      @output
    end

    def welcome
      output.puts %q{
 _ _ _
( / ) )         _/_                 o          /
 / / / __,  (   /  _  _     _ _ _  ,  _ _   __/
/ / (_(_/(_/_)_(__(/_/ (_  / / / /_(_/ / /_(_/_

      }
      output.puts "You're playing a game of mastermind."
      output.puts "Think of a #{@digits} digit number."
      output.puts
      prompt 'Press [Enter] to continue'
      output.puts
    end
  end
end

Mastermind::Game.new(STDOUT, 4).start
