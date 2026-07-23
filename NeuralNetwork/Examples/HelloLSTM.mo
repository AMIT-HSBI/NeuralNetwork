within NeuralNetwork.Examples;

model HelloLSTM
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Sine sine(f = 1) annotation(
    Placement(transformation(origin = {-60, 0}, extent = {{-20, -20}, {20, 20}})));
  Utilities.SimpleLSTM lstm annotation(
    Placement(transformation(origin = {40, -30}, extent = {{-20, -20}, {20, 20}})));
equation
  connect(sine.y, lstm.u) annotation(
    Line(points = {{-38, 0}, {-20, 0}, {-20, -30}, {16, -30}}, color = {0, 0, 127}));

  annotation(
    experiment(StopTime = 1));
end HelloLSTM;
