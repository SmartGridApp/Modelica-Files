model Home
  Fan fan1 annotation(
    Placement(visible = true, transformation(origin = {-31, -11}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Bulb bulb1 annotation(
    Placement(visible = true, transformation(origin = {8, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Bulb bulb2 annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Fan fan2 annotation(
    Placement(visible = true, transformation(origin = {-71, -11}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
    Placement(visible = true, transformation(origin = {-4, 96}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
    Placement(visible = true, transformation(origin = {36, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Bulb bulb3 annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation(
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1 annotation(
    Placement(visible = true, transformation(origin = {90, 68}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(voltageSensor1.n, bulb1.pin_n) annotation(
    Line(points = {{-90, 60}, {-92, 60}, {-92, -46}, {8, -46}, {8, -18}, {8, -18}}, color = {0, 0, 255}));
  connect(pin_n, bulb2.pin_n) annotation(
    Line(points = {{36, -64}, {50, -64}, {50, -18}, {50, -18}}, color = {0, 0, 255}));
  connect(voltageSensor1.p, bulb1.pin_p) annotation(
    Line(points = {{-90, 80}, {8, 80}, {8, 0}, {8, 0}}, color = {0, 0, 255}));
  connect(currentSensor1.n, bulb3.pin_p) annotation(
    Line(points = {{90, 58}, {90, 58}, {90, 0}, {90, 0}}, color = {0, 0, 255}));
  connect(bulb2.pin_p, bulb3.pin_p) annotation(
    Line(points = {{50, 0}, {92, 0}, {92, 0}, {90, 0}, {90, 0}, {90, 0}}, color = {0, 0, 255}));
  connect(bulb1.pin_p, bulb2.pin_p) annotation(
    Line(points = {{8, 0}, {50, 0}, {50, 0}, {50, 0}}, color = {0, 0, 255}));
  connect(fan1.pin_p, bulb1.pin_p) annotation(
    Line(points = {{-30, -4}, {8, -4}, {8, 0}, {8, 0}}, color = {0, 0, 255}));
  connect(fan2.pin_p, fan1.pin_p) annotation(
    Line(points = {{-70, -4}, {-32, -4}, {-32, -4}, {-30, -4}}, color = {0, 0, 255}));
  connect(bulb3.pin_n, bulb2.pin_n) annotation(
    Line(points = {{90, -19}, {50, -19}}, color = {0, 0, 255}));
  connect(bulb1.pin_n, bulb2.pin_n) annotation(
    Line(points = {{8, -19}, {50, -19}}, color = {0, 0, 255}));
  connect(fan1.pin_n, bulb1.pin_n) annotation(
    Line(points = {{-31, -16.5}, {8, -16.5}, {8, -19}}, color = {0, 0, 255}));
  connect(fan2.pin_n, fan1.pin_n) annotation(
    Line(points = {{-71, -16.5}, {-31, -16.5}}, color = {0, 0, 255}));
  connect(pin_p, currentSensor1.p) annotation(
    Line(points = {{-4, 96}, {90, 96}, {90, 78}}, color = {0, 0, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Icon(graphics = {Rectangle(fillColor = {85, 0, 0}, fillPattern = FillPattern.Vertical, extent = {{-80, 40}, {80, -20}}), Rectangle(fillColor = {85, 0, 127}, fillPattern = FillPattern.Vertical, extent = {{-80, 40}, {-20, -20}}), Polygon(origin = {-49.9808, 59.8123}, points = {{1.98082, 20.1877}, {-30.0192, -19.8123}, {29.9808, -19.8123}, {29.9808, -19.8123}, {1.98082, 20.1877}}), Polygon(origin = {16.05, 60}, fillPattern = FillPattern.Solid, points = {{-64.0463, 20}, {35.9537, 20}, {45.9537, 20}, {63.9537, -20}, {-36.0463, -20}, {-64.0463, 20}})}));end Home;
