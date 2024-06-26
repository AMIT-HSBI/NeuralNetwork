within NeuralNetwork.ActivationFunctions;

function activationFunction
  input NeuralNetwork.Types.ActivationFunction f;
  input Real[:] u;
  output Real[:] y;
algorithm
  if f == NeuralNetwork.Types.ActivationFunction.ReLu then
    y := NeuralNetwork.ActivationFunctions.ReLu(u);
  elseif f == NeuralNetwork.Types.ActivationFunction.Sigmoid then
    y := NeuralNetwork.ActivationFunctions.Sigmoid(u);
  elseif f == NeuralNetwork.Types.ActivationFunction.Hyperbolic_tangent then
    y := Modelica.Math.tanh(u);
  end if;
end activationFunction;
