require './neuron_network/neuron.rb'
require './neuron_network/teacher.rb'
require './helpers/converter.rb'

neuron = Neuron.new(2)
teacher = Teacher.new(0.1)

#####################################
#   PROBLEMS FOR NEURON
#####################################
# it can study for logical operations
inputs = [
    [-1,-1],
    [-1, 1],
    [ 1,-1],
    [ 1, 1]
]
answers = [
     -1,
     -1,
      1,
      1
]

# it can study for figures

# MATRIX PROBLEM FOR NEURON
# problem #1
# problem = [
#     [1, 1, 1, 1, 1, 1,-1],
#     [0, 1, 0, 1, 0, 0,-1],
#     [1, 1, 1, 1,-1,-1,-1],
#     [0, 1, 0, 0,-1, 0,-1],
#     [1, 1,-1,-1,-1,-1,-1],
#     [0, 0,-1, 0,-1, 0,-1],
#    [-1,-1,-1,-1,-1,-1,-1]
# ]
#
# solved_problem = [
#     [1, 1, 1, 1, 1, 1,-1],
#     [1, 1, 1, 1, 1,-1,-1],
#     [1, 1, 1, 1,-1,-1,-1],
#     [1, 1, 1,-1,-1,-1,-1],
#     [1, 1,-1,-1,-1,-1,-1],
#     [1,-1,-1,-1,-1,-1,-1],
#    [-1,-1,-1,-1,-1,-1,-1]
# ]

# problem #2
# problem = [
#     [1, 1, 1, 1,-1,-1,-1,-1],
#     [0, 1, 0, 1,-1, 0,-1, 0],
#     [1, 1, 1, 1,-1,-1,-1,-1],
#     [1, 1, 1, 1,-1,-1,-1,-1],
#     [0, 1, 0, 1,-1, 0,-1, 0],
#     [1, 1, 1, 1,-1,-1,-1,-1]
# ]
#
# solved_problem = [
#     [1, 1, 1, 1,-1,-1,-1,-1],
#     [1, 1, 1, 1,-1,-1,-1,-1],
#     [1, 1, 1, 1,-1,-1,-1,-1],
#     [1, 1, 1, 1,-1,-1,-1,-1],
#     [1, 1, 1, 1,-1,-1,-1,-1],
#     [1, 1, 1, 1,-1,-1,-1,-1]
# ]

# problem #3
problem = [
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
]

solved_problem = [
    [1, 1, 1, 1, 1, 1,-1],
    [1, 1, 1, 1, 1,-1,-1],
    [1, 1, 1, 1,-1,-1,-1],
    [1, 1, 1,-1,-1,-1,-1],
    [1, 1,-1,-1,-1,-1,-1],
    [1,-1,-1,-1,-1,-1,-1],
   [-1,-1,-1,-1,-1,-1,-1],
]

#####################################
#   TEACH NEURON FOR LOGIC FUNCTION
#####################################

# puts "\nBefore\n"
# p neuron
#
# puts "\nTEST\n"
# puts teacher.test(neuron, inputs, answers)
#
# puts "\nTeach\n"
# result = false
# while(not result)
#   result = true
#   teacher.teach(neuron, inputs, answers)
#   results_by_points = teacher.test(neuron, inputs, answers)
#
#   results_by_points.each {|point_result|
#     result = false unless point_result
#   }
# end
#
# puts "\nAfter\n"
# p neuron
#
# puts "\nTEST\n"
# puts teacher.test(neuron, inputs, answers)


#####################################
#   TEACH NEURON FOR MATRIX IMAGE
#####################################

hash_of_problem = Converter.martix_to_hash_of_points problem
p hash_of_problem

hash_of_solved_problem = Converter.martix_to_hash_of_points solved_problem
p teacher.test_matrix(neuron, hash_of_problem, solved_problem)

puts "\nTeach\n"
result = false
while(not result)
  teacher.teach_matrix(neuron, hash_of_problem, hash_of_solved_problem)
  puts "================================================================"
  p neuron
  puts "================================================================"
  result = true
  results_by_points = teacher.test_matrix(neuron, hash_of_problem, hash_of_solved_problem)

  results_by_points.each {|point_result|
    result = false unless point_result
  }
  p results_by_points
end

puts "\nAfter\n"
p neuron

p teacher.test_matrix(neuron, hash_of_problem, solved_problem)