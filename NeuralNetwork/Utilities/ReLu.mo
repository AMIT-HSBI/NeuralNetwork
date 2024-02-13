within NeuralNetwork.Utilities;

function ReLu
  input Real u "Input of the function";
  output Real y "Output of the function";
algorithm
  y := max(0.0, u);
end ReLu;
