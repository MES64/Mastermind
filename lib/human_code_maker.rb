# frozen_string_literal: true

require_relative 'code_maker'
require_relative 'chooseable'

# Human Code Maker
class HumanCodeMaker < CodeMaker
  include Chooseable

  def initialize(combinations)
    code = choose("Enter Secret Code (e.g. rgbb) from:\n#{string_guess_pin_colors}", combinations)
    super(code)
    reveal_code
  end

  def give_hint(board, guess_number)
    reveal_code
    super(board, guess_number)
  end
end
