within NeuralNetwork.Layer;

block Input_Hidden_Layer "Block for a dense input neural network layer with optional normalization"
  // Topology neural network
  parameter Real bias[:] "Bias table of the input-layer";
  parameter Real weights[:, :] "Weight table of the input-layer ";
  parameter NeuralNetwork.Activation_Function.Type_Activation_Function NeuronActivation_Function = NeuralNetwork.Activation_Function.ReLu "Activation function of the layer";
  parameter Integer numInputs "Specification of the inputs of the layer";
  parameter Integer numNeurons "Number of neurons in the layer";
  // PCA
  parameter Boolean pca = false "Reducing the feature space based on a PCA";
  parameter Integer dimFeatures = numInputs "Dimension of the new feature space";
  parameter Real transMatrix[dimFeatures, numInputs] "Transformation Matrix, based on the eigenvectors of the covariance matrix from all the training features";
  // Data preprocessing
  parameter Real mean_pca[numInputs] "Mean of all the feature dimension for standardization";
  parameter Real std_pca[numInputs] "Standard deviation for each dimension of the training features";
  parameter Boolean scale = false "Scale the inputs with min-max normalization to [0,1]";
  parameter Real max[:] "Maximum for each dimension of the training inputs";
  parameter Real min[:] "Minimum for each dimension of the training inputs";
  parameter Boolean standardization = false "Standardize the inputs with mu-sigma standardization";
  parameter Real mean[:] "Estimated mean for each dimension of the training inputs";
  parameter Real std[:] "Estimated standard deviation for each dimension of the training inputs";
  // Additional variables
  Real uPCA[dimFeatures] "Help variable for a reduced input space (needed when using PCA)";
  Real uu[dimFeatures] "Help variable for 'u' (needed when using standardization and/or when using scaling)";
  extends Modelica.Blocks.Interfaces.MIMO(final nin = numInputs, final nout = numNeurons);
equation
  // Check if feature shell be reduced
  if pca then
    uPCA = transMatrix * ((u - mean_pca) ./ std_pca);
  else
    uPCA = u;
  end if;
  // Check if scale and/or standardize of the features should be performed
  if standardization and scale then
    uu = ((uPCA - mean) ./ std - min) ./ (max - min);
  elseif standardization then
    uu = (uPCA - mean) ./ std;
  elseif scale then
    uu = (uPCA - min) ./ (max - min);
  else
    uu = uPCA;
  end if;
  // Choose the correct activation function
  if NeuronActivation_Function == NeuralNetwork.Activation_Function.ReLu then
    y = NeuralNetwork.Utilities.ReLu(weights * uu + bias);
  elseif NeuronActivation_Function == NeuralNetwork.Activation_Function.Sigmoid then
    y = NeuralNetwork.Utilities.Sigmoid(weights * uu + bias);
  elseif NeuronActivation_Function == NeuralNetwork.Activation_Function.Hyperbolic_tangent then
    y = Modelica.Math.tanh(weights * uu + bias);
  end if;
end Input_Hidden_Layer;
