within NeuralNetwork.ActivationFunctions;

partial function ActivationFunction "All activation functions extend from this partial function"
  extends Modelica.Icons.Function;
  input Real u "Input of the function";
  output Real y "Output of the function";
end ActivationFunction;
