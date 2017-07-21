model Fan
  Modelica.SIunits.Voltage V "Voltage drop across fan";
  Modelica.SIunits.Current I "Current through fan";
  Modelica.SIunits.Power P "Power";
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 50)  annotation(
    Placement(visible = true, transformation(origin = {-12, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(L = 0.00013)  annotation(
    Placement(visible = true, transformation(origin = {38, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-2, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

  V = resistor1.v +  inductor1.v;
  der(I) = inductor1.v / inductor1.L;
  P = V * I;
  connect(resistor1.p, pin_p) annotation(
    Line(points = {{-22, 50}, {-22, 50}, {-22, -10}, {-20, -10}}, color = {0, 0, 255}));
  connect(inductor1.n, pin_n) annotation(
    Line(points = {{48, 50}, {48, 50}, {48, -10}, {50, -10}}, color = {0, 0, 255}));
  connect(resistor1.n, inductor1.p) annotation(
    Line(points = {{-2, 50}, {28, 50}, {28, 50}, {28, 50}}, color = {0, 0, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Icon(graphics = {Polygon(origin = {-30.17, 36.94}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, points = {{-19.8339, 17.0609}, {-19.8339, 17.0609}, {30.1661, -16.9391}, {-29.8339, 3.06088}, {-27.8339, 7.06088}, {-19.8339, 17.0609}}), Polygon(origin = {25.1, 36.91}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, points = {{-25.1002, -16.909}, {14.8998, 17.091}, {24.8998, 1.09096}, {14.8998, -2.90904}, {-25.1002, -16.909}}), Polygon(origin = {-5.97, -3.3}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, points = {{5.96593, 23.3006}, {-14.0341, -22.6994}, {13.9659, -22.6994}, {5.96593, 23.3006}, {5.96593, 23.3006}})}));
end Fan;
