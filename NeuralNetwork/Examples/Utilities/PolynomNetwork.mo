within NeuralNetwork.Examples.Utilities;

block PolynomNetwork "Neural Network approximating y = u*u + 0.5*u - 2.0 on interval [-1,1]"
  extends NeuralNetwork.Networks.Interfaces.Network(numInputs = 1, numOutputs = 1);
  Layer.Input inputLayer(
    numInputs = 1,
    numNeurons = 2,
    weights = layer_1_weights,
    bias = layer_1_bias,
    f = NeuralNetwork.Types.ActivationFunction.Hyperbolic_tangent
  ) annotation(
    Placement(transformation(origin = {-66, 0}, extent = {{-30, -30}, {30, 30}})));
  Layer.Output outputLayer(
    numInputs = 2,
    numNeurons = 1,
    weights = layer_2_weights,
    bias = layer_2_bias
  ) annotation(
    Placement(transformation(origin = {50, 0}, extent = {{-30, -30}, {30, 30}})));
  
  parameter Real[2,1] layer_1_weights = {{-0.95248}, {-0.943175}};
  parameter Real[2] layer_1_bias = {0.872633, -0.949252};
  parameter Real[1,2] layer_2_weights = {{-2.25385, 1.40389}};
  parameter Real[1] layer_2_bias = {0.60548};
equation
  connect(u, inputLayer.u);
  connect(inputLayer.y, outputLayer.u) annotation(
    Line(points = {{-48, 0}, {30, 0}}, color = {0, 0, 127}, thickness = 0.5));
  connect(outputLayer.y, y);
annotation(
    Documentation(info = "<html><head></head><body>
    <h2>Training</h2><p>
    Neural network parameters trained in 
    <a href=\"https://github.com/AMIT-HSBI/NeuralNetwork/blob/main/Example/HelloWorld.ipynb\">HelloWorld.ipynb</a>.
    </p><p>Trained with TensorFlow on 8000 data points from interval [-1,1].</p>
    </body></html>"));
end PolynomNetwork;
