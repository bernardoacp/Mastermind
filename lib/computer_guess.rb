def computer_guess(colors, code)
  guess = Array.new(4, 0)

  print "Computer guess:\n\n"
  guess.each { |num| print "#{colors[num].to_s.colorize(colors[num])} " }
  print "\n\n"

  feedback = gets.chomp.split
  feedback = feedback.map { |num| Integer(num) }

  # binding.pry

  total = feedback.sum

  while total != 4
    (total..3).each { |num| guess[num] += 1 }

    print "Computer guess:\n\n"
    guess.each { |num| print "#{colors[num].to_s.colorize(colors[num])} " }
    print "\n\n"

    feedback = gets.chomp.split
    feedback = feedback.map { |num| Integer(num) }

    total = feedback.sum if feedback.sum > total
  end

  while feedback[0] != 4
    guess.shuffle!

    print "Computer guess:\n\n"
    guess.each { |num| print "#{colors[num].to_s.colorize(colors[num])} " }
    print "\n\n"

    feedback = gets.chomp.split
    feedback = feedback.map { |num| Integer(num) }
  end
end
