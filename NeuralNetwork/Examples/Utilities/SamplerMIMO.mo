within NeuralNetwork.Examples.Utilities;

block SamplerMIMO "Make continuous signals discrete with a definded sample rate"
  extends Modelica.Blocks.Interfaces.DiscreteMIMO;
equation
  // For every sample point the given output is the input at this time
  when {sampleTrigger, initial()} then
    y = u;
  end when;
end SamplerMIMO;
