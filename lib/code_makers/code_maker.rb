# frozen_string_literal: true

require_relative '../modules/pin_creatable'
require_relative '../modules/hint_creatable'

# Code Maker holds the secret code
# It has methods for creating the code (initialize), giving a hint, and revealing the code
class CodeMaker
  include PinCreatable
  include HintCreatable

  def initialize(code)
    @code = code
    @code_tally = code.tally
  end

  def give_hint(board, guess_number)
    board.add_hint(create_hint(@code, board), guess_number)
  end

  def reveal_code
    puts "Secret Code: #{create_guess_pins(@code).join(' ')}"
  end
end
