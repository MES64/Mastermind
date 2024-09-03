# frozen_string_literal: true

require_relative 'pin_creatable'

# Board conatins information about the guesses made and hints given
# Constants: Number of guesses possible, and the number of guess and hint pegs possible per row
# Methods include to_s and accessors for the guesses and hints
class Board
  include PinCreatable

  MAX_GUESSES = 12
  GUESSES_PER_ROW = 4
  HINTS_PER_ROW = 4
  COMBINATIONS = GUESS_COLORS.keys.repeated_permutation(GUESSES_PER_ROW).map { |perm| perm }.freeze

  attr_reader :latest_guess, :latest_hint

  def initialize
    @latest_guess = nil
    @latest_hint = nil
    @guesses = Array.new(MAX_GUESSES) { Array.new(GUESSES_PER_ROW, '.') }
    @hints = Array.new(MAX_GUESSES) { Array.new(HINTS_PER_ROW, '.') }
  end

  def add_guess(guess, guess_number)
    @latest_guess = guess
    @guesses[guess_number] = create_guess_pins(guess)
  end

  def add_hint(red_pins, white_pins, guess_number)
    @latest_hint = Array.new(red_pins, 'r').concat(Array.new(white_pins, 'w'))
    blanks = HINTS_PER_ROW - red_pins - white_pins
    @hints[guess_number] = create_hint_pins(@latest_hint).concat(Array.new(blanks, '.'))
  end

  def to_s
    (MAX_GUESSES - 1).downto(0).reduce('GUESSES | HINTS') do |board, idx|
      "#{board}\n#{@guesses[idx].join(' ')} | #{@hints[idx].join(' ')}"
    end
  end
end
