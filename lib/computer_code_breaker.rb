# frozen_string_literal: true

# Computer Code Breaker
class ComputerCodeBreaker
  def make_guess(board, guess_number, combinations)
    print 'The computer will now make a guess, to continue press Enter >> '
    gets
    guess = combinations.sample
    board.add_guess(guess, guess_number)
  end
end
