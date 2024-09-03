# frozen_string_literal: true

require_relative 'pin_creatable'

# Board conatins information about the guesses made and hints given
# Constants: Number of guesses possible, and the number of guess and hint pegs possible per row
# Methods include to_s and accessors for the guesses and hints
class Board
  include PinCreatable

  PIN_GROUP_SIZE = 4
  COMBINATIONS = GUESS_COLORS.keys.repeated_permutation(PIN_GROUP_SIZE).map { |perm| perm }.freeze

  attr_reader :latest_guess, :latest_hint

  def initialize(max_guesses)
    @latest_guess = nil
    @latest_hint = nil
    @guesses = Array.new(max_guesses) { Array.new(PIN_GROUP_SIZE, '.') }
    @hints = Array.new(max_guesses) { Array.new(PIN_GROUP_SIZE, '.') }
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
    (@guesses.length - 1).downto(0).reduce('GUESSES | HINTS') do |board, idx|
      "#{board}\n#{@guesses[idx].join(' ')} | #{@hints[idx].join(' ')}"
    end
  end
end
