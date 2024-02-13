model Feedforward_Network "Simulation of the simple network to demonstrate how the usage of the neural network in OpenModelica works"
  Modelica.Blocks.Routing.Multiplex mux(n = 2) annotation(
    Placement(visible = true, transformation(origin = {-8, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 20, height = 10, offset = 0) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 5) annotation(
    Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Network.Tree_Layer_Neural_Network tree_Layer_Neural_Network annotation(
    Placement(visible = true, transformation(origin = {34, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp.y, mux.u[1]) annotation(
    Line(points = {{-58, 50}, {-40, 50}, {-40, 0}, {-18, 0}}, color = {0, 0, 127}));
  connect(const.y, mux.u[2]) annotation(
    Line(points = {{-58, -50}, {-40, -50}, {-40, 0}, {-18, 0}}, color = {0, 0, 127}));
  connect(mux.y, tree_Layer_Neural_Network.u) annotation(
    Line(points = {{4, 0}, {22, 0}}, color = {0, 0, 127}, thickness = 0.5));
end Feedforward_Network;
