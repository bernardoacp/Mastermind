def generate_code
  Array.new(4).map { Random.rand(6) }
end

def evaluate_guess(guess, code)
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
    if temp_code.include? num
      temp_code.delete_at(temp_code.index(num) || temp_code.length)
      correct_diff_pos += 1
    end
  end
  [correct_same_pos, correct_diff_pos]
end

def player_guess(colors)
  code = generate_code

  winner = false
  12.times do |turn|
    puts "-------- Turn #{turn + 1} --------"
    puts
    puts "Make your 4-number guess"
    # rubocop:disable Layout/LineLength
    puts "1: #{'red'.colorize(:red)}, 2: #{'green'.colorize(:green)}, 3: #{'blue'.colorize(:blue)}, 4: #{'yellow'.colorize(:yellow)}, 5: #{'black'.colorize(:black)}, 6: #{'white'.colorize(:white)}"
    # rubocop:enable Layout/LineLength
    puts

    guess = gets.chomp.split
    guess = guess.map { |num| Integer(num) - 1 }
    puts

    print "Your guess:\n\n"
    guess.each { |num| print "#{colors[num].to_s.colorize(colors[num])} " }
    print "\n\n"

    feedback = evaluate_guess(guess, code)

    if feedback[0] == 4
      puts "You won!!!"
      winner = true
      break
    end

    puts "Colored pegs: #{feedback[0]}"
    puts "White pegs:   #{feedback[1]}"
    print "\n\n"
  end

  return if winner

  print "You lost, the correct code was:\n\n"
  code.each { |num| print "#{colors[num].to_s.colorize(colors[num])} " }
  puts
end
