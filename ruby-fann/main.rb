require 'ruby-fann'
# require 'ruby_fann/neural_network'
require 'ruby_fann/neurotica' #только для graphviz

inputs = [
    [-1,-1],
    [-1, 1],
    [ 1,-1],
    [ 1, 1]
]
answers = [
      [0],
      [1],
      [1],
      [0]
]

train = RubyFann::TrainData.new(
  inputs: inputs,
  desired_outputs: answers
)

fann = RubyFann::Standard.new(
  num_inputs: 2,
  hidden_neurons: [2, 1],
  num_outputs: 1
)
fann.train_on_data(
  train,
  1000, # 1000 max_epochs
  1, # 1 errors between reports
  0.1 # 0.1 desired MSE (mean-squared-error)
)

inputs.each do |pair|
  puts "#{pair}: #{fann.run(pair)}"
end

fann.get_neurons.each {|n| p n}

#вывод графической схемы
graph=RubyFann::Neurotica.new()
graph.graph(fann, 'xor_nn.png')
