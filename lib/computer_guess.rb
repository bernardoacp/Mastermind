def get_feedback(feedback)
  print "Give feedback to the computer's guess\n\n"

  print "Colored pegs: "
  feedback[0] = gets.chomp.to_i

  print "White pegs:   "
  feedback[1] = gets.chomp.to_i

  puts

  feedback
end

def print_computer_guess(colors, guess)
  print "Computer guess:\n\n"
  guess.each { |num| print "#{colors[num].to_s.colorize(colors[num])} " }
  print "\n\n"
end

def print_player_code(colors, code)
  print "Your code:\n\n"
  code.each { |num| print "#{colors[num].to_s.colorize(colors[num])} " }
  print "\n\n"
end

def computer_guess(colors)
  puts "Create your 4-number secret code"
  # rubocop:disable Layout/LineLength
  puts "1: #{'red'.colorize(:red)}, 2: #{'green'.colorize(:green)}, 3: #{'blue'.colorize(:blue)}, 4: #{'yellow'.colorize(:yellow)}, 5: #{'black'.colorize(:black)}, 6: #{'white'.colorize(:white)}"
  # rubocop:enable Layout/LineLength
  puts

  code = gets.chomp.split
  code = code.map { |num| Integer(num) - 1 }

  puts "-------- Turn 1 --------"
  puts

  print_player_code(colors, code)

  guess = Array.new(4, 0)

  print_computer_guess(colors, guess)

  feedback = Array.new(2)
  feedback = get_feedback(feedback)

  total = feedback.sum

  turns = 1

  while total != 4

    break if turns == 12

    puts "-------- Turn #{turns + 1} --------"
    puts

    print_player_code(colors, code)

    (total..3).each { |num| guess[num] += 1 }

    print_computer_guess(colors, guess)

    feedback = get_feedback(feedback)

    total = feedback.sum if feedback.sum > total

    turns += 1
  end

  if turns == 12
    puts "You won!!!"
    return
  end

  while feedback[0] != 4

    break if turn == 12

    puts "-------- Turn #{turn + 1} --------"
    puts

    print_player_code(colors, code)

    guess.shuffle!

    print_computer_guess(colors, guess)

    feedback = get_feedback(feedback)

    turns += 1
  end

  if turns == 12
    puts "You won!!!"
    return
  end

  puts "You lost."
end
