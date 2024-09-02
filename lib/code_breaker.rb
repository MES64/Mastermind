# frozen_string_literal: true

require 'colorize'

require_relative 'game'

# Code Breaker has a method for making a guess
class CodeBreaker
  def initialize; end

  def make_guess(board, guess_number)
    guess = Game::GUESS_COLORS.sample(4)

    output = guess.map { |color| '●'.colorize(color) }
    puts output.join(' ')
    board.guesses[guess_number] = output
  end
end
