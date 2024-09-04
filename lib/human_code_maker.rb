# frozen_string_literal: true

require_relative 'code_maker'

# Human Code Maker
class HumanCodeMaker < CodeMaker
  def initialize(combinations)
    puts 'Enter Secret Code (e.g. rgbb) from:'
    puts string_guess_pin_colors
    code = gets.chomp.chars until code && combinations.include?(code)
    super(code)
  end
end
