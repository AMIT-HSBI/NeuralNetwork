within NeuralNetwork.Examples.Utilities;

block TimeDelay
  extends Modelica.Blocks.Interfaces.DiscreteMIMO;
  // Store the initial delayed inputs here
  parameter Real y_start[nout] = zeros(nout) "Initial (already delayed) output signal";
  parameter Integer numInputs = 1 "Number of the system Inputs";
  parameter Integer numOutputs = 1 "Number of the system Outputs";
  // Delay of inputs: delay+1
  parameter Integer delay = 1 "Shift of the Inputs and Outputs";
equation
  // At every discrete time step store the new input at 1. Position of feature vector
  when sampleTrigger then
    for i in 1:nout loop
      // Shift the old entries one position behind and delete the latest inputsignal for each Inputsource
      if i <= numInputs * (delay + 1) then
        if mod(i, delay + 1) == 1 then
          y[i] = u[integer(i / (delay + 1)) + 1];
        else
          y[i] = pre(y[i - 1]);
        end if;
      // Shift the old values one position behind, the oldest entry will be deleted for each Outputsignal
      else
        if mod(i - numInputs * (delay + 1), delay) == 1 then
          y[i] = pre(u[numInputs + 1 + integer((i - numInputs * (delay + 1))/ delay)]);
        else
          y[i] = pre(y[i - 1]);
        end if;
      end if;
    end for;
  end when;
initial equation
  y = y_start;
end TimeDelay;
