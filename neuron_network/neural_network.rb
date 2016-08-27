require './neuron_network/neuron'

class NeuralNetwork

  # structure = [ 2, 1 ]
  # result = Array of Neurons [ [Neuron], [Neuron, Neuron]]
  def initialize(number_of_inputs, structure)
    @number_of_inputs = number_of_inputs
    @structure = {}

    structure.size.times do |number_of_layer|
      @structure[number_of_layer] = []

      layer_amount = structure[number_of_layer]
      layer_amount.times do
        if number_of_layer == 0
          @structure[number_of_layer] << Neuron.new(@number_of_inputs)
        else
          @structure[number_of_layer] << Neuron.new(structure[number_of_layer - 1])
        end # end of if
      end # end of layer_amount

    end # end of structure
  end #end of initialize

  def solv(input)

  end

  def study(speed_of_studying, error)

  end
end

p NeuralNetwork.new(2, [2,1])