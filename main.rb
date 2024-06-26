require "colorize"
require "pry-byebug"

colors = %i[
  red
  green
  blue
  yellow
  black
  white
]

code = Array.new(4)
code = code.map { Random.rand(6) }

code.each { |num| print "#{colors[num].to_s.colorize(colors[num])} " }
puts

puts "Make your 4-number guess"
# rubocop:disable Layout/LineLength
puts "1: #{'red'.colorize(:red)}, 2: #{'green'.colorize(:green)}, 3: #{'blue'.colorize(:blue)}, 4: #{'yellow'.colorize(:yellow)}, 5: #{'black'.colorize(:black)}, 6: #{'white'.colorize(:white)}"
# rubocop:enable Layout/LineLength

guess = gets.chomp.split
guess = guess.map { |num| Integer(num) - 1 }

correct_same_pos = 0
correct_diff_pos = 0
checked = []

4.times do |i|
  if guess[i] == code[i]
    correct_same_pos += 1
    checked << i
  end
end

temp_code = code.map(&:clone)
temp_guess = guess.map(&:clone)
temp_guess.delete_if.with_index { |_, i| checked.include? i }
temp_code.delete_if.with_index { |_, i| checked.include? i }

temp_guess.each do |num|
  if temp_code.include?(num)
    temp_code.delete_at(temp_code.index(num) || temp_code.length)
    correct_diff_pos += 1
  end
end

puts correct_same_pos
puts correct_diff_pos
