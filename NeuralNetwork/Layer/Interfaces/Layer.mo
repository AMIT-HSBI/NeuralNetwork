within NeuralNetwork.Layer.Interfaces;
partial block Layer
  // Topology of the neural network
  parameter Integer numInputs   "Specification of the inputs of the layer";
  parameter Integer numNeurons  "Number of neurons in the layer";
  Modelica.Blocks.Interfaces.RealInput u[numInputs] "Connector of Real input signals" annotation(
    Placement(transformation(origin = {60, 0}, extent = {{-140, -20}, {-100, 20}}), iconTransformation(origin = {50, 0}, extent = {{-140, -20}, {-100, 20}})));
  Modelica.Blocks.Interfaces.RealOutput y[numNeurons] "Connector of Real output signals" annotation(
    Placement(transformation(origin = {-60, 0}, extent = {{100, -10}, {120, 10}}), iconTransformation(origin = {-48, 0}, extent = {{100, -10}, {120, 10}})));

  annotation(
    Icon(graphics = {
      Rectangle(origin = {0, 1}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-40, 73}, {40, -73}}, radius = 20),
      Text(origin = {0, 90}, textColor = {0, 0, 255}, extent = {{60, 10}, {-60, -10}}, textString = "%name")}));
end Layer;
