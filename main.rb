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

puts "Choose game mode:"
puts "1: Guess the computer's secret code"
print "2: Create a secret code for the computer to guess\n\n"
game_mode = gets

if game_mode == 1
  player_guess(colors)
elsif game_mode == 2
  # rubocop:disable Layout/LineLength
  puts "Create your 4-number secret code"
  puts "1: #{'red'.colorize(:red)}, 2: #{'green'.colorize(:green)}, 3: #{'blue'.colorize(:blue)}, 4: #{'yellow'.colorize(:yellow)}, 5: #{'black'.colorize(:black)}, 6: #{'white'.colorize(:white)}"
  puts
  # rubocop:enable Layout/LineLength
  guess = gets.chomp.split
  guess = guess.map { |num| Integer(num) - 1 }

  computer_guess(colors, code)
end
