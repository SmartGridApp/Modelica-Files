model Test11
  Buildings.Electrical.AC.OnePhase.Sources.FixedVoltage fixVol annotation(
    Placement(visible = true, transformation(origin = {-80, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buildings.Electrical.AC.OnePhase.Lines.Line line annotation(
    Placement(visible = true, transformation(origin = {-18, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buildings.Electrical.AC.OnePhase.Loads.Resistive loa annotation(
    Placement(visible = true, transformation(origin = {36, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixVol.terminal, line.terminal_p) annotation(
    Line);
  connect(loa.terminal, line.terminal_n) annotation(
    Line);
  annotation(
    uses(Buildings(version = "4.0.0")));
  annotation(
    uses(Buildings(version = "4.0.0"), Modelica(version = "3.2.2")));
end Test11;
