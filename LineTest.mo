model LineTest
  Line line1 annotation(
    Placement(visible = true, transformation(origin = {11, 9}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  Buildings.Electrical.AC.OnePhase.Sources.FixedVoltage fixVol annotation(
    Placement(visible = true, transformation(origin = {-52, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buildings.Electrical.AC.OnePhase.Loads.Resistive loa annotation(
    Placement(visible = true, transformation(origin = {66, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(line1.term_p, loa.terminal) annotation(
    Line(points = {{26, 10}, {41, 10}, {41, 12}, {56, 12}}));
  connect(fixVol.terminal, line1.term_n) annotation(
    Line(points = {{-42, 12}, {-6, 12}, {-6, 10}, {-4, 10}}));
  annotation(
    uses(Buildings(version = "4.0.0")));
end LineTest;