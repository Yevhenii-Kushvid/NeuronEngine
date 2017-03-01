require 'tensorflow'
graph = Tensorflow::Graph.new
input1 = graph.placeholder('input1', Tensorflow::TF_DOUBLE, [2,3])
input2 = graph.placeholder('input2', Tensorflow::TF_DOUBLE, [2,3])
graph.define_op("Add", 'output', [input1, input2], "",nil)

session = Tensorflow::Session.new
session.extend_graph(graph)

input1 = Tensorflow::Tensor.new([[1.0,3.0, 5.0],[2.0,4.0, 7.0]])
input2 = Tensorflow::Tensor.new([[-5.0,1.2,4.5],[8.0,2.3, 3.1]])
result = session.run({"input1" => input1.tensor, "input2" => input2.tensor},["output"],nil)
print result[0], "\n"
