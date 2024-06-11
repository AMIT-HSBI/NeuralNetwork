within NeuralNetwork.Layer;

block Output "Block for the last hidden neural network layer with a linear activation function."
  extends NeuralNetwork.Layer.Interfaces.Layer(lineColor={0, 170, 0});
  // Parameters for optional rescaling or destandardization
  parameter Boolean rescale = false "Rescale the outputs with min-max denormalization";
  parameter Real max[:] "Maximum for each dimension of the training outputs";
  parameter Real min[:] "Minimum for each dimension of the training outputs";
  parameter Boolean destandardization = false "Destandardize the inputs with mu-sigma";
  parameter Real mean[:] "Estimated mean for each dimension of the training targets";
  parameter Real std[:] "Estimated standard deviation for each dimension of the training targets";
protected
  // Additional variables for rescaling/destandardization
  Real yy[numNeurons] "Help Variable for 'y' (using recaling or destandardization of the outputs)";
equation
  // Calculate the output with lineare activation
  yy = weights * u + bias;
  // Check if targets need to be rescaled or destandardized
  // TODO: check both case
  if rescale and destandardization then
    y = (yy .* std + mean) .* (max - min) + min;
  elseif rescale then
    y = yy .* (max - min) + min;
  elseif destandardization then
    y = yy .* std + mean;
  else
    y = yy;
  end if;

  annotation(
    Documentation(info = "<html><head></head><body>
    <p>
      Dense linear output layer with optional denormalization:</p><p>y = weights*u + bias;</p>
    <h2>Parametrization</h2><p>
      Set <strong>bias</strong> and <strong>weights</strong> to parametrize layer.</p><p><b>numInputs</b> specify number of input nodes and <b>numNeurons</b> number of neurons in this layer.</p><p></p>
    <h2>Destandardization</h2><p>If the input layer used <b>standardization</b> set <b>destandardization</b> to <b>true</b>:</p><p>y := y .* std + mean;</p><h2>Rescale</h2><p>If the input layer scaled the inputs to [0,1] undo the scaling by setting <b>rescale</b> to <b>true</b>:</p><p>y := y .* (max - min) + min;</p>
    </body></html>"));
end Output;
