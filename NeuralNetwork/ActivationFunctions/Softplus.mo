within NeuralNetwork.ActivationFunctions;

function Softplus
  extends ActivationFunction;
algorithm
  y := log(1 + exp(u));
end Softplus;
