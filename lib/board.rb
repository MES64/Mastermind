# frozen_string_literal: true

require_relative 'pin_creatable'

# Board conatins information about the guesses made and hints given
# Constants: Number of guesses possible, and the number of guess and hint pegs possible per row
# Methods include to_s and accessors for the guesses and hints
class Board
  include PinCreatable

  MAX_GUESSES = 12
  PIN_GROUP_SIZE = 4
  COMBINATIONS = GUESS_COLORS.keys.repeated_permutation(PIN_GROUP_SIZE).map { |perm| perm }.freeze

  attr_reader :latest_guess, :latest_hint

  def initialize
    @latest_guess = nil
    @latest_hint = nil
    @guesses = Array.new(MAX_GUESSES) { Array.new(PIN_GROUP_SIZE, '.') }
    @hints = Array.new(MAX_GUESSES) { Array.new(PIN_GROUP_SIZE, '.') }
  end

  def add_guess(guess, guess_number)
    @latest_guess = guess
    @guesses[guess_number] = create_guess_pins(guess)
  end

  def add_hint(red_pins, white_pins, guess_number)
    @latest_hint = Array.new(red_pins, 'r').concat(Array.new(white_pins, 'w'))
    blanks = PIN_GROUP_SIZE - red_pins - white_pins
    @hints[guess_number] = create_hint_pins(@latest_hint).concat(Array.new(blanks, '.'))
  end

  def to_s
    (MAX_GUESSES - 1).downto(0).reduce('GUESSES | HINTS') do |board, idx|
      "#{board}\n#{@guesses[idx].join(' ')} | #{@hints[idx].join(' ')}"
    end
  end
end
