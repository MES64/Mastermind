# frozen_string_literal: true

require_relative 'board'

# Code Maker holds the secret code
# It has methods for creating the code and giving a hint
class CodeMaker
  attr_reader :code

  def initialize
    @code = Board::COMBINATIONS.sample
    @code_tally = @code.tally
  end

  def give_hint(board, guess_number)
    red_pins = @code.each_index.select { |idx| @code[idx] == board.latest_guess[idx] }.length
    white_pins = sum_min_tallies(board.latest_guess.tally) - red_pins
    board.add_hint(red_pins, white_pins, guess_number)
  end

  private

  def sum_min_tallies(guess_tally)
    Board::GUESS_COLORS.keys.reduce(0) do |sum, color|
      sum += [guess_tally[color], @code_tally[color]].min if guess_tally[color] && @code_tally[color]
      sum
    end
  end
end
