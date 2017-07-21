model Home
  Modelica.SIunits.Power Preal "Real Power";
  Modelica.SIunits.Voltage V "voltage";
  Modelica.SIunits.Current I "current";
  Fan fan1 annotation(
    Placement(visible = true, transformation(origin = {-31, -11}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Bulb bulb1 annotation(
    Placement(visible = true, transformation(origin = {8, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Bulb bulb2 annotation(
    Placement(visible = true, transformation(origin = {48, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Fan fan2 annotation(
    Placement(visible = true, transformation(origin = {-71, -11}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
    Placement(visible = true, transformation(origin = {-4, 96}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {8, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
    Placement(visible = true, transformation(origin = {58, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Bulb bulb3 annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation(
    Placement(visible = true, transformation(origin = {-90, 54}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1 annotation(
    Placement(visible = true, transformation(origin = {54, 86}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(voltageSensor1.n, pin_n) annotation(
    Line(points = {{-90, 44}, {-88, 44}, {-88, -66}, {58, -66}, {58, -66}}, color = {0, 0, 255}));
  connect(fan1.pin_n, bulb1.pin_n) annotation(
    Line(points = {{-31, -16.5}, {8, -16.5}, {8, -19}}, color = {0, 0, 255}));
  connect(fan2.pin_n, fan1.pin_n) annotation(
    Line(points = {{-71, -16.5}, {-31, -16.5}}, color = {0, 0, 255}));
  connect(fan1.pin_p, currentSensor1.n) annotation(
    Line(points = {{-31, -3}, {-32, -3}, {-32, 28}, {54, 28}, {54, 76}}, color = {0, 0, 255}));
  connect(fan2.pin_p, currentSensor1.n) annotation(
    Line(points = {{-71, -3}, {-71, 28}, {54, 28}, {54, 76}}, color = {0, 0, 255}));
  connect(voltageSensor1.p, currentSensor1.n) annotation(
    Line(points = {{-90, 64}, {50, 64}, {50, 76}, {54, 76}, {54, 76}}, color = {0, 0, 255}));
  connect(bulb2.pin_n, pin_n) annotation(
    Line(points = {{48, -19}, {58, -19}, {58, -66}}, color = {0, 0, 255}));
  connect(bulb1.pin_n, bulb2.pin_n) annotation(
    Line(points = {{8, -19}, {48, -19}}, color = {0, 0, 255}));
  connect(bulb3.pin_n, bulb2.pin_n) annotation(
    Line(points = {{90, -19}, {48, -19}}, color = {0, 0, 255}));
  connect(bulb2.pin_p, currentSensor1.n) annotation(
    Line(points = {{48, -1}, {48, 28}, {54, 28}, {54, 76}}, color = {0, 0, 255}));
  V = voltageSensor1.v;
  I = currentSensor1.i;
  Preal = V * I;
  connect(bulb3.pin_p, currentSensor1.n) annotation(
    Line(points = {{90, 0}, {90, 0}, {90, 28}, {54, 28}, {54, 76}, {54, 76}, {54, 76}}, color = {0, 0, 255}));
  connect(bulb1.pin_p, currentSensor1.n) annotation(
    Line(points = {{8, 0}, {8, 0}, {8, 28}, {54, 28}, {54, 76}, {54, 76}}, color = {0, 0, 255}));
  connect(pin_p, currentSensor1.p) annotation(
    Line(points = {{-4, 96}, {54, 96}}, color = {0, 0, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Icon(graphics = {Rectangle(fillColor = {85, 0, 0}, fillPattern = FillPattern.Vertical, extent = {{-80, 40}, {80, -20}}), Rectangle(fillColor = {85, 0, 127}, fillPattern = FillPattern.Vertical, extent = {{-80, 40}, {-20, -20}}), Polygon(origin = {-49.9808, 59.8123}, points = {{1.98082, 20.1877}, {-30.0192, -19.8123}, {29.9808, -19.8123}, {29.9808, -19.8123}, {1.98082, 20.1877}}), Polygon(origin = {16.05, 60}, fillPattern = FillPattern.Solid, points = {{-64.0463, 20}, {35.9537, 20}, {45.9537, 20}, {63.9537, -20}, {-36.0463, -20}, {-64.0463, 20}})}));
end Home;
