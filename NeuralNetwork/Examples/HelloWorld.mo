within NeuralNetwork.Examples;

model HelloWorld
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Sine sine(f = 1)  annotation(
    Placement(transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}})));
  Utilities.SimpleEquation eq annotation(
    Placement(transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}})));
  Utilities.PolynomNetwork nn(numInputs = 1, numOutputs = 1)  annotation(
    Placement(transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}})));
    
  Real reference = eq.y;
  Real prediction = nn.y[1];
equation
  connect(sine.y, eq.u) annotation(
    Line(points = {{-48, 0}, {-30, 0}, {-30, 20}, {-12, 20}}, color = {0, 0, 127}));
  connect(sine.y, nn.u[1]) annotation(
    Line(points = {{-48, 0}, {-30, 0}, {-30, -20}, {-12, -20}}, color = {0, 0, 127}));
annotation(
    Documentation(info = "<html><head></head><body>
    <p>Example showcasing how to replace block
    <a href=\"modelica://NeuralNetwork.Examples.Utilities.SimpleEquation\">SimpleEquation</a>
    </p>
    <p>y = u^2 + 0.5u - 2</p>
    <p>with artificial neural network surrogate
    <a href=\"modelica://NeuralNetwork.Examples.Utilities.PolynomNetwork\">PolynomNetwork</a>.
    </p>
    <p>
    A two-dimensional polynomial equation is approximmated with a dense feed-forward neural network.
    The network was generated using Python script from Notebook
    <a href=\"https://github.com/AMIT-HSBI/NeuralNetwork/blob/main/Example/helloWorld.ipynb\">helloWorld.ipynb</a>.
    </p>
    <h2>Expected Results</h2>
    <p>Compare simulation results for variables <b>reference</b> and <b>prediction</b>.
    </p>
    <img style='width: 100%' src=\"modelica://NeuralNetwork/Resources/Images/HelloWorld.png\" alt=\"HelloWorld.png\">
    </body></html>"));
end HelloWorld;
