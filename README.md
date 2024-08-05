# NeuralNetwork

[![Coverage][test-badge]][test-link]
[![HelloWorld Example][example-badge]][example-link]

NeuralNetwork Modelica library.

## Library description

The NeuralNetwork library is developed in Modelica 4.0 and offers dense
feed-forward artificial neural network structures in pure Modelica.

## Example

Modelica model `NeuralNetwork.Examples.HelloWorld` replace polynomial Modelica
equation

$$ f: [-1, 1] \to \mathbb{R}, f(u) = u^2 + 0.5 u - 2  $$

with a dense feed forward neural network with one input and one output layer.

![NeuralNetwork.Examples.HelloWorld][helloWorld-img]

The training of the neural network is done with
[TensorFlow][tensorflow-link]. Training and export to Modelica is
showcased in Jupyter notebook
[Example/helloWorld.ipynb][example-link].

## Current release

[Version 2.1.0][release-link]

## License

This package is licensed under the [3-Clause BSD License][license].

## Development and contribution

The development is organized by
[Hochschule Bielefeld – University of Applied Sciences and Arts, Faculty of Engineering and Mathematics][hsbi-link].

Contributor need to sign a contributor license agreement.

This package is based on [NeuralNetwork v1.0 (2006-04-28)][nn-v1-link].

### Build Python packages

[PythonToModelica][python-package] is a Python package to help exporting
artificial neural networks from Python to Modelica and used in
[Example/helloWorld.ipynb][example-ipynb]. See [README.md][python-readme] for
build instructions.

### Issues

You may report any issues by using the [Issue Tracker][issues-link].

[test-badge]:      https://github.com/AMIT-HSBI/NeuralNetwork/actions/workflows/coverage.yml/badge.svg
[test-link]:       https://github.com/AMIT-HSBI/NeuralNetwork/actions/workflows/coverage.yml
[example-badge]:   https://github.com/AMIT-HSBI/NeuralNetwork/actions/workflows/example.yml/badge.svg
[example-link]:    https://github.com/AMIT-HSBI/NeuralNetwork/actions/workflows/example.yml
[tensorflow-link]: https://www.tensorflow.org/
[release-link]:    https://github.com/AMIT-HSBI/NeuralNetwork/releases/tag/v2.1.0
[nn-v1-link]:      https://github.com/modelica-3rdparty/NeuralNetwork
[hsbi-link]:       https://www.hsbi.de/ium
[issues-link]:     https://github.com/AMIT-HSBI/NeuralNetwork/issues
[example-ipynb]:   ./Example/helloWorld.ipynb
[helloWorld-img]:  ./img/HelloWorld.png
[license]:         ./LICENSE
[python-package]:  ./PythonToModelica/
[python-readme]:   ./PythonToModelica/README.md
