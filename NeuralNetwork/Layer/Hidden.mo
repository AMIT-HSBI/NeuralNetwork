within NeuralNetwork.Layer;

block Hidden "Block for a dense neural network layer"
  extends NeuralNetwork.Layer.Interfaces.Layer(lineColor={0, 170, 255});
  replaceable function f = NeuralNetwork.ActivationFunctions.ActivationFunction "Activation function of the layer";
equation
  y = f(weights * u + bias);

  annotation(
    Documentation(info = "<html><head></head><body>
    <p>
      Dense hidden layer:</p><p>y = f(weights*u + bias)</p>
    <h2>Parametrization</h2><p>
      Set <strong>bias</strong> and <strong>weights</strong> to parametrize layer.</p><p><b>numInputs</b> specify number of input nodes and <b>numNeurons</b> number of neurons in this layer.</p><p>Activation function <b>f</b>. Extend from NeuralNetwork.ActivationFunctions.ActivationFunction.
    </body></html>"));
end Hidden;
