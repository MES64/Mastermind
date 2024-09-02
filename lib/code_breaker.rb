# frozen_string_literal: true

require_relative 'game'

# Code Breaker has a method for making a guess
class CodeBreaker
  def initialize; end

  def make_guess
    p Game::GUESS_COLORS.sample(4)
  end
end
