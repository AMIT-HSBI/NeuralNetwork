within NeuralNetwork.Layer.Interfaces;

partial model Layer
  // Topology of the neural network
  parameter Real bias[:]        "Bias table of the output-layer";
  parameter Real weights[:, :]  "Weight table of the output-layer";
  parameter Integer numInputs   "Specification of the inputs of the layer";
  parameter Integer numNeurons  "Number of neurons in the layer";
  Modelica.Blocks.Interfaces.RealInput u[numInputs] "Connector of Real input signals" annotation(
    Placement(transformation(origin = {60, 0}, extent = {{-140, -20}, {-100, 20}}), iconTransformation(origin = {50, 0}, extent = {{-140, -20}, {-100, 20}})));
  Modelica.Blocks.Interfaces.RealOutput y[numNeurons] "Connector of Real output signals" annotation(
    Placement(transformation(origin = {-60, 0}, extent = {{100, -10}, {120, 10}}), iconTransformation(origin = {-48, 0}, extent = {{100, -10}, {120, 10}})));
protected
    constant Integer[3] lineColor = {0, 170, 255};
  annotation(
    Icon(graphics = {
      Rectangle(origin = {0, 1}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-40, 73}, {40, -73}}, radius = 20),
      Ellipse(origin = {0, 60}, lineColor = lineColor, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {0, -60}, lineColor = lineColor, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Line(origin = {0, 0.315274}, points = {{-38, 8}, {-12, 56}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{-38, -8}, {-12, -56}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, 56}, {38, 8}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(origin = {0, 0.315274}, points = {{12, -56}, {38, -8}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Ellipse(origin = {0, 10}, lineColor = {45, 45, 45}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-2, 2}, {2, -2}}),
      Ellipse(lineColor = {45, 45, 45}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-2, 2}, {2, -2}}),
      Ellipse(origin = {0, -10}, lineColor = {45, 45, 45}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-2, 2}, {2, -2}}),
      Ellipse(origin = {0, -30}, lineColor = lineColor, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {0, 30}, lineColor = lineColor, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Line(origin = {0, 0.315274}, points = {{-38, 4}, {-12, 26}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, 26}, {38, 4}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{-38, -4}, {-12, -26}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(origin = {0, 0.224406}, points = {{12, -26}, {38, -4}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Text(origin = {0, -80}, textColor = {0, 0, 255}, extent = {{60, 10}, {-60, -10}}, textString = "neurons = %numNeurons"),
      Text(origin = {0, 90}, textColor = {0, 0, 255}, extent = {{60, 10}, {-60, -10}}, textString = "%name")}));
end Layer;
