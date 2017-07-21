model TestforCode
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {0, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 100)  annotation(
    Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V = 120)  annotation(
    Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1 annotation(
    Placement(visible = true, transformation(origin = {2, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(currentSensor1.n, resistor1.p) annotation(
    Line(points = {{12, 40}, {60, 40}, {60, 30}}, color = {0, 0, 255}));
  connect(constantVoltage1.p, currentSensor1.p) annotation(
    Line(points = {{-60, 30}, {-60, 40}, {-8, 40}}, color = {0, 0, 255}));
  connect(constantVoltage1.n, ground1.p) annotation(
    Line(points = {{-60, 10}, {-60, 10}, {-60, 4}, {0, 4}, {0, 4}}, color = {0, 0, 255}));
  connect(resistor1.n, ground1.p) annotation(
    Line(points = {{60, 10}, {60, 10}, {60, 4}, {0, 4}, {0, 4}}, color = {0, 0, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end TestforCode;