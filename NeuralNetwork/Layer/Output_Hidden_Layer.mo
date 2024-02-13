within NeuralNetwork.Layer;

block Output_Hidden_Layer "Block for the last hidden neural network layer with a linear activation function."
  // Topology of the neural network
  parameter Real bias[:] "Bias table of the output-layer";
  parameter Real weights[:, :] "Weight table of the output-layer";
  parameter Integer numInputs "Specification of the inputs of the layer";
  parameter Integer numNeurons "Number of neurons in the layer";
  // Parameters for optional rescaling or destandardization
  parameter Boolean rescale = false "Rescale the outputs with min-max denormalization";
  parameter Real max[:] "Maximum for each dimension of the training outputs";
  parameter Real min[:] "Minimum for each dimension of the training outputs";
  parameter Boolean destandardization = false "Destandardize the inputs with mu-sigma";
  parameter Real mean[:] "Estimated mean for each dimension of the training targets";
  parameter Real std[:] "Estimated standard deviation for each dimension of the training targets";
  // Additional variables for rescaling/destandardization
  Real yy[numNeurons] "Help Variable for 'y' (using recaling or destandardization of the outputs)";
  extends Modelica.Blocks.Interfaces.MIMO(final nin = numInputs, final nout = numNeurons);
equation
  // Calculate the output with lineare activation
  yy = weights * u + bias;
  // Check if targets need to be rescaled or destandardized
  if rescale then
    y = yy .* (max - min) + min;
  elseif destandardization then
    y = yy .* std + mean;
  else
    y = yy;
  end if;
end Output_Hidden_Layer;
