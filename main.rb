# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/code_breaker'
require_relative 'lib/code_maker'

board = Board.new
code_breaker = CodeBreaker.new
code_maker = CodeMaker.new

puts board

code_breaker.make_guess(board, 0)
p board.latest_guess
code_maker.give_hint(board, 0)
p board.latest_hint
p code_maker.code

puts board
