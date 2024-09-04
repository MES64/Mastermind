# frozen_string_literal: true

require_relative 'pin_creatable'

# Computer Code Breaker
class ComputerCodeBreaker
  include PinCreatable

  def initialize(combinations)
    @combinations = combinations
  end

  def make_guess(board, guess_number)
    print 'The computer will now make a guess, to continue press Enter >> '
    gets
    reduce_combinations(board) unless board.latest_guess.nil?
    board.add_guess(@combinations[0], guess_number)
  end

  def reduce_combinations(board)
    actual_red_pins = board.latest_hint.count('r')
    actual_white_pins = board.latest_hint.count('w')
    @combinations = @combinations.select do |code|
      red_pins = code.each_index.select { |idx| code[idx] == board.latest_guess[idx] }.length
      white_pins = sum_min_tallies(board.latest_guess.tally, code.tally) - red_pins
      red_pins == actual_red_pins && white_pins == actual_white_pins
    end
  end

  private

  def sum_min_tallies(guess_tally, code_tally)
    GUESS_COLORS.keys.reduce(0) do |sum, color|
      sum += [guess_tally[color], code_tally[color]].min if guess_tally[color] && code_tally[color]
      sum
    end
  end
end
