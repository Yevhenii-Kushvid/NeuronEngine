old_x = 0
new_x = 6

gamma = 0.01

precision = 0.00001


# def function(x)
#   x**4 - 3 * x**3 + 2
# end
#
# def derivation_1(x)
#   4 * x**3 - 9 * x**2
# end

def function x
  Math.tanh x
end

def derivation_1 x
  1 / ( Math.cosh(x) * Math.cosh(x) )
end

new_x.times do |x|
  puts function x
end

puts '===================='

new_x.times do |x|
  puts derivation_1 x
end

puts '===================='

while (new_x - old_x).abs > precision
  old_x = new_x
  new_x = old_x - gamma * derivation_1(old_x)
end

puts "Local minimum occurs at #{new_x}"
