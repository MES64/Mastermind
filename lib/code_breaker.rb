# frozen_string_literal: true

require 'colorize'

require_relative 'board'
require_relative 'pin_creatable'

# Code Breaker has a method for making a guess
class CodeBreaker
  include PinCreatable

  def make_guess(board, guess_number, combinations)
    puts 'Enter Guess (e.g. rgbb) from:'
    puts string_guess_pin_colors
    guess = gets.chomp.chars until guess && combinations.include?(guess)
    board.add_guess(guess, guess_number)
  end
end
