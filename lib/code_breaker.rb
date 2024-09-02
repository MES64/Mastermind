# frozen_string_literal: true

require 'colorize'

require_relative 'game'

# Code Breaker has a method for making a guess
class CodeBreaker
  COMBINATIONS = Game::GUESS_COLORS.keys.repeated_permutation(4).map { |perm| perm }.freeze

  def make_guess(board, guess_number)
    puts 'Enter Guess (e.g. rgbb) from:'
    puts(Game::GUESS_COLORS.reduce('') { |output, (letter, color)| "#{output}#{letter} = #{'●'.colorize(color)} " })
    guess = gets.chomp.chars until guess && COMBINATIONS.include?(guess)
    board.guesses[guess_number] = guess.map { |char| '●'.colorize(Game::GUESS_COLORS[char]) }
  end
end
