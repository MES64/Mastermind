# frozen_string_literal: true

# Board conatins information about the guesses made and hints given
# Constants: Number of guesses possible, and the number of guess and hint pegs possible per row
# Methods include to_s and accessors for the guesses and hints
class Board
  MAX_GUESSES = 12
  GUESSES_PER_ROW = 4
  HINTS_PER_ROW = 4
  GUESS_COLORS = { 'r' => :red, 'g' => :green, 'y' => :yellow, 'b' => :blue, 'w' => :white, 'd' => :black }.freeze
  HINT_COLORS = %i[red white].freeze
  COMBINATIONS = GUESS_COLORS.keys.repeated_permutation(GUESSES_PER_ROW).map { |perm| perm }.freeze

  attr_reader :latest_guess

  def initialize
    @latest_guess = nil
    @latest_hint = nil
    @guesses = Array.new(MAX_GUESSES) { Array.new(GUESSES_PER_ROW, '.') }
    @hints = Array.new(MAX_GUESSES) { Array.new(HINTS_PER_ROW, '.') }
  end

  def add_guess(guess, guess_number)
    @latest_guess = guess
    @guesses[guess_number] = guess.map { |char| '●'.colorize(GUESS_COLORS[char]) }
  end

  def to_s
    (0...MAX_GUESSES).reduce('GUESSES | HINTS') do |board, idx|
      "#{board}\n#{@guesses[idx].join(' ')} | #{@hints[idx].join(' ')}"
    end
  end
end
