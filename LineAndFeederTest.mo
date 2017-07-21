model LineAndFeederTest
  Feeder feeder1 annotation(
    Placement(visible = true, transformation(origin = {35, -1}, extent = {{-13, -13}, {13, 13}}, rotation = -90), iconTransformation(origin = {35, -1}, extent = {{-13, -13}, {13, 13}}, rotation = -90)));
  Buildings.Electrical.AC.OnePhase.Loads.Resistive loa annotation(
    Placement(visible = true, transformation(origin = {54, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buildings.Electrical.AC.OnePhase.Loads.Inductive loa1 annotation(
    Placement(visible = true, transformation(origin = {56, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buildings.Electrical.AC.OnePhase.Sources.Grid gri annotation(
    Placement(visible = true, transformation(origin = {-60, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Line line1 annotation(
    Placement(visible = true, transformation(origin = {-12, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(line1.term_p, feeder1) annotation(
    Line(points = {{-2, 2}, {38, 2}, {38, 0}, {36, 0}}));
  connect(gri.terminal, line1.term_n) annotation(
    Line(points = {{-50, 2}, {-22, 2}, {-22, 2}, {-22, 2}}));
  connect(loa1.terminal, feeder1) annotation(
    Line(points = {{46, -24}, {35, -24}, {35, -1}}));
  connect(loa.terminal, feeder1) annotation(
    Line(points = {{44, 24}, {36, 24}, {36, 1}, {35, 1}}));
  annotation(
    uses(Buildings(version = "4.0.0")));
end LineAndFeederTest;