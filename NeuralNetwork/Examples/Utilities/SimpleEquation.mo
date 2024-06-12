within NeuralNetwork.Examples.Utilities;

block SimpleEquation
  extends Modelica.Blocks.Interfaces.SISO;
equation
  y = u*u + 0.5*u - 2.0;
end SimpleEquation;
