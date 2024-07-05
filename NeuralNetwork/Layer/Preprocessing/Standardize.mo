within NeuralNetwork.Layer.Preprocessing;

block Standardize "Standardize the inputs with mu-sigma standardization"
  extends Interfaces.Layer(final numInputs = size(mean, 1), final numNeurons = size(mean, 1));

  parameter Real mean[:]            "Mean for each dimension of the training inputs";
  parameter Real std[size(mean, 1)] "Standard deviation for each dimension of the training inputs";
equation
  y = (u - mean) ./ std;

  annotation(
    Icon(graphics = {
      Line(points = {{-30, -40}, {30, -40}}),
      Line(points = {{-10, -42}, {-10, 8.52}}),
      Line(points = {{0, -42}, {0, 40}}),
      Line(points = {{10, -42}, {10, 8.52}}),
      Line(origin = {0, -40}, points = {{-30, 0.88}, {-25, 3.51}, {-20, 10.82}, {-15, 25.97}, {-10, 48.52}, {-5, 70.60}, {0, 80}, {5, 70.60}, {10, 48.52}, {15, 25.97}, {20, 10.82}, {25, 3.51}, {30, 0.88}}, smooth = Smooth.Bezier),
      Text(origin = {0, 40}, extent = {{-3, 0}, {3, 9}}, textString = "0"),
      Text(origin = {-10, -42}, extent = {{-9, -9}, {9, 0}}, textString = "-1"),
      Text(origin = {10, -42}, extent = {{-9, -9}, {9, 0}}, textString = "1")}));
end Standardize;
