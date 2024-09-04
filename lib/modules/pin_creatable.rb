# frozen_string_literal: true

require 'colorize'

# Holds constants related to the creation of pins
# Has methods for converting an array of color chars like 'r' (red)
# into an array of circle chars with that color; depending on if they are guess or hint pins
# Has a method for returning a string of all possible guess pin colors
module PinCreatable
  GUESS_COLORS = { 'r' => :red, 'g' => :green, 'y' => :yellow, 'b' => :blue, 'w' => :white, 'd' => :black }.freeze
  HINT_COLORS = { 'r' => :red, 'w' => :white }.freeze

  private_constant :HINT_COLORS

  def create_guess_pins(guess)
    create_pins(guess, GUESS_COLORS)
  end

  def create_hint_pins(hint)
    create_pins(hint, HINT_COLORS)
  end

  def string_guess_pin_colors
    GUESS_COLORS.reduce('') { |output, (letter, color)| "#{output}#{letter} = #{'●'.colorize(color)} " }
  end

  private

  def create_pins(chars, colors)
    chars.map { |char| '●'.colorize(colors[char]) }
  end
end
