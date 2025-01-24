within NeuralNetwork.Examples;

model HelloWorld
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Sine sine(f = 1) annotation(
    Placement(transformation(origin = {-60, 0}, extent = {{-20, -20}, {20, 20}})));
  Utilities.SimpleEquation eq annotation(
    Placement(transformation(origin = {40, 30}, extent = {{-20, -20}, {20, 20}})));
  Utilities.SimpleNetwork nn annotation(
    Placement(transformation(origin = {40, -30}, extent = {{-20, -20}, {20, 20}})));
  Real reference = eq.y;
  Real prediction = nn.y;
equation
  connect(sine.y, eq.u) annotation(
    Line(points = {{-38, 0}, {-20, 0}, {-20, 30}, {16, 30}}, color = {0, 0, 127}));
  connect(sine.y, nn.u) annotation(
    Line(points = {{-38, 0}, {-20, 0}, {-20, -30}, {16, -30}}, color = {0, 0, 127}));
  annotation(
    Documentation(info = "<html><head></head><body>
      <p>Example showcasing how to replace block
      <a href=\"modelica://NeuralNetwork.Examples.Utilities.SimpleEquation\">SimpleEquation</a>
      </p>
      <p>y = u^2 + 0.5u - 2</p>
      <p>with artificial neural network surrogate
      <a href=\"modelica://NeuralNetwork.Examples.Utilities.SimpleNetwork\">SimpleNetwork</a>.
      </p>
      <p>
      A two-dimensional polynomial equation is approximated with a dense feed-forward neural network.
      The network was generated using Python script from Notebook
      <a href=\"https://github.com/AMIT-HSBI/NeuralNetwork/blob/main/Example/HelloWorld.ipynb\">HelloWorld.ipynb</a>.
      </p>
      <h2>Expected Results</h2>
      <p>Compare simulation results for variables <b>reference</b> and <b>prediction</b>.
      </p>
      <img style='width: 100%' src=\"modelica://NeuralNetwork/Resources/Images/HelloWorld.png\" alt=\"HelloWorld.png\">
      </body></html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end HelloWorld;
