model NARX_MISO
  // Application of the MISO NARX-Neural Network that was created in Python and exported to OpenModelica.
  // It is importent to model the estimated time lags.
  Neural_Network.Utilities.TimeDelay timeDelay(delay = 4, nin = 3, nout = 14, numInputs = 2, numOutputs = 1, samplePeriod = 10, y_start = {10.89064200, 11.93020100, 9.46135470, 11.02564200, 8.87583670, 1.00000000, 1.00000000, 1.00000000, 1.00000000, 1.00000000, 10.95541600, 10.89493000, 10.83935000, 6.91290870}) annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable timeTable_y(table = [0.00000000, 10.96989000; 10.00000000, 10.98481300; 20.00000000, 10.99991500; 30.00000000, 11.01624200; 40.00000000, 11.02986000; 50.00000000, 11.04274700; 60.00000000, 11.07037400; 70.00000000, 11.07719000; 80.00000000, 11.09499900; 90.00000000, 11.11799100; 100.00000000, 11.13570800; 110.00000000, 11.15447000; 120.00000000, 11.14974300; 130.00000000, 11.13681100; 140.00000000, 11.14483100; 150.00000000, 11.15262500; 160.00000000, 11.15818700; 170.00000000, 11.16584900; 180.00000000, 11.15498700; 190.00000000, 11.14579800; 200.00000000, 11.16485500; 210.00000000, 11.17683500; 220.00000000, 11.05917800; 230.00000000, 10.89493600; 240.00000000, 10.61499300; 250.00000000, 9.83171040; 260.00000000, 6.00605160; 270.00000000, 5.62466230; 280.00000000, 5.40523860; 290.00000000, 5.24967910; 300.00000000, 5.11683850; 310.00000000, 5.02158460; 320.00000000, 4.94281880; 330.00000000, 4.85275750; 340.00000000, 4.77398730; 350.00000000, 4.70344430; 360.00000000, 4.63440890; 370.00000000, 4.56664700; 380.00000000, 4.51319900; 390.00000000, 4.46079100; 400.00000000, 4.41068460; 410.00000000, 4.36280420; 420.00000000, 4.31692130; 430.00000000, 4.27297520; 440.00000000, 4.23089310; 450.00000000, 4.19051930; 460.00000000, 4.15251140; 470.00000000, 4.61637610; 480.00000000, 5.01807170; 490.00000000, 5.53889850; 500.00000000, 10.24042500; 510.00000000, 10.86452600; 520.00000000, 11.09112000; 530.00000000, 11.22622800; 540.00000000, 11.31971200; 550.00000000, 11.38933500; 560.00000000, 11.44359700; 570.00000000, 11.48717900; 580.00000000, 11.52290000; 590.00000000, 11.55268500; 600.00000000, 11.57781000; 610.00000000, 11.59922400; 620.00000000, 11.61761400; 630.00000000, 11.63352000; 640.00000000, 11.64734400; 650.00000000, 11.65939700; 660.00000000, 11.66995000; 670.00000000, 11.67185200; 680.00000000, 11.68091300; 690.00000000, 11.69747400; 700.00000000, 11.71143100; 710.00000000, 11.70714300; 720.00000000, 11.63178700; 730.00000000, 11.56676000; 740.00000000, 11.48116900; 750.00000000, 11.38007300; 760.00000000, 11.28674300; 770.00000000, 11.17064200; 780.00000000, 11.04649300; 790.00000000, 10.84968200; 800.00000000, 10.49536500; 810.00000000, 6.74840670; 820.00000000, 5.72856670; 830.00000000, 5.45858660; 840.00000000, 5.22510510; 850.00000000, 5.06010540; 860.00000000, 4.93300440; 870.00000000, 4.82998470; 880.00000000, 4.74421840; 890.00000000, 4.67149200; 900.00000000, 4.60873690; 910.00000000, 4.55369730; 920.00000000, 4.50411610; 930.00000000, 4.45791150; 940.00000000, 4.41295170; 950.00000000, 4.36788610; 960.00000000, 4.32256360; 970.00000000, 4.52928920; 980.00000000, 4.70843880; 990.00000000, 4.86370190; 1000.00000000, 5.00653950; 1010.00000000, 5.14547680; 1020.00000000, 5.28960150; 1030.00000000, 5.45470500; 1040.00000000, 5.66265160; 1050.00000000, 5.97640290; 1060.00000000, 6.65716480; 1070.00000000, 9.87379140; 1080.00000000, 10.22147000; 1090.00000000, 10.39435700; 1100.00000000, 10.51103100; 1110.00000000, 10.60595800; 1120.00000000, 10.69237700; 1130.00000000, 10.77397900; 1140.00000000, 10.85062100; 1150.00000000, 10.92198100; 1160.00000000, 10.98659400; 1170.00000000, 11.04301300; 1180.00000000, 11.09040500; 1190.00000000, 11.12751400; 1200.00000000, 11.15439200; 1210.00000000, 11.16866800; 1220.00000000, 11.03553500; 1230.00000000, 10.84121700; 1240.00000000, 10.50506600; 1250.00000000, 6.74296370; 1260.00000000, 5.75899650; 1270.00000000, 5.45554250; 1280.00000000, 5.28681040; 1290.00000000, 5.15660300; 1300.00000000, 5.01874200; 1310.00000000, 4.89487360; 1320.00000000, 4.82140060; 1330.00000000, 4.75407650; 1340.00000000, 4.69075990; 1350.00000000, 4.63056880; 1360.00000000, 4.57282390; 1370.00000000, 4.51702030; 1380.00000000, 4.46279230; 1390.00000000, 4.40991390; 1400.00000000, 4.35832460; 1410.00000000, 4.30801920; 1420.00000000, 4.25905720; 1430.00000000, 4.21160890; 1440.00000000, 4.16583700; 1450.00000000, 4.12196630; 1460.00000000, 4.08085670; 1470.00000000, 4.57378080; 1480.00000000, 4.97097610; 1490.00000000, 5.43481470; 1500.00000000, 9.62003460; 1510.00000000, 10.73946800; 1520.00000000, 11.00129800; 1530.00000000, 11.15003000; 1540.00000000, 11.25201300; 1550.00000000, 11.32866700; 1560.00000000, 11.38989400; 1570.00000000, 11.44085100; 1580.00000000, 11.48455100; 1590.00000000, 11.52298200; 1600.00000000, 11.55732300; 1610.00000000, 11.58842100; 1620.00000000, 11.61675500; 1630.00000000, 11.64268500; 1640.00000000, 11.66635100; 1650.00000000, 11.68779700; 1660.00000000, 11.70707900; 1670.00000000, 11.72413900; 1680.00000000, 11.73899600; 1690.00000000, 11.75158700; 1700.00000000, 11.76191700; 1710.00000000, 11.76995000; 1720.00000000, 11.77572300; 1730.00000000, 11.77923700; 1740.00000000, 11.78058300; 1750.00000000, 11.77985600; 1760.00000000, 11.77721000; 1770.00000000, 11.77285400; 1780.00000000, 11.76699900; 1790.00000000, 11.75993800; 1800.00000000, 11.75193500; 1810.00000000, 11.74331700; 1820.00000000, 11.73439600; 1830.00000000, 11.72550300; 1840.00000000, 11.71696900; 1850.00000000, 11.70910600; 1860.00000000, 11.70221900; 1870.00000000, 11.69656900; 1880.00000000, 11.69238600; 1890.00000000, 11.68983800; 1900.00000000, 11.68904400; 1910.00000000, 11.69005100; 1920.00000000, 11.69284900; 1930.00000000, 11.69735900; 1940.00000000, 11.70345000; 1950.00000000, 11.71126100; 1960.00000000, 11.71987600]) annotation(
    Placement(visible = true, transformation(origin = {-84, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable timeTable_u1(table = [0.00000000, 10.89064200; 10.00000000, 11.01342300; 20.00000000, 10.60607400; 30.00000000, 10.52653900; 40.00000000, 11.53882900; 50.00000000, 9.09083990; 60.00000000, 11.06597900; 70.00000000, 9.91092710; 80.00000000, 9.09962740; 90.00000000, 9.43705990; 100.00000000, 8.66602880; 110.00000000, 9.94606950; 120.00000000, 11.59062500; 130.00000000, 11.63683200; 140.00000000, 8.24225730; 150.00000000, 10.01809200; 160.00000000, 10.06516800; 170.00000000, 9.27613180; 180.00000000, 11.94656800; 190.00000000, 9.06457800; 200.00000000, 8.36293160; 210.00000000, 11.79105700; 220.00000000, 10.00282800; 230.00000000, 9.10832720; 240.00000000, 11.65527000; 250.00000000, 10.11899000; 260.00000000, 9.85778330; 270.00000000, 11.76392000; 280.00000000, 8.20033590; 290.00000000, 11.08081800; 300.00000000, 11.31126900; 310.00000000, 8.50146150; 320.00000000, 10.75382100; 330.00000000, 11.47298900; 340.00000000, 10.94489800; 350.00000000, 10.90164800; 360.00000000, 11.99783200; 370.00000000, 8.93277950; 380.00000000, 10.00000000; 390.00000000, 10.00000000; 400.00000000, 10.00000000; 410.00000000, 10.00000000; 420.00000000, 10.00000000; 430.00000000, 10.00000000; 440.00000000, 10.00000000; 450.00000000, 10.00000000; 460.00000000, 10.00000000; 470.00000000, 10.00000000; 480.00000000, 10.00000000; 490.00000000, 10.00000000; 500.00000000, 10.00000000; 510.00000000, 10.00000000; 520.00000000, 10.00000000; 530.00000000, 10.00000000; 540.00000000, 10.00000000; 550.00000000, 10.00000000; 560.00000000, 10.00000000; 570.00000000, 10.00000000; 580.00000000, 10.00000000; 590.00000000, 10.00000000; 600.00000000, 10.00000000; 610.00000000, 10.00000000; 620.00000000, 10.00000000; 630.00000000, 10.00000000; 640.00000000, 10.00000000; 650.00000000, 10.00000000; 660.00000000, 11.96797200; 670.00000000, 11.95844600; 680.00000000, 8.45447100; 690.00000000, 8.55393050; 700.00000000, 8.66152030; 710.00000000, 11.87600000; 720.00000000, 9.84969780; 730.00000000, 11.57732400; 740.00000000, 11.76732500; 750.00000000, 11.90334100; 760.00000000, 8.49802550; 770.00000000, 9.43989000; 780.00000000, 8.98420680; 790.00000000, 11.92676000; 800.00000000, 11.65465600; 810.00000000, 11.20931200; 820.00000000, 8.06460770; 830.00000000, 11.87057700; 840.00000000, 11.99982400; 850.00000000, 11.85112500; 860.00000000, 11.44514900; 870.00000000, 10.83831900; 880.00000000, 10.11497500; 890.00000000, 9.37565150; 900.00000000, 8.72310290; 910.00000000, 8.24802360; 920.00000000, 8.01644230; 930.00000000, 8.06054530; 940.00000000, 8.37420290; 950.00000000, 8.91382150; 960.00000000, 9.60440240; 970.00000000, 10.34996500; 980.00000000, 11.04688800; 990.00000000, 11.59831000; 1000.00000000, 11.92759100; 1010.00000000, 11.98896600; 1020.00000000, 11.77390500; 1030.00000000, 9.50691340; 1040.00000000, 10.20143400; 1050.00000000, 10.87153000; 1060.00000000, 11.43594900; 1070.00000000, 11.82625300; 1080.00000000, 11.99511500; 1090.00000000, 11.92206000; 1100.00000000, 11.61594700; 1110.00000000, 11.11389300; 1120.00000000, 10.47677400; 1130.00000000, 9.78184390; 1140.00000000, 9.11336650; 1150.00000000, 8.55239750; 1160.00000000, 8.16695690; 1170.00000000, 8.00378120; 1180.00000000, 8.08265610; 1190.00000000, 8.39401770; 1200.00000000, 8.90011210; 1210.00000000, 9.53957280; 1220.00000000, 10.23486300; 1230.00000000, 10.90167400; 1240.00000000, 11.45915300; 1250.00000000, 11.83970400; 1260.00000000, 8.02602590; 1270.00000000, 8.01066460; 1280.00000000, 8.02102580; 1290.00000000, 8.00637580; 1300.00000000, 11.99070200; 1310.00000000, 8.00397460; 1320.00000000, 8.05640310; 1330.00000000, 8.16820250; 1340.00000000, 8.33595770; 1350.00000000, 8.55454420; 1360.00000000, 8.81728490; 1370.00000000, 9.11615400; 1380.00000000, 9.44202180; 1390.00000000, 9.78493420; 1400.00000000, 10.13441600; 1410.00000000, 10.47979200; 1420.00000000, 10.81051200; 1430.00000000, 11.11647300; 1440.00000000, 11.38832900; 1450.00000000, 11.61777600; 1460.00000000, 11.79780600; 1470.00000000, 11.92291700; 1480.00000000, 11.98929000; 1490.00000000, 11.99489500; 1500.00000000, 11.93956300; 1510.00000000, 11.82498300; 1520.00000000, 11.65465600; 1530.00000000, 11.43378400; 1540.00000000, 11.16911400; 1550.00000000, 10.86873100; 1560.00000000, 10.54181200; 1570.00000000, 10.19834100; 1580.00000000, 9.84881210; 1590.00000000, 9.50390140; 1600.00000000, 9.17414490; 1610.00000000, 8.86961580; 1620.00000000, 8.59961640; 1630.00000000, 8.37239440; 1640.00000000, 8.19489080; 1650.00000000, 8.07252770; 1660.00000000, 8.00904290; 1670.00000000, 8.00637580; 1680.00000000, 8.06460770; 1690.00000000, 8.18196000; 1700.00000000, 8.35484770; 1710.00000000, 8.57798980; 1720.00000000, 8.84456990; 1730.00000000, 9.14644490; 1740.00000000, 9.47439330; 1750.00000000, 9.81839740; 1760.00000000, 10.16794900; 1770.00000000, 10.51237000; 1780.00000000, 10.84114000; 1790.00000000, 11.14421600; 1800.00000000, 11.41233900; 1810.00000000, 11.63732000; 1820.00000000, 11.81228500; 1830.00000000, 11.93189100; 1840.00000000, 11.99248400; 1850.00000000, 11.99221200; 1860.00000000, 11.93108500; 1870.00000000, 11.81096800; 1880.00000000, 11.63553300; 1890.00000000, 11.41013600; 1900.00000000, 11.14166500; 1910.00000000, 10.83831900; 1920.00000000, 10.50936500; 1930.00000000, 10.16485100; 1940.00000000, 9.81530190; 1950.00000000, 9.47139470; 1960.00000000, 9.14363470]) annotation(
    Placement(visible = true, transformation(origin = {-86, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Neural_Network.Utilities.SamplerMIMO sampler(nin = 3, nout = 3, samplePeriod = 10) annotation(
    Placement(visible = true, transformation(origin = {18, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable timeTable_u2(table = [0.00000000, 1.00000000; 10.00000000, 1.00000000; 20.00000000, 1.00000000; 30.00000000, 1.00000000; 40.00000000, 1.00000000; 50.00000000, 1.00000000; 60.00000000, 1.00000000; 70.00000000, 1.00000000; 80.00000000, 1.00000000; 90.00000000, 1.00000000; 100.00000000, 1.00000000; 110.00000000, 1.00000000; 120.00000000, 1.00000000; 130.00000000, 1.00000000; 140.00000000, 1.00000000; 150.00000000, 1.00000000; 160.00000000, 1.00000000; 170.00000000, 1.00000000; 180.00000000, 1.00000000; 190.00000000, 1.00000000; 200.00000000, 1.00000000; 210.00000000, 1.00000000; 220.00000000, 0.00000000; 230.00000000, 0.00000000; 240.00000000, 0.00000000; 250.00000000, 0.00000000; 260.00000000, 0.00000000; 270.00000000, 0.00000000; 280.00000000, 0.00000000; 290.00000000, 0.00000000; 300.00000000, 0.00000000; 310.00000000, 0.00000000; 320.00000000, 0.00000000; 330.00000000, 0.00000000; 340.00000000, 0.00000000; 350.00000000, 0.00000000; 360.00000000, 0.00000000; 370.00000000, 0.00000000; 380.00000000, 0.00000000; 390.00000000, 0.00000000; 400.00000000, 0.00000000; 410.00000000, 0.00000000; 420.00000000, 0.00000000; 430.00000000, 0.00000000; 440.00000000, 0.00000000; 450.00000000, 0.00000000; 460.00000000, 0.00000000; 470.00000000, 2.00000000; 480.00000000, 2.00000000; 490.00000000, 2.00000000; 500.00000000, 2.00000000; 510.00000000, 2.00000000; 520.00000000, 2.00000000; 530.00000000, 2.00000000; 540.00000000, 2.00000000; 550.00000000, 2.00000000; 560.00000000, 2.00000000; 570.00000000, 2.00000000; 580.00000000, 2.00000000; 590.00000000, 2.00000000; 600.00000000, 2.00000000; 610.00000000, 2.00000000; 620.00000000, 2.00000000; 630.00000000, 2.00000000; 640.00000000, 2.00000000; 650.00000000, 2.00000000; 660.00000000, 2.00000000; 670.00000000, 2.00000000; 680.00000000, 2.00000000; 690.00000000, 2.00000000; 700.00000000, 2.00000000; 710.00000000, 2.00000000; 720.00000000, 0.00000000; 730.00000000, 0.00000000; 740.00000000, 0.00000000; 750.00000000, 0.00000000; 760.00000000, 0.00000000; 770.00000000, 0.00000000; 780.00000000, 0.00000000; 790.00000000, 0.00000000; 800.00000000, 0.00000000; 810.00000000, 0.00000000; 820.00000000, 0.00000000; 830.00000000, 0.00000000; 840.00000000, 0.00000000; 850.00000000, 0.00000000; 860.00000000, 0.00000000; 870.00000000, 0.00000000; 880.00000000, 0.00000000; 890.00000000, 0.00000000; 900.00000000, 0.00000000; 910.00000000, 0.00000000; 920.00000000, 0.00000000; 930.00000000, 0.00000000; 940.00000000, 0.00000000; 950.00000000, 0.00000000; 960.00000000, 0.00000000; 970.00000000, 1.00000000; 980.00000000, 1.00000000; 990.00000000, 1.00000000; 1000.00000000, 1.00000000; 1010.00000000, 1.00000000; 1020.00000000, 1.00000000; 1030.00000000, 1.00000000; 1040.00000000, 1.00000000; 1050.00000000, 1.00000000; 1060.00000000, 1.00000000; 1070.00000000, 1.00000000; 1080.00000000, 1.00000000; 1090.00000000, 1.00000000; 1100.00000000, 1.00000000; 1110.00000000, 1.00000000; 1120.00000000, 1.00000000; 1130.00000000, 1.00000000; 1140.00000000, 1.00000000; 1150.00000000, 1.00000000; 1160.00000000, 1.00000000; 1170.00000000, 1.00000000; 1180.00000000, 1.00000000; 1190.00000000, 1.00000000; 1200.00000000, 1.00000000; 1210.00000000, 1.00000000; 1220.00000000, 0.00000000; 1230.00000000, 0.00000000; 1240.00000000, 0.00000000; 1250.00000000, 0.00000000; 1260.00000000, 0.00000000; 1270.00000000, 0.00000000; 1280.00000000, 0.00000000; 1290.00000000, 0.00000000; 1300.00000000, 0.00000000; 1310.00000000, 0.00000000; 1320.00000000, 0.00000000; 1330.00000000, 0.00000000; 1340.00000000, 0.00000000; 1350.00000000, 0.00000000; 1360.00000000, 0.00000000; 1370.00000000, 0.00000000; 1380.00000000, 0.00000000; 1390.00000000, 0.00000000; 1400.00000000, 0.00000000; 1410.00000000, 0.00000000; 1420.00000000, 0.00000000; 1430.00000000, 0.00000000; 1440.00000000, 0.00000000; 1450.00000000, 0.00000000; 1460.00000000, 0.00000000; 1470.00000000, 2.00000000; 1480.00000000, 2.00000000; 1490.00000000, 2.00000000; 1500.00000000, 2.00000000; 1510.00000000, 2.00000000; 1520.00000000, 2.00000000; 1530.00000000, 2.00000000; 1540.00000000, 2.00000000; 1550.00000000, 2.00000000; 1560.00000000, 2.00000000; 1570.00000000, 2.00000000; 1580.00000000, 2.00000000; 1590.00000000, 2.00000000; 1600.00000000, 2.00000000; 1610.00000000, 2.00000000; 1620.00000000, 2.00000000; 1630.00000000, 2.00000000; 1640.00000000, 2.00000000; 1650.00000000, 2.00000000; 1660.00000000, 2.00000000; 1670.00000000, 2.00000000; 1680.00000000, 2.00000000; 1690.00000000, 2.00000000; 1700.00000000, 2.00000000; 1710.00000000, 2.00000000; 1720.00000000, 2.00000000; 1730.00000000, 2.00000000; 1740.00000000, 2.00000000; 1750.00000000, 2.00000000; 1760.00000000, 2.00000000; 1770.00000000, 2.00000000; 1780.00000000, 2.00000000; 1790.00000000, 2.00000000; 1800.00000000, 2.00000000; 1810.00000000, 2.00000000; 1820.00000000, 2.00000000; 1830.00000000, 2.00000000; 1840.00000000, 2.00000000; 1850.00000000, 2.00000000; 1860.00000000, 2.00000000; 1870.00000000, 2.00000000; 1880.00000000, 2.00000000; 1890.00000000, 2.00000000; 1900.00000000, 2.00000000; 1910.00000000, 2.00000000; 1920.00000000, 2.00000000; 1930.00000000, 2.00000000; 1940.00000000, 2.00000000; 1950.00000000, 2.00000000; 1960.00000000, 2.00000000]) annotation(
    Placement(visible = true, transformation(origin = {-84, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Replicator replicator(nout = 1) annotation(
    Placement(visible = true, transformation(origin = {-56, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Replicator replicator1(nout = 1) annotation(
    Placement(visible = true, transformation(origin = {-54, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex3 multiplex3 annotation(
    Placement(visible = true, transformation(origin = {-14, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Neural_Network.Network.NARX_MISO_3_Layer nARX_MISO_3_Layer annotation(
    Placement(visible = true, transformation(origin = {82, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sampler.y, timeDelay.u) annotation(
    Line(points = {{29, 30}, {38, 30}}, color = {0, 0, 127}, thickness = 0.5));
  connect(timeTable_u1.y, replicator.u) annotation(
    Line(points = {{-75, 70}, {-68, 70}}, color = {0, 0, 127}));
  connect(timeTable_u2.y, replicator1.u) annotation(
    Line(points = {{-73, 30}, {-66, 30}}, color = {0, 0, 127}));
  connect(replicator1.y, multiplex3.u2) annotation(
    Line(points = {{-43, 30}, {-26, 30}}, color = {0, 0, 127}, thickness = 0.5));
  connect(replicator.y, multiplex3.u1) annotation(
    Line(points = {{-45, 70}, {-40, 70}, {-40, 37}, {-26, 37}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex3.y, sampler.u) annotation(
    Line(points = {{-3, 30}, {6, 30}}, color = {0, 0, 127}, thickness = 0.5));
  connect(timeDelay.y, nARX_MISO_3_Layer.u) annotation(
    Line(points = {{62, 30}, {70, 30}}, color = {0, 0, 127}, thickness = 0.5));
  connect(nARX_MISO_3_Layer.y, multiplex3.u3) annotation(
    Line(points = {{94, 30}, {96, 30}, {96, 8}, {-40, 8}, {-40, 24}, {-26, 24}}, color = {0, 0, 127}, thickness = 0.5));
end NARX_MISO;
