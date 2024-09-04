# frozen_string_literal: true

require_relative 'pin_creatable'
require_relative 'chooseable'

# Human Code Breaker has a method for making a guess
class HumanCodeBreaker
  include PinCreatable
  include Chooseable

  def make_guess(board, guess_number, combinations)
    guess = choose("Enter Guess (e.g. rgbb) from:\n#{string_guess_pin_colors}", combinations)
    board.add_guess(guess, guess_number)
  end
end
