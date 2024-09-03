# frozen_string_literal: true

require_relative 'board'
require_relative 'code_breaker'
require_relative 'code_maker'
require_relative 'pin_creatable'

# Game contains info about the board, the players, the number of guesses made, and the result
# It has a method to play the game
class Game
  include PinCreatable

  MAX_GUESSES = 12

  def initialize
    @board = Board.new(MAX_GUESSES)
    @code_maker = CodeMaker.new
    @code_breaker = CodeBreaker.new
    @guess_number = 0
    @result = nil
  end

  def play
    puts @board
    play_turn while @result.nil?
    puts @result
    puts "Secret Code: #{create_guess_pins(@code_maker.code).join(' ')}"
  end

  private

  def play_turn
    @code_breaker.make_guess(@board, @guess_number)
    @code_maker.give_hint(@board, @guess_number)
    puts @board
    @guess_number += 1
    check_game_over
  end

  def check_game_over
    if @board.latest_hint == %w[r r r r]
      @result = 'The code is cracked! The code breaker wins!'
    elsif @guess_number == MAX_GUESSES
      @result = 'There are no more guesses! The code maker wins!'
    end
  end
end
