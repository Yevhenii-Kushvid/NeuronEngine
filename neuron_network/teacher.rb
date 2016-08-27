require './neuron_network/neuron.rb'

class Teacher

  def initialize(speed_of_teaching = 0.1)
    @speed_of_teaching = speed_of_teaching
  end

  # inputs  = Array of inputs
  # answers = Array of answers for questions(inputs)
  def teach(neuron, inputs, answers)

    if inputs.size == answers.size
      inputs.size.times { |iteration|
        error = answers[iteration] - neuron.solv(inputs[iteration])
        error = - 2 * ( neuron.solv(inputs[iteration]) - answers[iteration] )
        neuron.study(@speed_of_teaching, error)
      }
      true
    else
      return Exception.new('Amount of incoming inputs and answers are need to be eql.')
    end

  end

  def test(neuron, inputs, answers)
    result = Array.new(inputs.size)

    if inputs.size == answers.size
      answers.size.times { |iteration|
        puts neuron.solv(inputs[iteration])
        result[iteration] = neuron.solv(inputs[iteration]) == answers[iteration]
      }
      result
    else
      return Exception.new('Amount of incoming inputs and answers are need to be eql.')
    end

  end

end