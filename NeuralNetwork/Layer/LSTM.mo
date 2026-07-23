within NeuralNetwork.Layer;

block LSTM "Block for a LSTM neural network layer"
  extends Interfaces.Layer(final numInputs = size(Wf, 2), final numNeurons = size(bf, 1));

  /* weights and biases */
  parameter Real Wf[:, :]  "Weights of input and forget gate";
  parameter Real Wi[:, :]  "Weights of input and input gate";
  parameter Real Wo[:, :]  "Weights of input and output gate";
  parameter Real Wc[:, :]  "Weights of input and memory cell gate";

  parameter Real Uf[:, :]  "Weights of recurrent and forget gate";
  parameter Real Ui[:, :]  "Weights of recurrent and input gate";
  parameter Real Uo[:, :]  "Weights of recurrent and output gate";
  parameter Real Uc[:, :]  "Weights of recurrent and memory cell gate";

  parameter Real bf[:]  "Biases of forget gate";
  parameter Real bi[:]  "Biases of input gate";
  parameter Real bo[:]  "Biases of output gate";
  parameter Real bc[:]  "Biases of memory cell gate";

  replaceable function sigma_g = NeuralNetwork.ActivationFunctions.ActivationFunction "Activation function of the layer";
  replaceable function sigma_c = NeuralNetwork.ActivationFunctions.ActivationFunction "Activation function of the layer";
  replaceable function sigma_h = NeuralNetwork.ActivationFunctions.ActivationFunction "Activation function of the layer";

  Clock clk "clock for sampling the input u";

protected
  Real x[numInputs]   "sampled input vector";
  Real f[numNeurons]  "forget gate's activation vector";
  Real i[numNeurons]  "input gate's activation vector";
  Real o[numNeurons]  "output gate's activation vector";
  Real ca[numNeurons] "cell input activation vector";
  Real c[numNeurons] (each start = 0.0) "cell state vector";
  Real h[numNeurons] (each start = 0.0) "hidden state vector";
equation
  x = sample(u, clk)  "input";
  y = hold(h)         "output";

  when clk then
    f = sigma_g(Wf*x + Uf*previous(h) + bf)   "forget gate";
    i = sigma_g(Wi*x + Ui*previous(h) + bi)   "input gate";
    o = sigma_g(Wo*x + Uo*previous(h) + bo)   "output gate";
    ca = sigma_c(Wc*x + Uc*previous(h) + bc)  "cell activation";
    c = f .* previous(c) + i .* ca            "cell state";
    h = o .* sigma_h(c)                       "hidden state";
  end when;

  annotation(
    Icon(graphics = {
      Ellipse(origin = {0, -60}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {0, -30}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {0, -10}, lineColor = {45, 45, 45}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-2, 2}, {2, -2}}),
      Ellipse(origin = {0, 0}, lineColor = {45, 45, 45}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-2, 2}, {2, -2}}),
      Ellipse(origin = {0, 10}, lineColor = {45, 45, 45}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-2, 2}, {2, -2}}),
      Ellipse(origin = {0, 30}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Ellipse(origin = {0, 60}, lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{10, 10}, {-10, -10}}),
      Line(points = {{-38, -8}, {-12, -56}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{-38, -4}, {-12, -26}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{-38, 4}, {-12, 26}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{-38, 8}, {-12, 56}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, -56}, {38, -8}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, -26}, {38, -4}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, 26}, {38, 4}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Line(points = {{12, 56}, {38, 8}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}),
      Text(origin = {0, -80}, textColor = {0, 0, 255}, extent = {{60, 10}, {-60, -10}}, textString = "neurons = %numNeurons")}));
end LSTM;
