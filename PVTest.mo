model PVTest
  PVCell.SignalPhotoVoltaicCurrent signalPhotoVoltaicCurrent1 annotation(
    Placement(visible = true, transformation(origin = {-76, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PVCell.PVDiode pVDiode1(Tn = 293.15)  annotation(
    Placement(visible = true, transformation(origin = {-32, 56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor3 annotation(
    Placement(visible = true, transformation(origin = {10, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation(
    Placement(visible = true, transformation(origin = {72, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1 annotation(
    Placement(visible = true, transformation(origin = {58, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
    Placement(visible = true, transformation(origin = {94, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
    Placement(visible = true, transformation(origin = {94, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PVCell.Resistor resistor1 annotation(
    Placement(visible = true, transformation(origin = {32, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(resistor1.R_s, pVDiode1.R_s) annotation(
    Line(points = {{32, 76}, {36, 76}, {36, 52}, {-26, 52}, {-26, 52}}, color = {0, 0, 127}));
  connect(resistor1.n, resistor3.n) annotation(
    Line(points = {{22, 80}, {10, 80}, {10, 56}, {10, 56}}, color = {0, 0, 255}));
  connect(pVDiode1.p, resistor1.n) annotation(
    Line(points = {{-32, 66}, {-30, 66}, {-30, 80}, {22, 80}, {22, 80}}, color = {0, 0, 255}));
  connect(resistor3.p, pin_n) annotation(
    Line(points = {{10, 36}, {96, 36}, {96, 34}, {94, 34}}, color = {0, 0, 255}));
  connect(currentSensor1.n, pin_p) annotation(
    Line(points = {{68, 66}, {92, 66}, {92, 68}, {94, 68}}, color = {0, 0, 255}));
  connect(currentSensor1.i, pVDiode1.I_pv) annotation(
    Line(points = {{58, 56}, {-18, 56}, {-18, 60}, {-26, 60}, {-26, 60}}, color = {0, 0, 127}));
  connect(voltageSensor1.v, pVDiode1.V_pv) annotation(
    Line(points = {{62, 50}, {-20, 50}, {-20, 56}, {-26, 56}, {-26, 56}}, color = {0, 0, 127}));
  connect(voltageSensor1.p, currentSensor1.n) annotation(
    Line(points = {{72, 60}, {72, 60}, {72, 66}, {68, 66}, {68, 66}}, color = {0, 0, 255}));
  connect(resistor1.p, currentSensor1.p) annotation(
    Line(points = {{42, 66}, {48, 66}, {48, 66}, {48, 66}}, color = {0, 0, 255}));
  connect(pVDiode1.n, resistor3.p) annotation(
    Line(points = {{-32, 46}, {-32, 46}, {-32, 36}, {10, 36}, {10, 36}}, color = {0, 0, 255}));
  connect(signalPhotoVoltaicCurrent1.p, pVDiode1.n) annotation(
    Line(points = {{-76, 48}, {-76, 48}, {-76, 40}, {-32, 40}, {-32, 46}, {-32, 46}, {-32, 46}}, color = {0, 0, 255}));
  connect(signalPhotoVoltaicCurrent1.n, pVDiode1.p) annotation(
    Line(points = {{-76, 68}, {-32, 68}, {-32, 66}, {-32, 66}}, color = {0, 0, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end PVTest;
