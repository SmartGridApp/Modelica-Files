model PVCell
    Modelica.SIunits.Voltage v;
 //  Real I;
  //  Real V1;
  //  Real P;
  // parameter Real To = 25 + 273 "Opertating Temperature";
  // extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = To);


model PVDiode "Simple diode"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  Real Ids "Saturation current";
  Real Ion;
  Real I_0;
  Real K = 1.38065e-23 "Boltzman constant";
  Real q = 1.062e-19 "charge of electron";
  Real a = 1.5 "Diode Ideality factor";
  Real Eg = 1.1 "Band Gap of Silicon at 25 Degree Celcius";
  parameter Modelica.SIunits.Current Isc = 2.55 "Short circuit current";
  parameter Modelica.SIunits.Voltage V_oc = 21.24 "open circuit voltage";
  parameter Real Ns = 36 "Number of series connected cells";
  parameter Real Maxexp(final min = Modelica.Constants.small) = 15 "Max. exponent for linear continuation";
  parameter Real R = 1.e8 "Parallel ohmic resistance";
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T=293.15);
  parameter Modelica.SIunits.Temperature Tn=293.15 "Reference Temperature of PV";
  parameter Modelica.SIunits.Temperature To=298 "Operating Temperature of PV";
  Modelica.Blocks.Interfaces.RealInput I_pv annotation(
      Placement(visible = true, transformation(origin = {-40, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-34, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput V_pv annotation(
      Placement(visible = true, transformation(origin = {20, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {6, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput R_s annotation(
      Placement(visible = true, transformation(origin = {80, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {46, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

equation
  Ion = Isc / (exp(q * V_oc / (Ns * K * a * To)) - 1);
  
  Ids = Ion * (To / Tn) ^ 3 * exp(q * Eg / (a * K) * ((1 / Tn) - (1 / To)));

  I_0 = Ids * (exp(q * (V_pv + I_pv * R_s) / (Ns * a * K * Tn)) - 1);
  
  i = I_0;
  
  LossPower = v * i;
  annotation(
    Documentation(info = "<html>
<p>The simple diode is a one port. It consists of the diode itself and an parallel ohmic resistance <i>R</i>. The diode formula is:</p>
<pre>                v/vt
i  =  ids ( e      - 1).</pre>
<p>If the exponent <i>v/vt</i> reaches the limit <i>maxex</i>, the diode characteristic is linearly continued to avoid overflow.</p><p><b>Please note:</b> In case of useHeatPort=true the temperature dependence of the electrical behavior is <b>not </b>modelled yet. The parameters are not temperature dependent.</p>
</html>", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
   by Christoph Clauss<br> conditional heat port added<br>
   </li>
<li><i> November 15, 2005   </i>
   by Christoph Clauss<br> smooth function added<br>
   </li>
<li><i> 1998   </i>
   by Christoph Clauss<br> implemented<br>
   </li>
</ul>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{30, 0}, {-30, 40}, {-30, -40}, {30, 0}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-90, 0}, {40, 0}}, color = {0, 0, 255}), Line(points = {{40, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{30, 40}, {30, -40}}, color = {0, 0, 255}), Text(extent = {{-150, -49}, {149, -77}}, lineColor = {0, 0, 0}, textString = "Vt=%Vt"), Text(extent = {{-154, 100}, {146, 60}}, textString = "%name", lineColor = {0, 0, 255}), Line(visible = useHeatPort, points = {{0, -100}, {0, -20}}, color = {127, 0, 0}, pattern = LinePattern.Dot)}),
    Diagram(coordinateSystem(initialScale = 0.1), graphics = {Polygon(lineColor = {0, 0, 255}, fillColor = {255, 0, 0}, points = {{30, 0}, {-30, 40}, {-30, -40}, {30, 0}}), Line(points = {{-96, 0}, {96, 0}}, color = {0, 0, 255}), Line(origin = {0.423387, 0}, points = {{30, 40}, {30, -40}}, color = {0, 0, 255})}));
end PVDiode;



























  model PVArray
    PVCell.PVDiode pVDiode1 annotation(
      Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    // parameter Modelica.SIunits.Temperature To = 25 + 273 "Operating Temperature";
    extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T=293.15);
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p1 annotation(
      Placement(visible = true, transformation(origin = {96, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n1 annotation(
      Placement(visible = true, transformation(origin = {96, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor2 annotation(
      Placement(visible = true, transformation(origin = {2, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1 annotation(
      Placement(visible = true, transformation(origin = {62, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation(
      Placement(visible = true, transformation(origin = {80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor1 annotation(
      Placement(visible = true, transformation(origin = {-30, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pv_n annotation(
      Placement(visible = true, transformation(origin = {-96, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pv_p annotation(
      Placement(visible = true, transformation(origin = {-96, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 PVCell.Resistor resistor1 annotation(
      Placement(visible = true, transformation(origin = {20, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
 PVCell.SignalPhotoVoltaicCurrent signalPhotoVoltaicCurrent1 annotation(
      Placement(visible = true, transformation(origin = {-136, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
 Modelica.Electrical.Analog.Basic.Resistor resistor3 annotation(
      Placement(visible = true, transformation(origin = {116, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(resistor3.n, pin_n1) annotation(
      Line(points = {{126, 26}, {140, 26}, {140, -34}, {96, -34}, {96, -36}}, color = {0, 0, 255}));
    connect(pin_p1, resistor3.p) annotation(
      Line(points = {{96, 56}, {106, 56}, {106, 26}, {106, 26}}, color = {0, 0, 255}));
    connect(signalPhotoVoltaicCurrent1.p, pv_p) annotation(
      Line(points = {{-136, 10}, {-134, 10}, {-134, -36}, {-96, -36}, {-96, -36}}, color = {0, 0, 255}));
    connect(signalPhotoVoltaicCurrent1.n, pv_n) annotation(
      Line(points = {{-136, 30}, {-136, 30}, {-136, 54}, {-96, 54}, {-96, 56}}, color = {0, 0, 255}));
    connect(resistor2.n, pv_n) annotation(
      Line(points = {{2, -2}, {0, -2}, {0, 56}, {-96, 56}, {-96, 56}}, color = {0, 0, 255}));
    connect(resistor1.R_s, pVDiode1.R_s) annotation(
      Line(points = {{20, 54}, {18, 54}, {18, 6}, {-34, 6}, {-34, 6}}, color = {0, 0, 127}));
    connect(pv_n, resistor1.n) annotation(
      Line(points = {{-96, 56}, {10, 56}, {10, 58}, {10, 58}}, color = {0, 0, 255}));
    connect(resistor1.p, currentSensor1.n) annotation(
      Line(points = {{30, 58}, {52, 58}, {52, 58}, {52, 58}}, color = {0, 0, 255}));
    connect(pv_n, pVDiode1.p) annotation(
      Line(points = {{-96, 56}, {-40, 56}, {-40, 44}, {-40, 44}, {-40, 20}, {-40, 20}, {-40, 20}}, color = {0, 0, 255}));
    connect(temperatureSensor1.port, heatPort) annotation(
      Line(points = {{-40, 88}, {-80, 88}, {-80, -100}, {0, -100}, {0, -100}}, color = {191, 0, 0}));
    connect(voltageSensor1.v, pVDiode1.V_pv) annotation(
      Line(points = {{70, 10}, {-34, 10}}, color = {0, 0, 127}));
    connect(voltageSensor1.n, pin_n1) annotation(
      Line(points = {{80, 0}, {80, -36}, {96, -36}}, color = {0, 0, 255}));
    connect(voltageSensor1.p, pin_p1) annotation(
      Line(points = {{80, 20}, {80, 58}, {96, 58}, {96, 56}}, color = {0, 0, 255}));
    connect(pVDiode1.n, pin_n1) annotation(
      Line(points = {{-40, 0}, {-40, -36}, {96, -36}}, color = {0, 0, 255}));
    connect(temperatureSensor1.T, pVDiode1.Tk) annotation(
      Line(points = {{-20, 88}, {-8, 88}, {-8, 17}, {-34, 17}}, color = {0, 0, 127}));
    connect(currentSensor1.i, pVDiode1.I_pv) annotation(
      Line(points = {{62, 68}, {46, 68}, {46, 13}, {-34, 13}}, color = {0, 0, 127}));
    connect(resistor2.p, pin_n1) annotation(
      Line(points = {{2, -22}, {2, -22}, {2, -36}, {96, -36}, {96, -36}}, color = {0, 0, 255}));
    connect(currentSensor1.p, pin_p1) annotation(
      Line(points = {{72, 58}, {96, 58}, {96, 56}, {96, 56}}, color = {0, 0, 255}));
    connect(pv_p, pin_n1) annotation(
      Line(points = {{-96, -36}, {92, -36}, {92, -36}, {96, -36}}, color = {0, 0, 255}));
    LossPower = voltageSensor1.v * currentSensor1.i;
    annotation(
      Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(origin = {-40, 40}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Cross, extent = {{-40, 40}, {120, -120}})}));
  end PVArray;


model SignalPhotoVoltaicCurrent "Generic current source using the input signal as source current"
  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(
    Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(
    Placement(transformation(extent = {{110, -10}, {90, 10}})));
  Modelica.SIunits.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
  Modelica.SIunits.Current Ipv "Value of constant current";
  parameter Modelica.SIunits.Current Isc = 2.55 "SC Current";
  Modelica.SIunits.Temperature Ki = 0.0032 "Temperature current Constant";
  parameter Modelica.SIunits.Temperature To = 25 + 273 "Operating Temperature";
  parameter Modelica.SIunits.Temperature Tref = 293.15 " reference Temperature";
  parameter Real G = 1000 "Actual Irradiation";
  Real Gn = 1000 "Nominal Irradiance";
  Real i "Photo Voltaic Current";
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T=298);
equation
  v = p.v - n.v;
  0 = p.i + n.i;
  i = p.i;
  Ipv = (Isc + Ki * (To - Tref)) * (G / Gn);
  i = Ipv;
  LossPower = v * i;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-90, 0}, {-50, 0}}, color = {0, 0, 255}), Line(points = {{50, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 255}), Text(extent = {{-150, -120}, {150, -80}}, textString = "%name", lineColor = {0, 0, 255}), Polygon(points = {{90, 0}, {60, 10}, {60, -10}, {90, 0}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid)}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-96, 0}, {-50, 0}}, color = {0, 0, 255}), Line(points = {{50, 0}, {96, 0}}, color = {0, 0, 255}), Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 255})}),
    Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
 by Martin Otter<br> initially implemented<br>
 </li>
</ul>
</html>", info = "<html>
<p>The signal current source is a parameterless converter of real valued signals into a the source current. No further effects are modeled. The real valued signal has to be provided by components of the blocks library. It can be regarded as the &quot;Opposite&quot; of a current sensor.</p>
</html>"));
end SignalPhotoVoltaicCurrent;


  model Resistor "Ideal linear electrical resistor"
    parameter Modelica.SIunits.Resistance R(start = 1) "Resistance at temperature T_ref";
    parameter Modelica.SIunits.Temperature T_ref = 300.15 "Reference temperature";
    parameter Modelica.SIunits.LinearTemperatureCoefficient alpha = 0 "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
    extends Modelica.Electrical.Analog.Interfaces.OnePort;
    extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = T_ref);
    Modelica.SIunits.Resistance R_actual "Actual resistance = R*(1 + alpha*(T_heatPort - T_ref))";
    Modelica.Blocks.Interfaces.RealOutput R_s annotation(
      Placement(visible = true, transformation(origin = {6, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    assert(1 + alpha * (T_heatPort - T_ref) >= Modelica.Constants.eps, "Temperature outside scope of model!");
    R_actual = R * (1 + alpha * (T_heatPort - T_ref));
    R_s = R_actual;
    v = R_actual * i;
    LossPower = v * i;
    annotation(
      Documentation(info = "<html>
<p>The linear resistor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>i*R = v</i>. The Resistance <i>R</i> is allowed to be positive, zero, or negative.</p>
</html>", revisions = "<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of resistance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
      Icon(graphics = {Rectangle(origin = {1, 0}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-71, 32}, {71, -32}}), Line(origin = {-80, 0}, points = {{-10, 0}, {10, 0}, {10, 0}}, color = {0, 0, 255}), Line(origin = {81, 0}, points = {{-9, 0}, {9, 0}}, color = {0, 0, 255})}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-70, 30}, {70, -30}}, lineColor = {0, 0, 255}), Line(points = {{-96, 0}, {-70, 0}}, color = {0, 0, 255}), Line(points = {{70, 0}, {96, 0}}, color = {0, 0, 255})}));
  end Resistor;
equation
  v = pin_p.v - pin_n.v;
// I = signalPhotoVoltaicCurrent1.i - pVArray1.i;
// V1 = v;
// P = v * I;
  annotation(
    Diagram(graphics = {Text(extent = {{-90, 30}, {-90, 30}}, textString = "PhotoVoltaic Current", fontSize = 35)}, coordinateSystem(initialScale = 0.1)),
    Icon(graphics = {Line(origin = {0.295775, 76.4085}, points = {{-0.295775, 9.70423}, {-0.295775, -10.2958}, {-0.295775, -10.2958}, {-0.295775, -10.2958}, {-0.295775, -10.2958}, {-0.295775, -10.2958}}), Line(origin = {-0.295774, -64.1972}, points = {{0, 10}, {0, -10}, {0, -10}, {0, -10}}), Rectangle(origin = {0, 16}, extent = {{-60, 50}, {60, -70}}), Rectangle(extent = {{-20, 58}, {-20, 58}}), Rectangle(origin = {-40, 46}, extent = {{-20, 20}, {20, -20}}), Rectangle(origin = {0, 46}, extent = {{-20, 20}, {20, -20}}), Rectangle(origin = {40, 46}, extent = {{-20, 20}, {20, -20}}), Rectangle(origin = {-40, 6}, extent = {{-20, 20}, {20, -20}}), Rectangle(origin = {0, 6}, extent = {{-20, 20}, {20, -20}}), Rectangle(origin = {40, 6}, extent = {{-20, 20}, {20, -20}}), Rectangle(origin = {-40, -34}, extent = {{-20, 20}, {20, -20}}), Rectangle(origin = {0, -34}, extent = {{-20, 20}, {20, -20}})}, coordinateSystem(initialScale = 0.1)),
    uses(Modelica(version = "3.2.2")));
end PVCell;
