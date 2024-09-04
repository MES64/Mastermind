# frozen_string_literal: true

require_relative 'code_breaker'
require_relative 'hint_creatable'

# Computer Code Breaker
class ComputerCodeBreaker < CodeBreaker
  include HintCreatable

  def make_guess(board, guess_number)
    print 'The computer will now make a guess, to continue press Enter >> '
    gets
    reduce_combinations(board) unless board.latest_guess.nil?
    board.add_guess(@combinations[0], guess_number)
  end

  private

  def reduce_combinations(board)
    @combinations = @combinations.select do |code|
      hint = create_hint(code, board)
      hint[:reds] == board.latest_hint[:reds] && hint[:whites] == board.latest_hint[:whites]
    end
  end
end
