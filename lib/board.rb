# frozen_string_literal: true

require_relative 'pin_creatable'

# Board conatins information about the guesses made and hints given
# Methods include adding guesses and hints to the board,
# to_s, and getters for the latest guess and the latest hint
class Board
  include PinCreatable

  attr_reader :latest_guess, :latest_hint

  def initialize(max_guesses, pin_group_size)
    @latest_guess = nil
    @latest_hint = nil
    @guesses = Array.new(max_guesses) { Array.new(pin_group_size, '.') }
    @hints = Array.new(max_guesses) { Array.new(pin_group_size, '.') }
  end

  def add_guess(guess, guess_number)
    @latest_guess = guess
    @guesses[guess_number] = create_guess_pins(guess)
  end

  def add_hint(red_pins, white_pins, guess_number)
    @latest_hint = Array.new(red_pins, 'r').concat(Array.new(white_pins, 'w'))
    blanks = @hints[0].length - red_pins - white_pins
    @hints[guess_number] = create_hint_pins(@latest_hint).concat(Array.new(blanks, '.'))
  end

  def to_s
    (@guesses.length - 1).downto(0).reduce('GUESSES | HINTS') do |board, idx|
      "#{board}\n#{@guesses[idx].join(' ')} | #{@hints[idx].join(' ')}"
    end
  end
end
