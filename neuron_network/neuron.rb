class Neuron
  attr_reader :number_of_inputs, :result, :weights, :input, :error, :deriv

  def initialize(number_of_inputs, threshold = 0.1)
    @threshold = threshold
    @number_of_inputs = number_of_inputs
    @weights = Array.new(@number_of_inputs, threshold)
    @delta  = 0


  end

  def solv(input)
    @sum = @threshold
    @input = input

    if @input.size == @number_of_inputs
      @number_of_inputs.times{ |iteration|
        @sum += @input[iteration] * @weights[iteration]
      }
    else
      return Exception.new 'Number of inputs is wrong'
    end

    @result = function @sum
    # puts "#{input} == #{@result}"
    @result
  end

  def study(speed_of_studying, error)
    @error       = error

    vector_of_studying = speed_of_studying * @error * derivation( @result )
    @number_of_inputs.times{ |iteration|
      @delta = vector_of_studying * @input[iteration] + @delta * 0.8
      @weights[iteration] += @delta
    }
    @threshold += vector_of_studying
  end

  def function(x)
    Math::tanh x
  end

  def derivation x
    1 - Math::tanh(x)**2

    # derivation_of_sigmoid
    # x * (1.0 - x)
  end

  private

  def sigmoid(x)
    1 / (1 - Math::exp( -x ))
  end

  def sign(x)
    x >= 0 ? 1 : -1
  end

end