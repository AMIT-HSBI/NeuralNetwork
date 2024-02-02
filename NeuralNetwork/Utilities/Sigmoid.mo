within NeuralNetwork.Utilities;

function Sigmoid
  input Real u "Input of the function";
  output Real y "Output of the function";
algorithm
  y := 1 / (1 + Modelica.Math.exp(-u));
end Sigmoid;
