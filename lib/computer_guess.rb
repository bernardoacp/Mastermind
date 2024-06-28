def get_feedback(feedback)
  print "Give feedback to the computer's guess\n\n"

  print "Colored pegs: "
  feedback[0] = gets.chomp
  feedback[0] = Integer(feedback[0])

  print "White pegs:   "
  feedback[1] = gets.chomp
  feedback[1] = Integer(feedback[1])

  feedback
end

def print_computer_guess(colors, guess)
  print "Computer guess:\n\n"
  guess.each { |num| print "#{colors[num].to_s.colorize(colors[num])} " }
  print "\n\n"
end

def computer_guess(colors)
  puts "Create your 4-number secret code"
  # rubocop:disable Layout/LineLength
  puts "1: #{'red'.colorize(:red)}, 2: #{'green'.colorize(:green)}, 3: #{'blue'.colorize(:blue)}, 4: #{'yellow'.colorize(:yellow)}, 5: #{'black'.colorize(:black)}, 6: #{'white'.colorize(:white)}"
  # rubocop:enable Layout/LineLength
  puts

  guess = Array.new(4, 0)

  print_computer_guess(colors, guess)

  feedback = Array.new(2)
  feedback = get_feedback(feedback)

  total = feedback.sum

  while total != 4
    (total..3).each { |num| guess[num] += 1 }

    print_computer_guess(colors, guess)

    feedback = get_feedback(feedback)

    total = feedback.sum if feedback.sum > total
  end

  while feedback[0] != 4
    guess.shuffle!

    print_computer_guess(colors, guess)

    feedback = get_feedback(feedback)
  end
end
