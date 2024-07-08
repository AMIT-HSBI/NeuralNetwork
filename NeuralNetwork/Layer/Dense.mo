within NeuralNetwork.Layer;

block Dense "Block for a dense neural network layer"
  extends Interfaces.Layer(final numInputs = size(weights, 2), final numNeurons = size(bias, 1));

  parameter Real weights[:, :]  "Weight table of a fully connected layer";
  parameter Real bias[:]        "Bias table of a fully connected layer";
  replaceable function f = NeuralNetwork.ActivationFunctions.ActivationFunction "Activation function of the layer";
equation
  y = f(weights * u + bias);

  annotation(
    Icon(graphics = {
      Ellipse(origin = {0, -60}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {0, -30}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {0, -10}, lineColor = {45, 45, 45}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-2, 2}, {2, -2}}),
      Ellipse(origin = {0, 0}, lineColor = {45, 45, 45}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-2, 2}, {2, -2}}),
      Ellipse(origin = {0, 10}, lineColor = {45, 45, 45}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-2, 2}, {2, -2}}),
      Ellipse(origin = {0, 30}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {0, 60}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Line(points = {{-38, -8}, {-12, -56}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{-38, -4}, {-12, -26}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{-38, 4}, {-12, 26}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{-38, 8}, {-12, 56}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, -56}, {38, -8}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, -26}, {38, -4}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, 26}, {38, 4}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, 56}, {38, 8}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Text(origin = {0, -80}, textColor = {0, 0, 255}, extent = {{60, 10}, {-60, -10}}, textString = "neurons = %numNeurons")}));
end Dense;
