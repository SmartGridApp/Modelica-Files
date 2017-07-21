model Bulb

  Modelica.SIunits.Voltage V "Voltage drop across the resistor";
  Modelica.SIunits.Current I "Current through resistor";
  Modelica.SIunits.Power P "Power";
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 150)  annotation(
    Placement(visible = true, transformation(origin = {-4, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
    Placement(visible = true, transformation(origin = {-16, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
    Placement(visible = true, transformation(origin = {10, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

   V = resistor1.v;
   I = resistor1.i;
   P = V * I;

  connect(resistor1.p, pin_p) annotation(
    Line(points = {{-14, 32}, {-16, 32}, {-16, -12}, {-16, -12}}, color = {0, 0, 255}));
  connect(resistor1.n, pin_n) annotation(
    Line(points = {{6, 32}, {10, 32}, {10, -14}, {10, -14}}, color = {0, 0, 255}));
  annotation(
    Icon(graphics = {Ellipse(origin = {-1, 0}, extent = {{-69, 68}, {69, -68}}, endAngle = 360), Line(origin = {4, 68}, points = {{0, 0}, {0, 0}}), Line(origin = {0, 0.129947}, points = {{-90, -0.129947}, {-60, -0.129947}, {-40, 19.8701}, {-20, -20.1299}, {0, 19.8701}, {18, -18.1299}, {40, 19.8701}, {58, -0.129947}, {90, -0.129947}, {90, -0.129947}, {90, -0.129947}})}),
    uses(Modelica(version = "3.2.2")));
end Bulb;
