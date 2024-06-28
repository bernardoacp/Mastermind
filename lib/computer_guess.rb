def get_feedback(feedback)
  print "Give feedback to the computer's guess\n\n"

  begin
    print "Colored pegs: "
    feedback[0] = Integer(gets.chomp)
    print "White pegs:   "
    feedback[1] = Integer(gets.chomp)
    puts
  rescue ArgumentError
    abort("Invalid input.")
  end

  abort("Invalid input.") if feedback.any(&:negative?) || feedback.sum > 4

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

  begin
    guess = gets.chomp.split
    guess = guess.map { |num| Integer(num) - 1 }
    puts
  rescue ArgumentError
    abort("Invalid guess.")
  end

  abort("Invalid guess.") if guess.length != 4 || guess.any? { |color| color >= 6 || color.negative? }

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

    if turns == 12
      puts "You won!!!"
      return
    end

    puts "-------- Turn #{turns + 1} --------"
    puts

    print_player_code(colors, code)

    (total..3).each { |num| guess[num] += 1 }

    print_computer_guess(colors, guess)

    feedback = get_feedback(feedback)
    total = feedback.sum if feedback.sum > total
    turns += 1
  end

  while feedback[0] != 4

    if turns == 12
      puts "You won!!!"
      return
    end

    puts "-------- Turn #{turn + 1} --------"
    puts

    print_player_code(colors, code)

    guess.shuffle!

    print_computer_guess(colors, guess)

    feedback = get_feedback(feedback)
    turns += 1
  end

  puts "You lost."
end
