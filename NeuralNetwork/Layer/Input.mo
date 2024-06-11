within NeuralNetwork.Layer;

block Input "Block for a dense input neural network layer with optional normalization"
  extends NeuralNetwork.Layer.Interfaces.Layer(lineColor={212, 0, 0});
  parameter NeuralNetwork.Types.ActivationFunction f = NeuralNetwork.Types.ActivationFunction.ReLu "Activation function of the layer";
  // PCA
  parameter Boolean pca = false "Reducing the feature space based on a PCA";
  parameter Integer dimFeatures = numInputs "Dimension of the new feature space";
  parameter Real transMatrix[dimFeatures, numInputs] = zeros(dimFeatures, numInputs) "Transformation Matrix, based on the eigenvectors of the covariance matrix from all the training features";
  // Data preprocessing
  parameter Real mean_pca[numInputs] = zeros(numInputs) "Mean of all the feature dimension for standardization";
  parameter Real std_pca[numInputs] = zeros(numInputs) "Standard deviation for each dimension of the training features";
  parameter Boolean scale = false "Scale the inputs with min-max normalization to [0,1]";
  parameter Real max[dimFeatures] = zeros(dimFeatures) "Maximum for each dimension of the training inputs";
  parameter Real min[dimFeatures] = zeros(dimFeatures) "Minimum for each dimension of the training inputs";
  parameter Boolean standardization = false "Standardize the inputs with mu-sigma standardization";
  parameter Real mean[dimFeatures] = zeros(dimFeatures) "Estimated mean for each dimension of the training inputs";
  parameter Real std[dimFeatures] = zeros(dimFeatures) "Estimated standard deviation for each dimension of the training inputs";
protected
  Real uPCA[dimFeatures] "Help variable for a reduced input space (needed when using PCA)";
  Real uu[dimFeatures] "Help variable for 'u' (needed when using standardization and/or when using scaling)";
public
equation
  // Feature reduction
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

  // Activation function
  y = NeuralNetwork.ActivationFunctions.activationFunction(f, weights * uu + bias);

  annotation(
    Documentation(info = "<html><head></head><body>
    <p>
      Dense input layer with optional normalization:</p><p>y = f(weights*u + bias);</p>
    <h2>Parametrization</h2><p>
      Set <strong>bias</strong> and <strong>weights</strong> to parametrize layer.</p><p><b>numInputs</b> specify number of input nodes and <b>numNeurons</b> number of neurons in this layer.</p><p>Activation function <b>f</b>. Available options:</p><p></p><ul><li>ReLu [default]: <b>Types.ActivationFunction.ReLu</b></li><li>Sigmoid:&nbsp;<b><b>Types.</b>ActivationFunction.Sigmoid</b></li><li>tanh:&nbsp;<b><b>Types.</b>ActivationFunction.tanh</b></li></ul><p></p>
    <h2>Standardization</h2><p>Set&nbsp;<strong>standarization</strong>&nbsp;to&nbsp;<strong>true</strong>&nbsp;and provide values for <b>mean</b> of training data. Standardizes the inputs with mu-sigma standardization:</p><p>u := (u - mean) ./ std;</p><p>Undo standardization in output layer by setting <b>destandardization</b> to <b>true</b>&nbsp;in .</p><h2>Scaling</h2><p>Set&nbsp;<strong>scale</strong>&nbsp;to <b>true</b>&nbsp;and provide values for&nbsp;<b>min</b>&nbsp;and&nbsp;<b>max</b>&nbsp;of training data. Scales the inputs with min-max normalization to [0,1]:</p><p>u:= (u-min) ./ (max - min);</p><p>Undo scaling in ouput layer by setting <b>rescale</b> to <b>true</b>.</p>
<h2>Principal Component Analysis (PCA)</h2><div>Set <b>pca</b> to <b>true</b> and provide <b>dimFeatures</b>, transformation matrix <b>transMatrix</b>, <b>mean_pca</b> and <b>std_pca</b>.</div><div><br></div><div>u := transMatrix * ((u - mean_pca) ./ std_pca);</div>
    </body></html>"));
end Input;
