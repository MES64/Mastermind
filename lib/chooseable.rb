# frozen_string_literal: true

# Includes choose method for user input
module Chooseable
  def choose(message, options)
    puts message
    choice = gets.chomp.chars until choice && options.include?(choice)
    choice
  end
end
