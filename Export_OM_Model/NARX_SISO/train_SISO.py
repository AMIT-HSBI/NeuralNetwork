"""
NARX_SISO: Demonstrates how to train and export an NARX-Neural network for a Single-Input-Single-Output (SISO) system. It is also possible to reduce the input dimension by using PCA.
"""

# Standard Python libraries
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from scipy import signal

# Import from a higher directory
import sys
sys.path.append("..")

# Import custom neural network and OpenModelica export classes
from NeuralNets4OM import Neural_Network
from NeuralNets4OM import Neural_OM_Model as nom

# Load example data for a magnetic levitation system
def load_data():
    inputs = np.loadtxt('Data/inputs.csv', delimiter=',')
    outputs = np.loadtxt('Data/outputs.csv', delimiter=',')
    u_inter = inputs[:3200]
    y_inter = outputs[:3200]
    u_extra = inputs[3200:]
    y_extra = outputs[3200:]
    return u_inter, y_inter, u_extra, y_extra

u, y, u_pre, y_pre = load_data()

# Identification of time lags based on cross-correlation
def corrfunc(inpt, outpt):
    # Scale input and output to [0,1] for better comparability
    min_in = inpt.min(axis=0)
    max_in = inpt.max(axis=0)
    min_out = outpt.min(axis=0)
    max_out = outpt.max(axis=0)
    i = (inpt - min_in) / (max_in - min_in)
    o = (outpt - min_out) / (max_out - min_in)

    # Calculate cross-correlation
    corr = signal.correlate(i, o, mode='full')

    # Normalize the result so that the maximum has the value 1
    corr /= np.max(corr)

    # Find the index of the maximum value of the cross-correlation and return the associated index shift
    lags = signal.correlation_lags(len(i), len(o))
    return lags[np.argmax(corr)]

tau = corrfunc(u, y)
if tau < 0:
    print("Index shift: {}".format(tau))
    tau *= -1
else:
    print("No identification of delay with cross-correlation possible!")

# Generate the feature vector with a chosen time delay shift
def delay(ipts, opts, delay):
    # Initialize a list for the new features
    feature_list = [ipts[delay:]]

    # Generate delayed inputs and add them to features
    for i in range(1, delay + 1):
        feature_list.append(ipts[delay - i: -i])

    # Generate delayed outputs and add them to features
    for j in range(1, delay + 1):
        feature_list.append(opts[delay - j: -j])

    return np.stack(feature_list, axis=1)

features = delay(u, y, tau)
targets = y[tau:]

# Train the neural network as a normal feedforward network
nn = Neural_Network.Neural_Network(features, targets)
features_train, features_test, features_max, features_min = nn.scaling(nn.X_train, nn.X_test)
nn.train(features_train, nn.Y_train)
nn.nn.summary()

# Check if the network makes good predictions
inputs_list = [u_pre[tau]]

# Generate delayed inputs and add them to features
for i in range(1, tau + 1):
    inputs_list.append(u_pre[tau - i: -i])
delayed_inputs = np.stack(inputs_list, axis=1)
delayed_outputs = np.flip(y_pre[:tau])

output_net = []
for i in range(0, delayed_inputs.shape[0]):
    net_in = (np.concatenate([delayed_inputs[i], delayed_outputs]) - features_min) / (features_max - features_min)
    net_out = nn.nn.predict(np.array([net_in, ])).reshape(-1)
    output_net.append(net_out[0])
    delayed_outputs = np.concatenate([net_out, delayed_outputs[:-1])

# Plot the result
plt.plot(output_net)
plt.plot(y_pre[tau:])
plt.show()

# Generate a Modelica model of the neural network
NeuralOM = nom.Neural_OM_Model(nn.nn, ("false", None, None, None), ("true", features_max, features_min), ("false", None, None), ("false", None, None), ("false", None, None), "NARX")
NeuralOM.build_OM_Model()

# Perform Principal Component Analysis (PCA) to create a new feature vector

# Standardize the delayed feature vector
mu = np.mean(features, axis=0)
sigma = np.std(features, axis=0)
X = (features - mu) / sigma

Sigma = np.cov(X.T)
(lamb, w) = np.linalg.eig(Sigma)
eigVar = np.sort(lamb)[::-1]

# Get the size of the dimension where the cumulative variance proportion is higher than 99.5 percent.
cumVar = np.cumsum(eigVar) / np.sum(eigVar)
pca_idx = np.argmax(cumVar >= 0.995)
print(pca_idx)

eigenVarIdx = np.argsort(lamb)[::-1]
W = w[:, eigenVarIdx[0:pca_idx]]
feature_new = (W.T @ X.T).T

# Train the neural network with the new feature vector
nn = Neural_Network.Neural_Network(feature_new, targets)
features_train, features_test, features_max, features_min = nn.scaling(nn.X_train, nn.X_test)
nn.train(features_train, nn.Y_train)

# Check the prediction of the neural network with the previous PCA
inputs_list = [u_pre[tau:]]

# Generate delayed inputs and add them to features
for i in range(1, tau + 1):
    inputs_list.append(u_pre[tau - i: -i])

delayed_inputs = np.stack(inputs_list, axis=1)
delayed_outputs = np.flip(y_pre[:tau])

output_net = []
for i in range(0, delayed_inputs.shape[0]):
    f = (np.concatenate([delayed_inputs[i], delayed_outputs]) - mu) / sigma
    net_in = ((W.T @ f.T).T - features_min) / (features_max - features_min)
    net_out = nn.nn.predict(np.array([net_in, ])).reshape(-1)
    output_net.append(net_out[0])
    delayed_outputs = np.concatenate([net_out, delayed_outputs[:-1])

plt.plot(output_net)
plt.plot(y_pre[tau:])
plt.show()

# Generate a Modelica model of the neural network with the feature reduction based on the previous PCA
NeuralOM = nom.Neural_OM_Model(nn.nn, ("true", W.T, mu, sigma), ("true", features_max, features_min), ("false", None, None), ("false", None, None), ("false", None, None), "NARX_PCA")
NeuralOM.build_OM_Model()
