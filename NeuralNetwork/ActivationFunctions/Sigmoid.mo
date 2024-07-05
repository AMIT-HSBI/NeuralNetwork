within NeuralNetwork.ActivationFunctions;

function Sigmoid
  extends ActivationFunction;
algorithm
  y := 1 / (1 + exp(-u));
end Sigmoid;
