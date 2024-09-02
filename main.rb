# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/code_breaker'

board = Board.new
code_breaker = CodeBreaker.new
code_breaker.make_guess
