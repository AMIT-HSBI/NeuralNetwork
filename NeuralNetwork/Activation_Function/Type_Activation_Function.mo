within NeuralNetwork.Activation_Function;

type Type_Activation_Function "Temporary type of ActivationFunction with choices for menus (until enumerations are available)"
  extends Integer;
  annotation(
    choices(
      choice = NeuralNetwork.ActivationFunction.Type_Activation_Function.ReLu "ReLu activation function",
      choice = NeuralNetwork.ActivationFunction.Type_Activation_Function.Sigmoid "Sigmoid activation function",
      choise = NeuralNetwork.ActivationFunction.Type_Activation_Function.Hyperbolic_tangent "Tanh activation function"));
end Type_Activation_Function;
