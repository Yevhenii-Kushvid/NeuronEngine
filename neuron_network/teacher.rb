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

        # error = answers[iteration] - neuron.solv(inputs[iteration])
        error = -2 * (neuron.solv(inputs[iteration]) - answers[iteration])

        neuron.study(@speed_of_teaching, error)
      }
      true
    elsetest_neural_network
      return Exception.new('Amount of incoming inputs and answers are need to be eql.')
    end

  end

  def teach_matrix(neuron, problem, solved_problem)

    problem_points = get_asked_points(problem)
    problem_points.size.times { |iteration|
      row_number = problem_points[iteration][0]
      position_in_row = problem_points[iteration][1]

      # error = solved_problem[row_number][position_in_row] - neuron.solv([row_number, position_in_row])
      error = -2 * (neuron.solv([row_number, position_in_row]) - solved_problem[row_number][position_in_row])

      puts "ERROR = #{error}"
      neuron.study(@speed_of_teaching, error)
    }
    true
  end

  def teach_neural_network(neural_network, inputs, answers)

    if inputs.size == answers.size
      inputs.size.times { |iteration|
        neural_network.solv(inputs[iteration])
        neural_network.back_propagation(output: answers[iteration], speed_of_studying: @speed_of_teaching)
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
        result[iteration] = neuron.solv(inputs[iteration]).round == answers[iteration]
      }
      result
    else
      return Exception.new('Amount of incoming inputs and answers are need to be eql.')
    end
  end

  # 0 - first class, 1 - second class, 2 - question
  def test_matrix(neuron, problem, solved_problem)
    #############################
    # check of neuron is valid
    # 2 inputs for position
    #############################
    # 1 input for image if grey
    # 3 inputs for image if colored without opacity
    # 4 inputs for image if colored with opacity
    #############################
    return Exception.new('Number of coordinates must be equal to number if inputs of neuron.') unless neuron.number_of_inputs == 2

    problem_points = get_asked_points(problem)

    result = Array.new(problem_points.count)
    result.length.times { |iteration|
      row_number = problem_points[iteration][0]
      position_in_row = problem_points[iteration][1]

      result[iteration] = neuron.solv(problem_points[iteration]).round == solved_problem[row_number][position_in_row]
    }
    result
  end

  def test_neural_network(neural_network, inputs, answers)
    result = Array.new(inputs.size)

    if inputs.size == answers.size
      answers.size.times { |iteration|
        answer = answers[iteration]
        answer = [answer] unless answer.kind_of? Array

        puts "input: #{inputs[iteration]} - #{neural_network.solv(inputs[iteration]).collect{|output| output.round }} == #{answer}"
        result[iteration] = neural_network.solv(inputs[iteration]).collect{|output| output.round } == answer


      }
      result
    else
      return Exception.new('Amount of incoming inputs and answers are need to be eql.')
    end
  end

  def get_asked_points(problem)
    problem.collect { |row_number, position_hash|
      points = position_hash.collect { |position_in_row, value|
        [row_number, position_in_row] if value == 0
      }
      points if points.compact.count > 0
    }.flatten(1).compact
  end

end