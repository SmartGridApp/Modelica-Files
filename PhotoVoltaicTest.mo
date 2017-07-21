model PhotoVoltaicTest
  BasicPV basicPV1 annotation(
    Placement(visible = true, transformation(origin = {-70, 2.66454e-15}, extent = {{-34, -34}, {34, 34}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {2.22045e-16, -76}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Bulb bulb1 annotation(
    Placement(visible = true, transformation(origin = {70, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(bulb1.pin_n, ground1.p) annotation(
    Line(points = {{70, -4}, {68, -4}, {68, -60}, {0, -60}, {0, -62}}, color = {0, 0, 255}));
  connect(basicPV1.pin_p, bulb1.pin_p) annotation(
    Line(points = {{-70, 24}, {-70, 24}, {-70, 60}, {70, 60}, {70, 16}, {70, 16}}, color = {0, 0, 255}));
  connect(basicPV1.pin_n, ground1.p) annotation(
    Line(points = {{-70, -4}, {-70, -4}, {-70, -60}, {-2, -60}, {-2, -60}, {0, -60}, {0, -62}}, color = {0, 0, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end PhotoVoltaicTest;
