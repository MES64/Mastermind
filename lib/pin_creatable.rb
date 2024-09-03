# frozen_string_literal: true

# Holds constants related to the creation of pins
# Has a method for converting color chars like 'r' (red) into circle chars with that color
module PinCreatable
  GUESS_COLORS = { 'r' => :red, 'g' => :green, 'y' => :yellow, 'b' => :blue, 'w' => :white, 'd' => :black }.freeze
  HINT_COLORS = { 'r' => :red, 'w' => :white }.freeze

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
