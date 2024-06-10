within NeuralNetwork.Layer;

block Hidden "Block for a dense neural network layer"
  extends NeuralNetwork.Layer.Interfaces.Layer(lineColor={0, 170, 255});
  parameter NeuralNetwork.Types.ActivationFunction f = NeuralNetwork.Types.ActivationFunction.ReLu "Activation function of the layer";
equation
  y = NeuralNetwork.ActivationFunctions.activationFunction(f, weights * u + bias);
  
  annotation(
    Documentation(info = "<html><head></head><body>
    <p>
      Dense hidden layer:</p><p>y = f(weights*u + bias)</p>
    <h2>Parametrization</h2><p>
      Set <strong>bias</strong> and <strong>weights</strong> to parametrize layer.</p><p><b>numInputs</b> specify number of input nodes and <b>numNeurons</b> number of neurons in this layer.</p><p>Activation function <b>f</b>. Available options:</p><p></p><ul><li>ReLu [default]: <b>Types.ActivationFunction.ReLu</b></li><li>Sigmoid:&nbsp;<b><b>Types.</b>ActivationFunction.Sigmoid</b></li><li>tanh:&nbsp;<b><b>Types.</b>ActivationFunction.tanh</b></li></ul>
    </body></html>"));
end Hidden;
