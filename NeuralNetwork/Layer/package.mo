within NeuralNetwork;

package Layer
  annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-40, 80}, {40, -80}}, radius = 20), Ellipse(origin = {0, 60}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}), Ellipse(origin = {0, -60}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}), Ellipse(origin = {0, 10}, lineColor = {45, 45, 45}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-2, 2}, {2, -2}}), Ellipse(lineColor = {45, 45, 45}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-2, 2}, {2, -2}}), Ellipse(origin = {0, -10}, lineColor = {45, 45, 45}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-2, 2}, {2, -2}}), Ellipse(origin = {0, -30}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}), Ellipse(origin = {0, 30}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}})}),
  Documentation(info = "<html><head></head><body>Input, hidden and output layers to construct dense neural networks.</body></html>"));
end Layer;
