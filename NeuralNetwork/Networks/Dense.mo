within NeuralNetwork.Networks;

partial block Dense
  extends NeuralNetwork.Networks.Interfaces.Network;

  parameter Integer numHiddenLayers(min=0) = 0;

  Layer.Input inputLayer(numInputs=numInputs) annotation(
    Placement(transformation(origin = {-70, 3.55271e-15}, extent = {{-30, -30}, {30, 30}})));
  Layer.Hidden[numHiddenLayers] hiddenLayers annotation(
    Placement(transformation(extent = {{-30, -30}, {30, 30}})));
  Layer.Output outputLayer annotation(
    Placement(transformation(origin = {70, 0}, extent = {{-30, -30}, {30, 30}})));

equation
  connect(u, inputLayer.u);

  // Connect inputs with first hidden layer
  if numHiddenLayers > 0 then
    connect(inputLayer.y, hiddenLayers[1].u) annotation(
    Line(points = {{-52, 0}, {-20, 0}}, color = {0, 0, 127}, thickness = 0.5));
    connect(hiddenLayers[numHiddenLayers].y, outputLayer.u) annotation(
      Line(points = {{18, 0}, {50, 0}}, color = {0, 0, 127}, thickness = 0.5));
  else
    connect(inputLayer.y, outputLayer.u);
  end if;

  // Connect hidden layers
  for i in 1:(numHiddenLayers-1) loop
    connect(hiddenLayers[i].y, hiddenLayers[i+1].u);
  end for;

  connect(outputLayer.y, y);
end Dense;
