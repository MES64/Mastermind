# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/code_breaker'
require_relative 'lib/code_maker'

board = Board.new
puts board
code_breaker = CodeBreaker.new
code_breaker.make_guess(board, 0)
puts board

puts ''
p CodeMaker.new.code
p CodeMaker.new.code
p CodeMaker.new.code
p CodeMaker.new.code
p CodeMaker.new.code
