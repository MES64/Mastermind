# frozen_string_literal: true

require 'colorize'

require_relative 'game'

# Code Breaker has a method for making a guess
class CodeBreaker
  def initialize; end

  def make_guess(board, guess_number)
    puts 'Enter Guess (e.g. rgbb) from:'
    puts(Game::GUESS_COLORS.reduce('') { |output, (letter, color)| "#{output}#{letter} = #{'●'.colorize(color)} " })
    guess = gets.chomp.chars
    output = guess.map { |char| '●'.colorize(Game::GUESS_COLORS[char]) }
    board.guesses[guess_number] = output
  end
end
