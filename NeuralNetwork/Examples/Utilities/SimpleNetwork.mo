within NeuralNetwork.Examples.Utilities;
block SimpleNetwork "Neural Network approximating y = u*u + 0.5*u - 2.0 on interval [-1,1]"
  extends NeuralNetwork.Networks.Interfaces.SISO;
  Layer.Dense inputLayer(
    weights = layer_1_weights,
    bias = layer_1_bias,
    redeclare function f = NeuralNetwork.ActivationFunctions.Tanh
  ) annotation(
    Placement(transformation(origin = {-66, 0}, extent = {{-30, -30}, {30, 30}})));
  Layer.Dense outputLayer(
    weights = layer_2_weights,
    bias = layer_2_bias,
    redeclare function f = NeuralNetwork.ActivationFunctions.Id
  ) annotation(
    Placement(transformation(origin = {50, 0}, extent = {{-30, -30}, {30, 30}})));

  parameter Real[2,1] layer_1_weights = {{-0.7039596170222842}, {-0.8750912730224503}};
  parameter Real[2] layer_1_bias = {1.169784394444224, -1.344723440170712};
  parameter Real[1,2] layer_2_weights = {{-4.513856227908402, 2.4932885356708683}};
  parameter Real[1] layer_2_bias = {3.897109323824147};
equation
  connect( u, inputLayer.u[1]);
  connect( outputLayer.y[1], y);

  connect(inputLayer.y, outputLayer.u) annotation(
    Line(points = {{-48, 0}, {30, 0}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    Documentation(info = "<html><head></head><body>
      <h2>Training</h2><p>
      Neural network parameters trained in
      <a href=\"https://github.com/AMIT-HSBI/NeuralNetwork/blob/main/Example/HelloWorld.ipynb\">HelloWorld.ipynb</a>.
      </p><p>Trained with TensorFlow on 8000 data points from interval [-1,1].</p>
      </body></html>"));
end SimpleNetwork;
