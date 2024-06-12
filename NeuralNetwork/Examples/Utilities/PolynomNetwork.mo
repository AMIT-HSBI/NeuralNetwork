within NeuralNetwork.Examples.Utilities;

block PolynomNetwork "Neural Network approximating y = u*u + 0.5*u - 2.0 on interval [-1,1]"
  extends NeuralNetwork.Networks.Interfaces.Network(numInputs = 1, numOutputs = 1);
  Layer.Input inputLayer(
    numInputs = 1,
    numNeurons = 2,
    weights = layer_1_weights,
    bias = layer_1_bias,
    f = NeuralNetwork.Types.ActivationFunction.Hyperbolic_tangent
  ) annotation(
    Placement(transformation(origin = {-66, 0}, extent = {{-30, -30}, {30, 30}})));
  Layer.Output outputLayer(
    numInputs = 2,
    numNeurons = 1,
    weights = layer_2_weights,
    bias = layer_2_bias
  ) annotation(
    Placement(transformation(origin = {50, 0}, extent = {{-30, -30}, {30, 30}})));
  
  parameter Real[2,1] layer_1_weights = {{-0.961315}, {-1.00143}};
  parameter Real[2] layer_1_bias = {0.931904, -1.06645};
  parameter Real[1,2] layer_2_weights = {{-2.25319, 1.36178}};
  parameter Real[1] layer_2_bias = {0.70991};
equation
  connect(u, inputLayer.u);
  connect(inputLayer.y, outputLayer.u) annotation(
    Line(points = {{-48, 0}, {30, 0}}, color = {0, 0, 127}, thickness = 0.5));
  connect(outputLayer.y, y);
end PolynomNetwork;
