within NeuralNetwork.ActivationFunctions;

function Step
  extends ActivationFunction;
algorithm
  y := if u < 0 then 0 else 1;
end Step;
