# frozen_string_literal: true

# Has a method for creating the hint hash
module HintCreatable
  def create_hint(code, board)
    red_pins = code.each_index.select { |idx| code[idx] == board.latest_guess[idx] }.length
    white_pins = sum_min_tallies(board.latest_guess.tally, code.tally) - red_pins
    { reds: red_pins, whites: white_pins }
  end

  private

  def sum_min_tallies(guess_tally, code_tally)
    colors = guess_tally.keys.concat(code_tally.keys).uniq
    colors.reduce(0) do |sum, color|
      sum += [guess_tally[color], code_tally[color]].min if guess_tally[color] && code_tally[color]
      sum
    end
  end
end
