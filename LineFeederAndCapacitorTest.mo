model LineFeederAndCapacitorTest
  Feeder feeder1 annotation(
    Placement(visible = true, transformation(origin = {39, -11}, extent = {{-13, -13}, {13, 13}}, rotation = -90), iconTransformation(origin = {39, -11}, extent = {{-13, -13}, {13, 13}}, rotation = -90)));
  Buildings.Electrical.AC.OnePhase.Loads.Resistive loa annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buildings.Electrical.AC.OnePhase.Loads.Inductive loa1 annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buildings.Electrical.AC.OnePhase.Sources.Grid gri annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Line line1 annotation(
    Placement(visible = true, transformation(origin = {-12, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Feeder feeder2 annotation(
    Placement(visible = true, transformation(origin = {38, 68}, extent = {{-12, -12}, {12, 12}}, rotation = -90), iconTransformation(origin = {38, 68}, extent = {{-12, -12}, {12, 12}}, rotation = -90)));
  Buildings.Electrical.AC.OnePhase.Loads.Resistive loa2 annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buildings.Electrical.AC.OnePhase.Loads.Capacitive loa3 annotation(
    Placement(visible = true, transformation(origin = {70, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(gri.terminal, line1.term_n) annotation(
    Line(points = {{-60, -8}, {-40.5, -8}, {-40.5, -10}, {-21, -10}}));
  connect(feeder1, line1.term_p) annotation(
    Line(points = {{40, -10}, {-3, -10}, {-3, -8}}, color = {0, 0, 255}));
  connect(line1.term_p, feeder1) annotation(
    Line(points = {{-3, -8}, {38, -8}, {38, -10}, {40, -10}}, color = {255, 255, 255}));
  connect(loa2.terminal, feeder2) annotation(
    Line(points = {{60, 48}, {38, 48}, {38, 68}}));
  connect(loa3.terminal, feeder2) annotation(
    Line(points = {{60, 86}, {38, 86}, {38, 68}}));
  connect(feeder2, feeder1) annotation(
    Line(points = {{38, 68}, {40, 68}, {40, -10}, {40, -10}}, color = {0, 0, 255}));
  connect(loa.terminal, feeder1) annotation(
    Line(points = {{60, 10}, {40, 10}, {40, -10}, {40, -10}}));
  connect(loa1.terminal, feeder1) annotation(
    Line(points = {{60, -30}, {40, -30}, {40, -10}, {40, -10}}));
  annotation(
    uses(Buildings(version = "4.0.0")));
end LineFeederAndCapacitorTest;