# frozen_string_literal: true

require_relative 'code_maker'

# Computer Code Maker
class ComputerCodeMaker < CodeMaker
  def initialize(combinations)
    super(combinations.sample)
  end
end
