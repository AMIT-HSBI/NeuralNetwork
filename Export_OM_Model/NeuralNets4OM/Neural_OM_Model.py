import numpy as np
import os
np.set_printoptions(threshold=np.inf)

class Neural_OM_Model:
    """
    Class to generate a OpenModelica model of an neural network per template.
    """
    def __init__(self, nn, pca, scaling_x, standardization_x, scaling_y, standardization_y, name = "Neural_Network"):
        """
        Instantiated a class for a template of an modelica model which is generated out of a trained neural network.
        :param nn: keras neural network, a trained neural network instance from keras
        :param pca: tuple (String, np.array, np.array, np.array), a tuple which includes the parameters for reducing the feature space.
               -pca[0]: Perform feature reduction or not
               -pca[1]: Transformation matrix based on the eigenvectors of the covariance matrix of the features
               -pca[2]: Estimated mean of the features
               -pca[3]: Estimated standard deviation of the features
        :param scaling_x: tuple (String, np.array, np.array), a tuple which includes the parameters for scaling the features.
               -scaling_x[0]: Scale the input data or not
               -scaling_x[1]: Maximum of the features (Default: np.array([1.0]))
               -scaling_x[2]: Minimum of the features (Default: np.array([0.0]))
        :param standardization_x: tuple (String, np.array, np.array), a tuple which includes the parameters for the standardization of the features.
               -standardization_x[0]: Standartise the input data or not
               -standardization_x[1]: Estimated mean of the training features (Default: np.array([0.0]))
               -standardization_x[2]: Estimated standard deviation of the training features (Default: np.array([1.0]))
        :param scaling_y: tuple (String, np.array, np.array), a tuple which includes the parameters for rescaling the targets.
               -scaling_y[0]: rescale the output data or not
               -scaling_y[1]: Maximum of the training targets (Default: np.array([1.0]))
               -scaling_y[2]: Minimum of the training targets (Default: np.array([0.0]))
        :param standardization_y: tuple (String, np.array, np.array), a tuple which includes the parameters for the destandardization of the targets.
               -standardization_x[0]: Destandartise the output data or not
               -standardization_x[1]: Estimated mean of the training targets (Default: np.array([0.0]))
               -standardization_x[2]: Estimated standard deviation of the training targets (Default: np.array([1.0]))
       :param name: str (default: "Neural_Network"), name of the .mo file for the neural network model model in OpenModelica. 
        """
        
        # Make the before trained neural network reachable in the class instance
        self.nn = nn
        # Save the output shape of the neural network
        self.output_shape = nn.output_shape[1]
        # Initialize the Values for the neurons per layer and number of layers
        self.neurons = []
        self.num_layers = 0
        
        # Set the values for the feature reduction based on PCA
        self.pca = pca[0]
        if pca[0] == "true":
            self.pca_dimFeatures = str(pca[1].shape[0])
            self.input_shape = str(pca[1].shape[1])
            self.pca_transMatrix = self.__set_transMatrix(pca[1])
            self.pca_mean = self.__set_preprocessing_values(pca[2], 'pca_mean')
            self.pca_std = self.__set_preprocessing_values(pca[3], 'pca_std')
        else:
            self.input_shape = nn.input_shape[1]

        # Set the values for standardization and normalization of the features and targets
        self.scale_x = scaling_x[0]
        if scaling_x[0] == "true":
            self.scale_x_max = self.__set_preprocessing_values(scaling_x[1], 'scale_x_max')
            self.scale_x_min = self.__set_preprocessing_values(scaling_x[2], 'scale_x_min')
        else:
            self.scale_x_max = '{1.0}'
            self.scale_x_min = '{0.0}'

        self.standardization_x = standardization_x[0]
        if standardization_x[0] == "true":
            self.standardization_x_mean = self.__set_preprocessing_values(standardization_x[1], 'standardization_x_mean')
            self.standardization_x_std = self.__set_preprocessing_values(standardization_x[2], 'standardization_x_std')
        else:
            self.standardization_x_mean = '{0.0}'
            self.standardization_x_std = '{1.0}'

        self.rescale_y = scaling_y[0]
        if scaling_y[0] == "true":
            self.scale_y_max = self.__set_preprocessing_values(scaling_y[1], 'scale_y_max')
            self.scale_y_min = self.__set_preprocessing_values(scaling_y[2], 'scale_y_min')
        else:
            self.scale_y_max = '{1.0}'
            self.scale_y_min = '{0.0}'

        self.destandardization_y = standardization_y[0]
        if standardization_y[0] == "true":
            self.standardization_y_mean = self.__set_preprocessing_values(standardization_y[1], 'standardization_y_mean')
            self.standardization_y_std = self.__set_preprocessing_values(standardization_y[2], 'standardization_y_std')
        else:
            self.standardization_y_mean = '{0.0}'
            self.standardization_y_std = '{1.0}'
        
        # Set the name of the neural network
        self.name = name
        # Set the activation function of the model as ReLu activation
        self.variables = [
            'parameter Neural_Network.Activation_Function.Type_Activation_Function '
            'ActivationFunction=Neural_Network.Activation_Function.ReLu']
        # Declare a variable for extends
        self.extends = []
        # Declare a variable for the equation block
        self.equations = []

    def build_OM_Model(self):
        """
        Build a Modelica Model based on string-templates.
        """
        
        # Generate the .txt files for weights and bias from the trained neural network
        self.__set_Data()
        # Store the values from the .txt files into the layer structure of the neural network from the modelica library
        self.__setup_Model_variables()
        # 'Wrap' a Modelica Block around the whole neural network structure
        self.extends.extend(['extends Modelica.Blocks.Interfaces.MIMO(final nin={},final nout={})'.format(self.input_shape, self.output_shape)])
        # Generate the 'connect-Equations' here
        self.__setup_Model_equations()
        
        # Build the Modelica Model based on a template
        name = self.name + "_" + str(self.num_layers) + '_Layer'
        template = """block {name}\n  {variables}\n {extends}\nequation\n  {equations}\nend {name};"""
        model = template.format(name=name, variables=';\n  '.join(self.variables) + ';' if self.variables else '',
                                extends=';\n  '.join(self.extends) + ';' if self.extends else '',
                                equations=';\n  '.join(self.equations) + ';' if self.equations else '')
        
        # Store the model in a .mo file in the current directory
        path = os.getcwd()
        om_model = open(path+r'\Modelica_'+self.name+'_'+str(self.num_layers)+'_Layer.mo','w')
        om_model.write(model)
        om_model.close()

    def __set_Data(self):
        """
        Get the weights and the bias per layer from the trained neural network and store these values in the in .txt files.
        """
        
        # Variable that counts the number of layers, each layer gets its postion (start by 1) as unique number for identification 
        c = 0
        # Iterate over the layers that include trainable parameters
        for layer in self.nn.layers:
            if layer.get_weights() != []:
                c += 1
                self.neurons.append(layer.output_shape[1])
                # Save the weights in the correct format for matrices in OpenModelica 
                np.savetxt(str(c) + '_layer_weights.txt', layer.get_weights()[0].T, delimiter=',', newline=';', fmt='%8.8f')
                # Save the bias weights in the correct format for vectors in OpenModelica 
                np.savetxt(str(c) + '_layer_bias.txt', layer.get_weights()[1], delimiter=',', newline=',', fmt='%8.8f')
        self.num_layers = c

    def __setup_Model_variables(self):
        """
        Set the different layers of the neural network as variables of the modelica model.
        """
        
        # Setup the different layers by filling them with the values from the matching weight/bias .txt files
        # and reproduce the properties of the corresponding layer in the keras neural network
        
        # The Input layer gets additional information about scaling and standardization
        weights, bias = self.__load_net_parameters('{}_layer_weights.txt'.format(1), '{}_layer_bias.txt'.format(1))
        
        # Build first layer, check if feature reduction by PCA should be done or not
        if self.pca == "true":
             self.variables.extend([
            'Neural_Network.Layer.Input_Hidden_Layer Layer_1('
            'bias={},weights={},'
            'NeuronActivation_Function=ActivationFunction,numInputs={},numNeurons={},'
            'pca={},dimFeatures={},transMatrix={},mean_pca={},std_pca={},'
            'scale={},max={},min={},'
            'standardization={},mean={},std={})'.format(bias, weights,
                                                        self.input_shape, self.neurons[0],
                                                        self.pca,self.pca_dimFeatures,self.pca_transMatrix,self.pca_mean,self.pca_std,
                                                        self.scale_x, self.scale_x_max, self.scale_x_min,
                                                        self.standardization_x, self.standardization_x_mean, self.standardization_x_std)])
        else:
            self.variables.extend([
            'Neural_Network.Layer.Input_Hidden_Layer Layer_1('
            'bias={},weights={},'
            'NeuronActivation_Function=ActivationFunction,numInputs={},numNeurons={},'
            'scale={},max={},min={},'
            'standardization={},mean={},std={})'.format(bias, weights,
                                                        self.input_shape, self.neurons[0],
                                                        self.scale_x, self.scale_x_max, self.scale_x_min,
                                                        self.standardization_x, self.standardization_x_mean, self.standardization_x_std)])
             
                 
             
                 

        # Setup all the hidden layers
        for i in range(2, self.num_layers):
            weights, bias = self.__load_net_parameters('{}_layer_weights.txt'.format(i), '{}_layer_bias.txt'.format(i))
            hidden_layer = 'Neural_Network.Layer.Dense_Hidden_Layer Layer_##(bias={},weights={},' \
                           'NeuronActivation_Function=ActivationFunction,numInputs={},numNeurons={})'.format(
                bias, weights, self.neurons[i - 2], self.neurons[i-1])
            # Set the unique number to identife the single layers
            hidden_layer = hidden_layer.replace('##', str(i))
            # Put the single hidden layer in a one-element list
            hidden_layer_list = [hidden_layer]
            # Add the new hidden layer at the end of the list of all the hidden layers 
            self.variables.extend(hidden_layer_list)

        # The Output layer gets additional information about rescaling and destandardization
        weights, bias = self.__load_net_parameters('{}_layer_weights.txt'.format(self.num_layers),
                                                   '{}_layer_bias.txt'.format(self.num_layers))
        self.variables.extend([
            'Neural_Network.Layer.Output_Hidden_Layer Layer_{}('
            'bias={},weights={},'
            'numInputs={},numNeurons={},'
            'rescale={},max={},min={},'
            'destandardization={},mean={},std={})'.format(self.num_layers, bias, weights,
                                                        self.neurons[-2], self.neurons[-1],
                                                        self.rescale_y, self.scale_y_max, self.scale_y_min,
                                                        self.destandardization_y, self.standardization_y_mean, self.standardization_y_std)])
            

    def __load_net_parameters(self, file_weights, file_bias):
        """
        Load the weights and the bias values from a .txt file in the local directory.
        :param file_weights: String, specification of the filename where the needed weights are stored 
        :param file_bias: String, specification of the filename where the needed bias values are stored
        return: Strings that contain the weights and bias values in the needed OpenModelica syntax
        """
        
        # Read the content of the files
        fw = open(file_weights, 'r')
        fb = open(file_bias, 'r')
        sw = fw.read()
        sb = fb.read()
        # Add specific brackets around the weights to get a matrix in OpenModelica 
        w = '[' + sw[:-1] + ']'
        # Add specific brackets around the bias values to get a vector in OpenModelica
        b = '{' + sb[:-1] + '}'
        fw.close()
        fb.close()
        # Delete the files
        os.remove(file_weights)
        os.remove(file_bias)
        return w, b
    
    def __set_transMatrix(self, arr):
        """
        Converts the numpy array of the transformation matrix into a string taking into account the Modelica synatx for matrices.
        :param params: np.array, Transformation matrix to obtain the new features
        return: String representation of a matrix in OpenModelica syntax
        """
        np.savetxt('transMatrix.txt', arr, delimiter=',', newline=';', fmt='%8.8f')
        f = open('transMatrix.txt', 'r')
        s = f.read()
        om_mat = '[' + s[:-1] + ']'
        f.close()
        os.remove('transMatrix.txt')
        return om_mat

    def __set_preprocessing_values(self, params, name):
        """
        Converts the numpy arrays for scaling and standardization into a string taking into account the Modelica synatx for vectors.
        :param params: np.array, Min/Max or Mu/Sigma values for all feature dimensionen
        :param name: String, Name of the File where the values are stored
        return: String representation of a vector in OpenModelica syntax
        """
        
        filename = name + '.txt'
        np.savetxt(filename, params, delimiter=',', newline=',', fmt='%8.8f')
        f = open(filename, 'r')
        s = f.read()
        om_vec = '{' + s[:-1] + '}'
        f.close()
        os.remove(filename)
        return om_vec
        
    def __setup_Model_equations(self):
        """
        Setup the connect equations to link the single layers of the network.
        """
        
        # Connect the inputs with the neural network as the first equation
        self.equations.append('connect(u,Layer_1.u)')
        
        # Loop over the hidden layers and connect them
        for i in range(2, self.num_layers + 1):
            self.equations.append('connect(Layer_{}.y,Layer_{}.u)'.format(i - 1, i))
            
        # Connect the outputs of the network with outputs
        self.equations.append('connect(Layer_{}.y,y)'.format(self.num_layers))
