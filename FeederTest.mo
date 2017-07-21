model FeederTest
  Buildings.Electrical.AC.OnePhase.Sources.Grid gri annotation(
    Placement(visible = true, transformation(origin = {-20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Feeder feeder1 annotation(
    Placement(visible = true, transformation(origin = {-19, 13}, extent = {{-25, -25}, {25, 25}}, rotation = 0), iconTransformation(origin = {-19, 13}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  Buildings.Electrical.AC.OnePhase.Loads.Resistive loa annotation(
    Placement(visible = true, transformation(origin = {-76, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Buildings.Electrical.AC.OnePhase.Loads.Inductive loa1 annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Buildings.Electrical.AC.OnePhase.Loads.Capacitive loa2 annotation(
    Placement(visible = true, transformation(origin = {38, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(loa2.terminal, feeder1) annotation(
    Line(points = {{38, 2}, {38, 15}, {-19, 15}}));
  connect(feeder1, loa1.terminal) annotation(
    Line(points = {{-19, 15}, {-20, 15}, {-20, 0}}, color = {0, 0, 255}));
  connect(feeder1, loa.terminal) annotation(
    Line(points = {{-19, 15}, {-76, 15}, {-76, 2}}, color = {0, 0, 255}));
  connect(gri.terminal, feeder1) annotation(
    Line(points = {{-20, 60}, {-20, 15}, {-19, 15}}));
  annotation(
    uses(Buildings(version = "4.0.0")));
end FeederTest;