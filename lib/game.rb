# frozen_string_literal: true

# Constants: Guess colors available, hint colours available,
class Game
  GUESS_COLORS = { 'r' => :red, 'g' => :green, 'y' => :yellow, 'b' => :blue, 'w' => :white, 'd' => :black }.freeze
  HINT_COLORS = %i[red white].freeze
end
