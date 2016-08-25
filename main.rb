require './neuron_network/neuron.rb'
require './neuron_network/teacher.rb'

neuron = Neuron.new(2)
teacher = Teacher.new(0.1)

inputs = [
    [-1.0, -1.0],
    [-1.0,  1.0],
    [1.0 , -1.0],
    [1.0 ,  1.0]
]

answers = [
     -1.0,
     -1.0,
     -1.0,
     1.0
]

puts "\nBefore\n"
p neuron

puts "\nTEST\n"
puts teacher.test(neuron, inputs, answers)

puts "\nTeach\n"
result = false
while(not result)
  result = teacher.teach(neuron, inputs, answers)
end

puts "\nAfter\n"
p neuron

puts "\nTEST\n"
puts teacher.test(neuron, inputs, answers)
