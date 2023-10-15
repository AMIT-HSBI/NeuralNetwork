model Testing_Export
  Modelica.Blocks.Routing.Multiplex mux(n = 1) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 60, height = 60, offset = -30) annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Network.Neural_Network_4_Layer neural_Network_4_Layer annotation(
    Placement(visible = true, transformation(origin = {34, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp.y, mux.u[1]) annotation(
    Line(points = {{-39, 0}, {-10, 0}}, color = {0, 0, 127}));
connect(mux.y, neural_Network_4_Layer.u) annotation(
    Line(points = {{12, 0}, {22, 0}}, color = {0, 0, 127}, thickness = 0.5));
protected
end Testing_Export;
