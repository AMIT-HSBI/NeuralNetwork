block Tree_Layer_Neural_Network "This block models a very simple three layer Neural Network and should demonstrate the usage of the library"
  // Parameter of Input Layer
  parameter Real FirstLayer_bias[3] = {0, 0, 0} "Bias vector of the first layer";
	parameter Real FirstLayer_weights[3, 2] = [1, 0; 0, 1; 0, 0] "Weight matrix of the first layer";
  parameter Integer FirstLayer_numInputs = 2 "Specification of the input dimension of the neural network";
  parameter Integer FirstLayer_numNeurons = 3 "Number of neurons in the first layer";
  parameter Boolean FirstLayer_pca = false "Reducing the feature space based on a PCA";
  parameter Boolean FirstLayer_scale = false "Scale the inputs with min-max normalization";
  parameter Boolean FirstLayer_standardization = false "Scale the inputs with mu-sigma standardization";

  // Parameter of First Hidden Layer
  parameter Real SecondLayer_bias[4] = {0, 0, 0, 0} "Bias vector of the second layer";
  parameter Real SecondLayer_weights[4, 3] = [1, 0, 0; 0, 1, 0; 0, 0, 0; 0, 0, 0] "Weight matrix of the second layer";
  parameter Integer SecondLayer_numInputs = FirstLayer_numNeurons "Specification of the inputs of the second layer";
  parameter Integer SecondLayer_numNeurons = 4 "Number of neurons in the second layer";
  // Set the Activation Function

  parameter Neural_Network.Activation_Function.Type_Activation_Function ActivationFunction = Neural_Network.Activation_Function.ReLu "Activation function of the Input and Hidden layers";

  // Parameter of Output Layer
  parameter Real ThirdLayer_bias[1] = {0} "Bias vector of the third layer";
  parameter Real ThirdLayer_weights[1, 4] = [1, 1, 0, 0] "Weight matrix of the third layer";
  parameter Integer ThirdLayer_numInputs = SecondLayer_numNeurons "Specification of the inputs of the third layer";
  parameter Integer ThirdLayer_numNeurons = 1 "Number of neurons in the third layer";
  parameter Boolean ThirdLayer_rescale = true "Rescale the outputs with min-max denormalization";
  parameter Real ThirdLayer_max[1] = {5.0} "Maximum of the training targets";
  parameter Real ThirdLayer_min[1] = {0.0} "Minimum of the training targets";
  parameter Boolean ThirdLayer_destandardization = false "Destandardization of the outputs with mu-sigma";
  parameter Real ThirdLayer_mean[1] = {0.0} "Default value";
  parameter Real ThirdLayer_std[1] = {1.0} "Default value";

  // Initilize the Layers of the neural network with the parameter that were defined above
  Neural_Network.Layer.Input_Hidden_Layer First_Layer(bias = FirstLayer_bias, weights = FirstLayer_weights, NeuronActivation_Function = ActivationFunction, numInputs = FirstLayer_numInputs, numNeurons = FirstLayer_numNeurons, pca = FirstLayer_pca, scale = FirstLayer_scale, max = {1.0}, min = {0.0}, standardization = FirstLayer_standardization, mean = {0.0}, std = {1.0});
  Neural_Network.Layer.Dense_Hidden_Layer Second_Layer(bias = SecondLayer_bias, weights = SecondLayer_weights, NeuronActivation_Function = ActivationFunction, numInputs = SecondLayer_numInputs, numNeurons = SecondLayer_numNeurons);
  Neural_Network.Layer.Output_Hidden_Layer Third_Layer(bias = ThirdLayer_bias, weights = ThirdLayer_weights, numInputs = ThirdLayer_numInputs, numNeurons = ThirdLayer_numNeurons, rescale = ThirdLayer_rescale, max = ThirdLayer_max, min = ThirdLayer_min, destandardization = ThirdLayer_destandardization, mean = ThirdLayer_mean, std = ThirdLayer_std);

  // Treat Neural Network as multiple Input - multiple Output Block
  extends Modelica.Blocks.Interfaces.MIMO(final nin = FirstLayer_numInputs, final nout = ThirdLayer_numNeurons);
equation
  connect(u, First_Layer.u);
  connect(First_Layer.y, Second_Layer.u);
  connect(Second_Layer.y, Third_Layer.u);
  connect(Third_Layer.y, y);
end Tree_Layer_Neural_Network;
