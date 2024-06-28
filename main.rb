require "colorize"
require "pry-byebug"
require_relative "lib/player_guess"
require_relative "lib/computer_guess"

colors = %i[
  red
  green
  blue
  yellow
  black
  white
]

print "Choose game mode:\n\n"
puts "1: Guess the computer's secret code"
print "2: Create a secret code for the computer to guess\n\n"
game_mode = gets.chomp.to_i
puts

if game_mode == 1
  player_guess(colors)
elsif game_mode == 2
  computer_guess(colors)
else
  puts "Invalid input."
end
