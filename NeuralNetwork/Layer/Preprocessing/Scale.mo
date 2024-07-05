within NeuralNetwork.Layer.Preprocessing;

block Scale "Scale the inputs with min-max normalization to [0,1]"
  extends Interfaces.Layer(final numInputs = size(min, 1), final numNeurons = size(min, 1));

  parameter Real min[:]             "Minimum for each dimension of the training inputs";
  parameter Real max[size(min, 1)]  "Maximum for each dimension of the training inputs";
equation
  y = (u - min) ./ (max - min);

  annotation(
    Icon(graphics = {
      Line(points = {{-25, 50}, {25, 30}}, pattern = LinePattern.Dash),
      Line(points = {{-25, -50}, {25, -30}}, pattern = LinePattern.Dash),
      Line(points = {{-25, -50}, {-25, 50}}, thickness = 1),
      Line(points = {{25, -30}, {25, 30}}, thickness = 1),
      Ellipse(origin = {-25, -50}, fillPattern = FillPattern.Solid, extent = {{-3, 3}, {3, -3}}),
      Ellipse(origin = {-25, 50}, fillPattern = FillPattern.Solid, extent = {{-3, 3}, {3, -3}}),
      Ellipse(origin = {25, -30}, fillPattern = FillPattern.Solid, extent = {{-3, 3}, {3, -3}}),
      Ellipse(origin = {25, 30}, fillPattern = FillPattern.Solid, extent = {{-3, 3}, {3, -3}}),
      Text(origin = {25, 40}, extent = {{-3, 0}, {3, 9}}, textString = "1"),
      Text(origin = {25, -40}, extent = {{-3, -9}, {3, 0}}, textString = "0")}));
end Scale;
