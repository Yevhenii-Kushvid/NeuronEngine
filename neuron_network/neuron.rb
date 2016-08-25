class Neuron

  def initialize(number_of_inputs, threshold = 0.1)
    @threshold = threshold
    @number_of_inputs = number_of_inputs
    @weights = Array.new(@number_of_inputs, threshold)
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
    @result = func @sum

    @result
  end

  def study(speed_of_studying, error)
    @number_of_inputs.times{ |iteration|
      @weights[iteration] += error * speed_of_studying * @input[iteration]
    }

    @threshold += error * speed_of_studying
  end

  def func(x)
    sign x
  end

  private

  def function(x)
    sign x
  end

  def sign(x)
    x >= 0 ? 1 : -1
  end

end