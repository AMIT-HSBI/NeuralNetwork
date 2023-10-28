"""
train_MISO: Train and Export an NARX-Neural Network for a Multiple-Input-Single-Output (MISO) System with Optional PCA.

This code demonstrates how to train and export an NARX-Neural network for a MISO system. You can also apply Principal Component Analysis (PCA) to reduce input dimension.

The dataset used in this example allows the training of a neural network to predict the pH of a solution in a tank from the flow rates of acid and base solutions.

Features:
    - u1: Acid solution flow in liters
    - u2: Base solution flow in liters 

Target:
    - y: The pH of the solution in the tank
"""

# Standard Python libraries
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from scipy import signal
import sys

# Import custom neural network and OpenModelica export classes
sys.path.append("..")
from NeuralNets4OM import Neural_Network
from NeuralNets4OM import Neural_OM_Model as nom

# Function to load the dataset
def load_data(train_size):
    input1 = pd.read_csv('Data/u1.csv', header=None).to_numpy()
    input2 = pd.read_csv('Data/u2.csv', header=None).to_numpy()
    output = pd.read_csv('Data/y.csv', header=None).to_numpy()
    test_size = input1.shape[0] - train_size
    u1_inter = input1[test_size:].reshape(train_size,)
    u2_inter = input2[test_size:].reshape(train_size,)
    y_inter = output[test_size:].reshape(train_size,)
    u1_extra = input1[:test_size].reshape(test_size,)
    u2_extra = input2[:test_size].reshape(test_size,)
    y_extra = output[:test_size].reshape(test_size,)
    return u1_inter, u2_inter, y_inter, u1_extra, u2_extra, y_extra

u1, u2, y, u1_pre, u2_pre, y_pre = load_data(1800)

# Identify the time delay using cross-correlation
def corrfunc(inpt, outpt):
    # Scale input and output to [0,1] for better comparability
    min_in = inpt.min(axis=0)
    max_in = inpt.max(axis=0)
    min_out = outpt.min(axis=0)
    max_out = outpt.max(axis=0)
    i = (inpt - min_in) / (max_in - min_in)
    o = (outpt - min_out) / (max_out - min_out)
    # Calculate cross-correlation
    corr = signal.correlate(i, o, mode='full')
    # Normalize the result so that the maximum has the value 1
    corr /= np.max(corr)
    # Function returns an array containing the indices of the forward resp. backward shift,
    # where the index '0' is the one where the two signals are identical
    lags = signal.correlation_lags(len(i), len(o))
    # Find the index of the maximum value of the cross-correlation and return the associated index shift
    return lags[np.argmax(corr)]

tau1 = corrfunc(u1, y)
tau2 = corrfunc(u2, y)

# Functions for adding the estimated time delay
def delay_input(i, d, l):
    # Add the current input
    if l == []:
        l = [i[d:]]
    else:
         l.append(i[d:])
    # Generate delayed inputs and add them to features
    for j in range(1, d + 1):
        l.append(i[d - j: -j])
    return l

def delay_output(o, d, l):
    # Generate delayed outputs and add them to features
    for j in range(1, d + 1):
        l.append(o[d - j: -j])
    return l

def delay(ipts, opts, delay):
    feature_list = []
    for i_dim in ipts:
        feature_list = delay_input(i_dim, delay, feature_list)
    for o_dim in opts:
         feature_list = delay_output(o_dim, delay, feature_list)
    return np.stack(feature_list, axis=1)

tau = min([tau1, tau2])
if tau < 0:
    print("Index shift: {}".format(tau))
    tau *= -1
else:
    print("No identification of delay with cross-correlation possible!")
    
features = delay([u1, u2], [y], tau)
targets = y[tau:]

# Perform PCA to reduce the feature space

# mu-sigma standardization
mu = np.mean(features, axis=0)
sigma = np.std(features, axis=0)
X = (features - mu) / sigma

Sigma = np.cov(X.T)
lamb, w = np.linalg.eig(Sigma)
eigVar = np.sort(lamb)[::-1]

sumEig = np.sum(lamb)
eigVar = eigVar / sumEig
cumVar = np.cumsum(eigVar)

pca_idx = np.argmax(cumVar > 0.8)
print(pca_idx)

# Sort eigenvectors and create a new feature space
eigenVarIdx = np.argsort(lamb)[::-1]
W = w[:, eigenVarIdx[0: pca_idx]]
features_new = (W.T @ X.T).T

# Train the neural network (to use PCA use 'features_new')
nn = Neural_Network.Neural_Network(features, targets)
features_train, features_test, features_max, features_min = nn.scaling(nn.X_train, nn.X_test)
nn.train(features_train, nn.Y_train)
# Make a prediction
nn.predict_on_test_data(features_test, nn.Y_test, verbose=True)

# Export the trained model to OpenModelica
NeuralOM = nom.Neural_OM_Model(nn.nn, ("false", None, None, None), ("true", features_max, features_min), ("false", None, None), ("false", None, None), ("false", None, None), "NARX_MISO")
NeuralOM.build_OM_Model()
