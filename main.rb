require "colorize"

colors = %i[
  red
  green
  blue
  yellow
  black
  white
]

code = Array.new(6)
code = code.map { Random.rand(6) }

code.each { |num| print "#{colors[num].to_s.colorize(colors[num])} " }
puts
