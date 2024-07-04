within NeuralNetwork.ActivationFunctions;

function ReLu
  extends ActivationFunction;
algorithm
  y := max(0.0, u);
end ReLu;
