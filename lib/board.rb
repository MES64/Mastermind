# frozen_string_literal: true

# Board conatins information about the guesses made and hints given
# Constants: Guess colors available, hint colours available, number of guesses possible,
#            and the number of guess and hint pegs possible
# Methods include to_s and accessors for the guesses and hints
class Board
  def initialize
    @guesses = Array.new(12) { Array.new(4) }
    @hints = Array.new(12) { Array.new(4) }
  end
end
