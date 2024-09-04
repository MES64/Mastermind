# frozen_string_literal: true

require_relative 'board'
require_relative 'human_code_breaker'
require_relative 'human_code_maker'
require_relative 'computer_code_breaker'
require_relative 'computer_code_maker'
require_relative 'pin_creatable'

# Game contains info about the board, the players, the number of guesses made, and the result
# It has a method to play the game
# It has constants for the game settings, which never change at the moment
class Game
  include PinCreatable

  MAX_GUESSES = 12
  PIN_GROUP_SIZE = 4
  COMBINATIONS = GUESS_COLORS.keys.repeated_permutation(PIN_GROUP_SIZE).map { |perm| perm }.freeze
  PLAYER_CHOICE = %w[m b].freeze

  def initialize
    puts 'Are you the Code Maker (m) or Code Breaker (b)?'
    choice = gets.chomp until choice && PLAYER_CHOICE.include?(choice)
    @code_maker = choice == 'm' ? HumanCodeMaker.new(COMBINATIONS) : ComputerCodeMaker.new(COMBINATIONS)
    @code_breaker = choice == 'b' ? HumanCodeBreaker.new : ComputerCodeBreaker.new

    @board = Board.new(MAX_GUESSES, PIN_GROUP_SIZE)
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
