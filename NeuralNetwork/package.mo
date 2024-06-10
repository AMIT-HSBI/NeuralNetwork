package NeuralNetwork
  annotation(
    version = "2.0.0",
    uses(Modelica(version = "4.0.0")),
    Documentation(info = "<html>
    <p>
      NeuralNetwork Modelica library.
    </p>
    <h2 id=\"license\">License</h2>
    <p>
      This package is licensed with the <a href=\"https://github.com/AMIT-HSBI/NeuralNetwork/blob/v2.0.0/LICENSE\">3-Clause BSD License</a>.
    </p>
    <h2 id=\"development-and-contribution\">Development and contribution</h2>
    <p>
      Hochschule Bielefeld - University of Applied Sciences and Arts<br>
      Faculty of Engineering and Mathematics
    </p>
    </html>"),
    Icon(graphics = {
      Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid,lineThickness = 1,extent = {{-80, 80}, {80, -80}}, radius = 20),
      Ellipse(origin = {-60, -40}, lineColor = {212, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {-60, 0}, lineColor = {212, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {-60, 40}, lineColor = {212, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {-60, 40}, lineColor = {212, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {60, -20}, lineColor = {0, 170, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {60, 20}, lineColor = {0, 170, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {0, -20}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {0, 20}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {0, 60}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {0, -60}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Line( points = {{-48, 44}, {-12, 60}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line( points = {{-48, 42}, {-12, 24}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line( points = {{-48, 40}, {-12, -16}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line( points = {{-48, 38}, {-12, -50}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line( points = {{-48, 2}, {-12, 56}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line( points = {{-48, 0}, {-12, 20}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line( points = {{-48, -2}, {-12, -20}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line( points = {{-48, -4}, {-12, -56}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line( points = {{-48, -38}, {-12, 50}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line( points = {{-48, -40}, {-12, 16}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line( points = {{-48, -42}, {-12, -24}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line( points = {{-48, -44}, {-12, -60}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, 56}, {48, 26}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, 52}, {48, -14}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, 22}, {48, 22}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, 18}, {48, -18}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, -18}, {48, 18}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, -22}, {48, -22}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, -52}, {48, 14}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line( points = {{12, -56}, {48, -26}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled})
    }));
end NeuralNetwork;
