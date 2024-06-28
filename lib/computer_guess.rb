def get_feedback(feedback)
  puts "Give feedback to the computer's guess"

  print "Colored pegs: "
  feedback[0] = gets.chomp
  feedback[0] = Integer(feedback[0])

  print "White pegs:   "
  feedback[1] = gets.chomp
  feedback[1] = Integer(feedback[1])
end

def print_computer_guess(guess)
  print "Computer guess:\n\n"
  guess.each { |num| print "#{colors[num].to_s.colorize(colors[num])} " }
  print "\n\n"
end

def computer_guess(colors, code)
  guess = Array.new(4, 0)

  print_computer_guess(guess)

  feedback = Array.new(2)
  feedback = get_feedback(feedback)

  total = feedback.sum

  while total != 4
    (total..3).each { |num| guess[num] += 1 }

    print_computer_guess(guess)

    feedback = get_feedback(feedback)

    total = feedback.sum if feedback.sum > total
  end

  while feedback[0] != 4
    guess.shuffle!

    print_computer_guess(guess)

    feedback = get_feedback(feedback)
  end
end
