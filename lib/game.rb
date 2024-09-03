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
  PIN_GROUP_SIZE = 4
  COMBINATIONS = GUESS_COLORS.keys.repeated_permutation(PIN_GROUP_SIZE).map { |perm| perm }.freeze

  def initialize
    @board = Board.new(MAX_GUESSES, PIN_GROUP_SIZE)
    @code_maker = CodeMaker.new(COMBINATIONS)
    @code_breaker = CodeBreaker.new
    @guess_number = 0
    @result = nil
  end

  def play
    puts @board
    play_turn while @result.nil?
    puts @result
    @code_maker.reveal_code
  end

  private

  def play_turn
    @code_breaker.make_guess(@board, @guess_number, COMBINATIONS)
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
