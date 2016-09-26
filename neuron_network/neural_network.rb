require './neuron_network/neuron'

class NeuralNetwork

  attr_accessor :structure

  # structure = [ 2, 1 ]
  # result = Array of Neurons [ [Neuron], [Neuron, Neuron]]
  def initialize( number_of_inputs: 2, structure: [2, 1])
    @number_of_inputs = number_of_inputs
    @structure = {}

    structure.size.times do |number_of_layer|
      @structure[number_of_layer] = []

      layer_amount = structure[number_of_layer]

      layer_amount.times do |index|
        if number_of_layer == 0
          @structure[number_of_layer] << Neuron.new(@number_of_inputs)
        else
          @structure[number_of_layer] << Neuron.new(structure[number_of_layer - 1])
        end # end of if
      end # end of layer_amount

    end # end of structure
  end #end of initialize

  def back_propagation(output: nil, speed_of_studying: 0.1)

    return Exception.new("Have not obtained answers") unless output

    @structure.size.times { |index|
      layer_index = @structure.size - index - 1

      if layer_index == (@structure.size - 1)
        layer = @structure[layer_index]
        layer.each_with_index { |neuron, neuron_index|

          output = [output] unless output.kind_of? Array
          error = (output[neuron_index] - neuron.result.round)

          neuron.study(speed_of_studying, error )
        }
      else
        layer = @structure[layer_index]
        layer.each_with_index { |neuron, neuron_index|
          error = 0.0
          next_layer = @structure[layer_index + 1]
          next_layer.each_with_index { |next_neuron, _|
            error += next_neuron.weights[neuron_index] * next_neuron.error
          }
          neuron.study(speed_of_studying, error )
        }
      end
    }
  end

  def solv(input)
    @output = []

    @structure.each{|_index, layer|
      layer.each{|neuron_in_layer|
        @output << neuron_in_layer.solv(input)
      }
      input = @output
      @output = []
    }
    @output = input
  end
end
