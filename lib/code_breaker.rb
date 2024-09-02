# frozen_string_literal: true

require 'colorize'

require_relative 'board'

# Code Breaker has a method for making a guess
class CodeBreaker
  def make_guess(board, guess_number)
    puts 'Enter Guess (e.g. rgbb) from:'
    puts(Board::GUESS_COLORS.reduce('') { |output, (letter, color)| "#{output}#{letter} = #{'●'.colorize(color)} " })
    guess = gets.chomp.chars until guess && Board::COMBINATIONS.include?(guess)
    board.add_guess(guess, guess_number)
  end
end
