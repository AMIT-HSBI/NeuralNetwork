within NeuralNetwork.Examples.Utilities;

block SimpleEquation
  extends Modelica.Blocks.Interfaces.SISO;
equation
  y = u*u + 0.5*u - 2.0;
annotation(
    Icon(graphics = {Text(textColor = {0, 0, 255}, extent = {{-98, 18}, {98, -18}}, textString = "y = u² + 0.5u - 2.0")}));
end SimpleEquation;
