# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/code_breaker'

board = Board.new
puts board
code_breaker = CodeBreaker.new
code_breaker.make_guess(board, 0)
puts board
