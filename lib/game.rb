# frozen_string_literal: true

require_relative 'board'
require_relative 'code_breakers/human_code_breaker'
require_relative 'code_makers/human_code_maker'
require_relative 'code_breakers/computer_code_breaker'
require_relative 'code_makers/computer_code_maker'
require_relative 'modules/pin_creatable'
require_relative 'modules/chooseable'

# Game contains info about the board, the players, the number of guesses made, and the result
# It has a method to play the game
# It has constants for the game settings, which never change at the moment
class Game
  include PinCreatable
  include Chooseable

  MAX_GUESSES = 12
  PIN_GROUP_SIZE = 4
  COMBINATIONS = GUESS_COLORS.keys.repeated_permutation(PIN_GROUP_SIZE).map { |perm| perm }.freeze
  PLAYER_CHOICE = [%w[m], %w[b]].freeze

  private_constant :MAX_GUESSES, :PIN_GROUP_SIZE, :COMBINATIONS, :PLAYER_CHOICE

  def initialize
    create_players
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

  def create_players
    choice = choose('Are you the Code Maker (m) or Code Breaker (b)?', PLAYER_CHOICE)
    @code_maker = choice == ['m'] ? HumanCodeMaker.new(COMBINATIONS) : ComputerCodeMaker.new(COMBINATIONS)
    @code_breaker = choice == ['b'] ? HumanCodeBreaker.new(COMBINATIONS) : ComputerCodeBreaker.new(COMBINATIONS)
  end

  def play_turn
    @code_breaker.make_guess(@board, @guess_number)
    @code_maker.give_hint(@board, @guess_number)
    puts @board
    @guess_number += 1
    check_game_over
  end

  def check_game_over
    if @board.latest_hint[:reds] == 4
      @result = 'The code is cracked! The code breaker wins!'
    elsif @guess_number == MAX_GUESSES
      @result = 'There are no more guesses! The code maker wins!'
    end
  end
end
