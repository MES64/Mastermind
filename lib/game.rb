# frozen_string_literal: true

require_relative 'board'

# Constants: Guess colors available, hint colours available,
class Game
  GUESS_COLORS = { 'r' => :red, 'g' => :green, 'y' => :yellow, 'b' => :blue, 'w' => :white, 'd' => :black }.freeze
  HINT_COLORS = %i[red white].freeze
  COMBINATIONS = Game::GUESS_COLORS.keys.repeated_permutation(Board::GUESSES_PER_ROW).map { |perm| perm }.freeze
end
