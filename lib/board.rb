# frozen_string_literal: true

# Board conatins information about the guesses made and hints given
# Constants: Guess colors available, hint colours available, number of guesses possible,
#            and the number of guess and hint pegs possible per row
# Methods include to_s and accessors for the guesses and hints
class Board
  MAX_GUESSES = 12
  GUESSES_PER_ROW = 4
  HINTS_PER_ROW = 4

  def initialize
    @guesses = Array.new(MAX_GUESSES) { Array.new(GUESSES_PER_ROW, '.') }
    @hints = Array.new(MAX_GUESSES) { Array.new(HINTS_PER_ROW, '.') }
  end

  def to_s
    (0...MAX_GUESSES).reduce('GUESSES | HINTS') do |board, idx|
      "#{board}\n#{@guesses[idx].join(' ')} | #{@hints[idx].join(' ')}"
    end
  end
end
