within NeuralNetwork.Examples;

model HelloWorld
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Sine sine annotation(
    Placement(transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}})));
  block simpleEquation
    extends Modelica.Blocks.Interfaces.SISO;
  equation
   u = x*x + 0.5*x - 2.0;
  end simpleEquation;

  simpleEquation eq1 annotation(
    Placement(transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(sine.y, eq1.u) annotation(
    Line(points = {{-48, 0}, {-30, 0}, {-30, 20}, {-12, 20}}, color = {0, 0, 127}));
end HelloWorld;
