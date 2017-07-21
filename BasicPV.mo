model BasicPV
  PVCell.SignalPhotoVoltaicCurrent signalPhotoVoltaicCurrent1 annotation(
    Placement(visible = true, transformation(origin = {-94, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PVCell.PVDiode pVDiode1(Ns = 24, Tn = 293.15)  annotation(
    Placement(visible = true, transformation(origin = {-60, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R = 1000)  annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1 annotation(
    Placement(visible = true, transformation(origin = {50, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
    Placement(visible = true, transformation(origin = {90, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
    Placement(visible = true, transformation(origin = {88, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PVCell.Resistor resistor2(R = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {10, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(voltageSensor1.p, currentSensor1.n) annotation(
    Line(points = {{70, 60}, {70, 80}, {60, 80}}, color = {0, 0, 255}));
  connect(voltageSensor1.n, pin_n) annotation(
    Line(points = {{70, 40}, {70, 0}, {88, 0}, {88, 4}}, color = {0, 0, 255}));
  connect(voltageSensor1.v, pVDiode1.V_pv) annotation(
    Line(points = {{60, 50}, {-54, 50}}, color = {0, 0, 127}));
  connect(currentSensor1.n, pin_p) annotation(
    Line(points = {{60, 80}, {90, 80}, {90, 76}}, color = {0, 0, 255}));
  connect(signalPhotoVoltaicCurrent1.p, pin_n) annotation(
    Line(points = {{-94, 30}, {-94, 0}, {88, 0}, {88, 4}}, color = {0, 0, 255}));
  connect(pVDiode1.n, pin_n) annotation(
    Line(points = {{-60, 40}, {-60, 0}, {88, 0}, {88, 4}}, color = {0, 0, 255}));
  connect(resistor3.p, pin_n) annotation(
    Line(points = {{-30, 20}, {-30, 0}, {88, 0}, {88, 4}}, color = {0, 0, 255}));
  connect(resistor2.R_s, pVDiode1.R_s) annotation(
    Line(points = {{10, 76}, {8, 76}, {8, 46}, {-54, 46}}, color = {0, 0, 127}));
  connect(resistor3.n, resistor2.n) annotation(
    Line(points = {{-30, 40}, {-30, 80}, {0, 80}}, color = {0, 0, 255}));
  connect(signalPhotoVoltaicCurrent1.n, resistor2.n) annotation(
    Line(points = {{-94, 50}, {-94, 80}, {0, 80}}, color = {0, 0, 255}));
  connect(pVDiode1.p, resistor2.n) annotation(
    Line(points = {{-60, 60}, {-60, 80}, {0, 80}}, color = {0, 0, 255}));
  connect(currentSensor1.p, resistor2.p) annotation(
    Line(points = {{40, 80}, {20, 80}}, color = {0, 0, 255}));
  connect(currentSensor1.i, pVDiode1.I_pv) annotation(
    Line(points = {{50, 70}, {50, 54}, {-54, 54}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Icon(graphics = {Rectangle(origin = {0, 30}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Cross, extent = {{-40, 30}, {40, -30}})}));
end BasicPV;
