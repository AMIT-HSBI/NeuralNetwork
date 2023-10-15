import numpy as np
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import Dropout
from keras.regularizers import l2
from keras.layers import GaussianNoise
from keras.callbacks import ModelCheckpoint
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split


class Neural_Network:
    """
    Class to desgin, train and store a neural network with keras. 
    """
    
    def __init__(self, Features, Targets):
        """
        Initializes the training and test sets of the neural network and preinitialize variables for the neural network and the predicted output 
        :param Features: np.array, holds the input variables
        :param Targets: np.array, holds the output variables
        """
        
        # Split the Data in Test and Training sets
        self.X_train, self.X_test, self.Y_train, self.Y_test = train_test_split(Features, Targets)
        # Set the input dimension of the neural network based on the features
        if Features.ndim == 1:
            self.input_dim = 1
        else:
            self.input_dim = Features.shape[1]
        # Set the output dimension of the neural network based on the targets
        if Targets.ndim == 1:
            self.output_dim = 1
        else:
            self.output_dim = Targets.shape[1]
        # Allocate the neural network
        self.nn = None
        # Preinitialize the vector for the neural network prediction
        self.Y_pred = None

    def standardization(self, train, test, with_test_set=True):
        """
        Performs the mu-sigma standardization.
        :param train: np.array, set of training features/targets of the neural network
        :param test: np.array, set of test features/targets of the neural network
        :param with_test_set: bool (default 'True'), set it to 'False' if targets are uesed
        :return: tuple of the standardized training and test set as well as the mean and the standard deviation of the given training set
        """
        
        mean = train.mean(axis=0)
        std = train.std(axis=0)
        train -= mean
        train /= std
        if with_test_set:
            test -= mean
            test /= std
        return train, test, mean, std


    def scaling(self, train, test, with_test_set=True):
        """
        Performs min-max scaling.
        :param train: np.array, set of training features/targets of the neural network
        :param test: np.array, set of test features/targets of the neural network
        :param with_test_set: bool (default 'True'), set it to 'False' if targets are uesed
        :return: tuple of the standardized training and test set as well as the maximum and the minimum of the given training set
        """
        
        min_train = train.min(axis=0)
        max_train = train.max(axis=0)
        train -= min_train
        train /= (max_train - min_train)
        if with_test_set:
            test -= min_train
            test /= (max_train - min_train)
        return train, test, max_train, min_train

    def plot_data(self, features, targets):
        """
        Plot the targets depending on the features.
        :param features: np.array, set of features of the neural network
        :param targets: np.array, set of targets of the neural network
        """
        
        fig, ax = plt.subplots()
        ax.scatter(features, targets)
        plt.show()

    def train(self, features, targets, monitor=True):
        """
        Builds a Neural Network based on a fixed architecture. This network is trained by keras and the resulting network, meaning the wights with the best result on an validation set, is stored in 'self.nn'. 
        :param features: np.array, set of training features for the neural network
        :param targets: np.array, set of training targets for the neural network to learn
        :param monitor: bool (default 'True'), when activated the loss of the training and validation set is plotted
        """
        
        # Generate a validation set, based on the training features
        (features_val, targets_val, features_tr, targets_tr) = self.__divValTrainSet(features, targets)
        
        # Initializtion of a Neural Network with Keras
        self.nn = Sequential()
        # 1 Hidden-Layer
        self.nn.add(Dense(96, input_dim=self.input_dim, kernel_regularizer=l2(0.01), activation='relu'))
        self.nn.add(Dropout(0.35))
        self.nn.add(GaussianNoise(0.15))
        # 2 Hidden-Layer
        self.nn.add(Dense(96, kernel_regularizer=l2(0.01), activation='relu'))
        self.nn.add(Dropout(0.35))
        self.nn.add(GaussianNoise(0.15))
        # 2 Hidden-Layer
        self.nn.add(Dense(96, kernel_regularizer=l2(0.01), activation='relu'))
        self.nn.add(Dropout(0.35))
        self.nn.add(GaussianNoise(0.15))
        # Output Layer
        self.nn.add(Dense(self.output_dim, activation='linear'))
        self.nn.compile(loss='mean_squared_error', optimizer='Nadam')

        # Use the best weights that from the whole whole training process
        checkpoint = ModelCheckpoint('bestW.h5', monitor='val_loss', verbose=False, save_weights_only=True, save_best_only=True)
        callbackslist = [checkpoint]

        # Train the Network and load the best weights after that back into the network
        hist = self.nn.fit(features_tr, targets_tr, epochs=2500, verbose=False, validation_data=(features_val, targets_val), callbacks=callbackslist)
        # Reload the net with the best weights
        self.nn.load_weights('bestW.h5')

        # Plot the health of the training process
        if monitor:
            lossMonitor = np.array(hist.history['loss'])
            valLossMonitor = np.array(hist.history['val_loss'])
            counts = np.arange(lossMonitor.shape[0])

            fig = plt.figure(figsize=(12, 8))

            ax = fig.add_subplot(1, 1, 1)
            ax.plot(counts, lossMonitor, 'b', label='Training loss')
            ax.plot(counts, valLossMonitor, 'r', label='Validation loss')
            ax.set_xlabel('Epoch')
            ax.set_ylabel('Loss')
            ax.legend()

            plt.show()
            
    def __divValTrainSet(self, X, Y):
        """
        Function which splits off the validation set. 
        :param X: np.array, set of training features for the neural network
        :param Y: np.array, set of training targets for the neural network to learn
        return: tuple of the validation features and targets, as well as the training features and targets. 
        """
        
        # Choose the indices of the validation set with a probability of 0.15
        ValSet = np.random.choice(X.shape[0], int(X.shape[0]*0.15), replace=False)
        # Delete the elements of the validation set from the training set
        TrainSet = np.delete(np.arange(0,Y.shape[0] ),ValSet)
        # Set the validation and training set based on the previously selected indices
        if X.ndim == 1:
            XVal = X[ValSet]
            X = X[TrainSet]
        else:
            XVal = X[ValSet,:]
            X = X[TrainSet,:]
        YVal = Y[ValSet] 
        Y = Y[TrainSet] 
        return (XVal, YVal, X, Y)

    def predict_on_test_data(self, test_features, test_targets, rescale_outputs=False, max=1.0, min=0.0, destandardize_outputs=False, mean=1.0, std=0.0, verbose=False):
        """
        Test the performance of the neural network by using a test dataset. When the training features were scaled or standardized it is necessary to rescale or destandardize the the outputs. 
        :param test_features: np.array, set of unknwon test features
        :param test_targets: np.array, set of unknwon test targets
        :param rescale_outputs: bool (default 'False'), must be 'True' if the training targets had been scaled 
        :param max: float (default '1.0'), maximum of the training targets
        :param min: float (default '0.0'), minimum of the training targets
        :param destandardize_outputs: bool (default 'False'), must be 'True' if the training targets had been standardize 
        :param mean: float (default '0.0'), estimated mean of the training targets
        :param std: float (default '1.0'), estimated standard deviation of the training targets
        :param verbose: bool (default 'False'), can activated to calculate the mean absoute error of the neural network prediction. It also plots the real and the predicted output against each other.
        """
        
        if self.nn != None:
            # if trainig targets were scaled before, the prediction of the network needed to be rescaled
            if rescale_outputs:
                self.Y_pred = self.nn.predict(test_features) * (max-min) + min
             # if trainig targets were standardize before, the prediction of the network needed to be destandardize
            elif destandardize_outputs:
                self.Y_pred = self.nn.predict(test_features) * std + mean
            else:
                self.Y_pred = self.nn.predict(test_features)
            # Calculate the mean absolute error as an additional error measure
            if verbose:
                error = self.Y_pred.reshape(-1) - test_targets.reshape(-1)
                plt.plot(test_targets, 'g', alpha=0.4, label='Test Data')
                plt.plot(self.Y_pred, '--r', label='Prediction')
                plt.legend()
                plt.show()
                print(np.mean(np.abs(error)))
