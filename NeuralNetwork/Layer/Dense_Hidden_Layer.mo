within NeuralNetwork.Layer;

block Dense_Hidden_Layer "Block for a dense neural network layer"
  parameter Real bias[:] "Bias table of a fully connected layer";
  parameter Real weights[:, :] "Weight table of a fully connected layer";
  parameter NeuralNetwork.Activation_Function.Type_Activation_Function NeuronActivation_Function = NeuralNetwork.Activation_Function.ReLu "Activation function of the layer";
  parameter Integer numInputs "Specification of the inputs of the layer";
  parameter Integer numNeurons "Number of neurons in the layer";
  extends Modelica.Blocks.Interfaces.MIMO(final nin = numInputs, final nout = numNeurons);
equation
  if NeuronActivation_Function == NeuralNetwork.Activation_Function.ReLu then
    y = NeuralNetwork.Utilities.ReLu(weights * u + bias);
  elseif NeuronActivation_Function == NeuralNetwork.Activation_Function.Sigmoid then
    y = NeuralNetwork.Utilities.Sigmoid(weights * u + bias);
  elseif NeuronActivation_Function == NeuralNetwork.Activation_Function.Hyperbolic_tangent then
    y = Modelica.Math.tanh(weights * u + bias);
  end if;
end Dense_Hidden_Layer;
