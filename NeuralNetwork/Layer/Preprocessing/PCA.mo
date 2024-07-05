within NeuralNetwork.Layer.Preprocessing;

block PCA "Reducing the feature space based on a Principal Component Analysis"
  extends Interfaces.Layer(final numInputs = size(A, 2), final numNeurons = size(A, 1));

  parameter Real A[:, :] "Transformation Matrix, based on the eigenvectors of the covariance matrix from all the training features";
equation
  y = A * u;

  annotation(
    Icon(graphics = {
      Ellipse(origin = {-6, -20}, fillPattern = FillPattern.Solid, extent = {{-1, 1}, {1, -1}}),
      Ellipse(origin = {0, 8}, fillPattern = FillPattern.Solid, extent = {{-1, 1}, {1, -1}}),
      Ellipse(origin = {-20, -28}, fillPattern = FillPattern.Solid, extent = {{-1, 1}, {1, -1}}),
      Ellipse(origin = {4, 18}, fillPattern = FillPattern.Solid, extent = {{-1, 1}, {1, -1}}),
      Ellipse(origin = {10, 2}, fillPattern = FillPattern.Solid, extent = {{-1, 1}, {1, -1}}),
      Ellipse(origin = {10, 16}, fillPattern = FillPattern.Solid, extent = {{-1, 1}, {1, -1}}),
      Ellipse(origin = {-10, 0}, fillPattern = FillPattern.Solid, extent = {{-1, 1}, {1, -1}}),
      Ellipse(origin = {-20, -38}, fillPattern = FillPattern.Solid, extent = {{-1, 1}, {1, -1}}),
      Ellipse(origin = {8, 36}, fillPattern = FillPattern.Solid, extent = {{-1, 1}, {1, -1}}),
      Ellipse(origin = {2, -6}, fillPattern = FillPattern.Solid, extent = {{-1, 1}, {1, -1}}),
      Ellipse(origin = {-10, -8}, fillPattern = FillPattern.Solid, extent = {{-1, 1}, {1, -1}}),
      Ellipse(origin = {-4, -16}, fillPattern = FillPattern.Solid, extent = {{-1, 1}, {1, -1}}),
      Ellipse(origin = {24, 16}, fillPattern = FillPattern.Solid, extent = {{-1, 1}, {1, -1}}),
      Line(points = {{-24, -42}, {24, 42}}, pattern = LinePattern.Dash),
      Line(points = {{8.4, -4.8}, {-8.4, 4.8}}, pattern = LinePattern.Dash),
      Line(points = {{0, 0}, {20, 35}}, color = {0, 170, 255}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{0, 0}, {-7, 4}}, color = {212, 0, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}),
      Text(origin = {0, 56}, textColor = {127, 127, 127}, extent = {{-10, 6}, {10, -6}}, textString = "PCA")}));
end PCA;
