within NeuralNetwork.Examples.Utilities;

block SimpleLSTM
  extends NeuralNetwork.Networks.Interfaces.SISO(final u = layer.u[1], final y = layer.y[1]);
  Layer.LSTM layer(
    Wf = Wf,
    Wi = Wi,
    Wo = Wo,
    Wc = Wc,
    Uf = Uf,
    Ui = Ui,
    Uo = Uo,
    Uc = Uc,
    bf = bf,
    bi = bi,
    bo = bo,
    bc = bc,
    redeclare function sigma_g = NeuralNetwork.ActivationFunctions.Sigmoid,
    redeclare function sigma_c = NeuralNetwork.ActivationFunctions.Tanh,
    redeclare function sigma_h = NeuralNetwork.ActivationFunctions.Id,
    clk = Clock(1,100)
  ) annotation(
    Placement(transformation(origin = {0, 0}, extent = {{-30, -30}, {30, 30}})));

  parameter Real[2,1] Wf = {{0.9168842650273863}, {-0.41626278387433935}};
  parameter Real[2,1] Wi = {{-0.3579903628947263}, {-0.7272669817156694}};
  parameter Real[2,1] Wo = {{-0.3563311828380926}, {-0.23704936315985936}};
  parameter Real[2,1] Wc = {{-0.24949461025816877}, {0.5663348709465208}};

  parameter Real[2,2] Uf = {{0.9828238516747565, -0.4323916905269658}, {0.6597874743507453, -0.49797468723047333}};
  parameter Real[2,2] Ui = {{0.20470995578249807, 0.31776625052682883}, {0.6305946426671325, 0.05439201192681886}};
  parameter Real[2,2] Uo = {{0.13020845000176196, 0.13822326996697631}, {0.12134587258765883, -0.7152233831611636}};
  parameter Real[2,2] Uc = {{0.37901032286011893, -0.4157978629827952}, {-0.8435991979907957, 0.19994829923186774}};

  parameter Real[2] bf = {-0.5486002272036146, 0.09978158879021293};
  parameter Real[2] bi = {0.5991231180820973, -0.9000209428865766};
  parameter Real[2] bo = {0.2874148054581702, 0.07961885205233754};
  parameter Real[2] bc = {-0.2478805511544202, 0.49672666080562666};

end SimpleLSTM;
