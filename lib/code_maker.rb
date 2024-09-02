# frozen_string_literal: true

# Code Maker holds the secret code
# It has methods for creating the code and giving a hint
class CodeMaker
  attr_reader :code

  def initialize
    @code = Game::COMBINATIONS.sample
  end
end
