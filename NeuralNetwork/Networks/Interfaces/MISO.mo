within NeuralNetwork.Networks.Interfaces;

partial block MISO
  Modelica.Blocks.Interfaces.RealInput u[:] "Connector of Real input signals" annotation(
    Placement(transformation(extent = {{0, 0}, {0, 0}}), iconTransformation(extent = {{-140, -20}, {-100, 20}})));
  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal" annotation(
    Placement(transformation(extent = {{0, 0}, {0, 0}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
  annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 20), Ellipse(origin = {-60, -40}, lineColor = {212, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}), Ellipse(origin = {-60, 0}, lineColor = {212, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}), Ellipse(origin = {-60, 40}, lineColor = {212, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}), Ellipse(origin = {-60, 40}, lineColor = {212, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}), Ellipse(origin = {60, -20}, lineColor = {0, 170, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}), Ellipse(origin = {60, 20}, lineColor = {0, 170, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}), Ellipse(origin = {0, -20}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}), Ellipse(origin = {0, 20}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}), Ellipse(origin = {0, 60}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}), Ellipse(origin = {0, -60}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}), Line(points = {{-48, 44}, {-12, 60}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{-48, 42}, {-12, 24}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{-48, 40}, {-12, -16}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{-48, 38}, {-12, -50}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{-48, 2}, {-12, 56}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{-48, 0}, {-12, 20}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{-48, -2}, {-12, -20}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{-48, -4}, {-12, -56}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{-48, -38}, {-12, 50}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{-48, -40}, {-12, 16}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{-48, -42}, {-12, -24}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{-48, -44}, {-12, -60}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{12, 56}, {48, 26}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{12, 52}, {48, -14}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{12, 22}, {48, 22}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{12, 18}, {48, -18}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{12, -18}, {48, 18}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{12, -22}, {48, -22}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{12, -52}, {48, 14}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{12, -56}, {48, -26}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}), Text(origin = {0, 120}, textColor = {0, 0, 255}, extent = {{-80, 20}, {80, -20}}, textString = "%name")}),
    Documentation(info = "<html><head></head><body>
      <p>
      General interface for neural networks consisting of input <b>u</b> and output <b>y</b>.
      </p>
      <p>Building block to build neural networks. To create a new neural network:
      </p>
      <p>
        <ol>
          <li>Extend this partial block Network.</li>
          <li>Add input, hidden and output layers from <a href=\"modelica://NeuralNetwork.NeuralNetwork.Layer\">NeuralNetwork.Layer</a>.</li>
          <li>Connect layers internally as well as to network input <b>u</b> and output <b>y</b>.</li>
        </ol>
      </p>
      </body></html>"));
end MISO;
