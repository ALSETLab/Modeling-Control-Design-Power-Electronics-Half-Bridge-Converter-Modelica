within ;
package HalfBridgeConverter

  model OnePhTwoLevelConv
    Components.HalfBridgeConverterModular
                        halfBridgeConverterModular
      annotation (Placement(transformation(extent={{-22,-20},{4,16}})));
    Components.PWM
        pWM(f=3420)
      annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-16,-80},{4,-60}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor(R=plant.R)
      annotation (Placement(transformation(extent={{14,-12},{34,8}})));
    Modelica.Electrical.Analog.Basic.Inductor inductor(L=plant.L)
      annotation (Placement(transformation(extent={{42,-12},{62,8}})));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
      annotation (Placement(transformation(extent={{74,-8},{86,4}})));
    Modelica.Blocks.Sources.Sine sine(
      amplitude=1000,
      freqHz=60,
      startTime=0.07)
      annotation (Placement(transformation(extent={{-118,-8},{-102,8}})));

    Records.Plant plant
      annotation (Placement(transformation(extent={{60,20},{80,40}})));
    Modelica.Electrical.PowerConverters.DCDC.Control.VoltageToDutyCycle
      voltageToDutyCycle(                     useBipolarVoltage=false, vMax=
          sine.amplitude)
      annotation (Placement(transformation(extent={{-92,-6},{-80,6}})));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor(C=1e-1) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={14,-32})));
  equation
    connect(pWM.Q1, halfBridgeConverterModular.Q1gate) annotation (Line(points={{-52.8,2},
            {-48,2},{-48,2.725},{-22.1857,2.725}},            color={255,0,255}));
    connect(pWM.Q4, halfBridgeConverterModular.Q4gate) annotation (Line(points={{-52.8,
            -5},{-38,-5},{-38,-8.975},{-22.1857,-8.975}},         color={255,0,
            255}));
    connect(halfBridgeConverterModular.ac, resistor.p)
      annotation (Line(points={{3.25714,-2},{14,-2}}, color={0,0,255}));
    connect(resistor.n, inductor.p)
      annotation (Line(points={{34,-2},{42,-2}}, color={0,0,255}));
    connect(inductor.n, currentSensor.p)
      annotation (Line(points={{62,-2},{74,-2}}, color={0,0,255}));
    connect(currentSensor.n, ground.p) annotation (Line(points={{86,-2},{86,-60},
            {-6,-60}},          color={0,0,255}));
    connect(halfBridgeConverterModular.ground, ground.p) annotation (Line(
          points={{-7.14286,-19.1},{-7.14286,-39.55},{-6,-39.55},{-6,-60}},
          color={0,0,255}));
    connect(sine.y, voltageToDutyCycle.v)
      annotation (Line(points={{-101.2,0},{-93.2,0}}, color={0,0,127}));
    connect(voltageToDutyCycle.dutyCycle, pWM.ModulatingSignal)
      annotation (Line(points={{-79.4,0},{-71.4,0}}, color={0,0,127}));
    connect(capacitor.p, resistor.p)
      annotation (Line(points={{14,-22},{14,-2}}, color={0,0,255}));
    connect(capacitor.n, ground.p) annotation (Line(points={{14,-42},{4,-42},{4,
            -60},{-6,-60}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,
              -80},{100,60}})),                                    Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-140,-80},{100,
              60}})));
  end OnePhTwoLevelConv;

  model OnePhTwoLevelConvAver
    Components.HalfBridgeConverterModularAver
                        halfBridgeConverterModularAver
      annotation (Placement(transformation(extent={{-32,-20},{-6,16}})));
    Components.PWM
        pWM(f=3420)
      annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-16,-80},{4,-60}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor(R=plant.R)
      annotation (Placement(transformation(extent={{14,-12},{34,8}})));
    Modelica.Electrical.Analog.Basic.Inductor inductor(L=plant.L)
      annotation (Placement(transformation(extent={{42,-12},{62,8}})));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
      annotation (Placement(transformation(extent={{74,-8},{86,4}})));
    Modelica.Blocks.Sources.Sine sine(amplitude=1000,
      freqHz=60,
      phase=0,
      startTime=0.07)
      annotation (Placement(transformation(extent={{-118,-8},{-102,8}})));

    Records.Plant plant
      annotation (Placement(transformation(extent={{60,26},{80,46}})));
    Modelica.Electrical.PowerConverters.DCDC.Control.VoltageToDutyCycle
      voltageToDutyCycle(vMax=sine.amplitude, useBipolarVoltage=true)
      annotation (Placement(transformation(extent={{-92,-6},{-80,6}})));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={34,-40})));
  equation

    connect(pWM.Q1, halfBridgeConverterModularAver.Q1gate) annotation (Line(
          points={{-50.8,2},{-48,2},{-48,2.725},{-32.1857,2.725}}, color={255,0,255}));
    connect(pWM.Q4, halfBridgeConverterModularAver.Q4gate) annotation (Line(
          points={{-50.8,-5},{-38,-5},{-38,-8.975},{-32.1857,-8.975}}, color={255,
            0,255}));
    connect(halfBridgeConverterModularAver.ac, resistor.p)
      annotation (Line(points={{-6.74286,-2},{14,-2}},color={0,0,255}));
    connect(resistor.n, inductor.p)
      annotation (Line(points={{34,-2},{42,-2}}, color={0,0,255}));
    connect(inductor.n, currentSensor.p)
      annotation (Line(points={{62,-2},{74,-2}}, color={0,0,255}));
    connect(currentSensor.n, ground.p) annotation (Line(points={{86,-2},{86,-60},
            {-6,-60}},          color={0,0,255}));
    connect(halfBridgeConverterModularAver.ground, ground.p) annotation (Line(
          points={{-17.1429,-19.1},{-17.1429,-39.55},{-6,-39.55},{-6,-60}}, color=
           {0,0,255}));
    connect(sine.y, voltageToDutyCycle.v)
      annotation (Line(points={{-101.2,0},{-93.2,0}}, color={0,0,127}));
    connect(voltageToDutyCycle.dutyCycle, pWM.ModulatingSignal)
      annotation (Line(points={{-79.4,0},{-69.4,0}}, color={0,0,127}));
    connect(halfBridgeConverterModularAver.DutyCycle, voltageToDutyCycle.dutyCycle)
      annotation (Line(points={{-16.4,16},{-16.4,22},{-79.4,22},{-79.4,0}}, color=
           {0,0,127}));
    connect(halfBridgeConverterModularAver.current, currentSensor.i) annotation (
        Line(points={{-5.44286,-10.325},{12,-10.325},{12,-24},{80,-24},{80,-8}},
          color={0,0,127}));
    connect(resistor.p, voltageSensor.p) annotation (Line(points={{14,-2},{14,
            -8},{16,-8},{16,-20},{34,-20},{34,-30}},
                                                 color={0,0,255}));
    connect(voltageSensor.n, ground.p) annotation (Line(points={{34,-50},{2,-50},
            {2,-58},{-6,-58},{-6,-60}},color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,
              -80},{100,60}})),                                    Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-140,-80},{100,
              60}})));
  end OnePhTwoLevelConvAver;

  model OnePhTwoLevelConvCompModelTuning
    Components.HalfBridgeConverterModular
                        halfBridgeConverterModular
      annotation (Placement(transformation(extent={{-28,-24},{4,20}})));
    Components.PWM
        pWM(f=3420)
      annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-20,-76},{0,-56}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor(R=plant.R)
      annotation (Placement(transformation(extent={{14,-10},{30,6}})));
    Modelica.Electrical.Analog.Basic.Inductor inductor(L=plant.L)
      annotation (Placement(transformation(extent={{40,-10},{56,6}})));
    Components.ControllerModelTuning
               controllerModelTuning
      annotation (Placement(transformation(extent={{-108,-12},{-82,12}})));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
      annotation (Placement(transformation(extent={{62,-8},{74,4}})));
    Modelica.Blocks.Sources.Sine sine(
      amplitude=1000,
      freqHz=60,
      startTime=0.07)
      annotation (Placement(transformation(extent={{-160,-6},{-144,10}})));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
      annotation (Placement(transformation(extent={{32,16},{48,32}})));
    Modelica.Blocks.Math.Feedback feedback
      annotation (Placement(transformation(extent={{-136,-10},{-116,10}})));
    Records.Plant plant
      annotation (Placement(transformation(extent={{60,60},{80,80}})));
    Modelica.Blocks.Sources.Constant const(k=plant.Vd/2) annotation (Placement(
          transformation(
          extent={{-7,-7},{7,7}},
          rotation=90,
          origin={-95,-29})));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor(C=10) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={14,-22})));
  equation
    connect(pWM.Q1, halfBridgeConverterModular.Q1gate) annotation (Line(points={{-52.8,2},
            {-48,2},{-48,3.775},{-28.2286,3.775}},            color={255,0,255}));
    connect(pWM.Q4, halfBridgeConverterModular.Q4gate) annotation (Line(points={{-52.8,
            -5},{-38,-5},{-38,-10.525},{-28.2286,-10.525}},         color={255,
            0,255}));
    connect(halfBridgeConverterModular.ac, resistor.p)
      annotation (Line(points={{3.08571,-2},{14,-2}}, color={0,0,255}));
    connect(resistor.n, inductor.p)
      annotation (Line(points={{30,-2},{40,-2}}, color={0,0,255}));
    connect(inductor.n, currentSensor.p)
      annotation (Line(points={{56,-2},{62,-2}}, color={0,0,255}));
    connect(controllerModelTuning.y, pWM.ModulatingSignal)
      annotation (Line(points={{-82,5.14286},{-76,5.14286},{-76,0},{-71.4,0}},
                                                   color={0,0,127}));
    connect(currentSensor.n, ground.p) annotation (Line(points={{74,-2},{74,-56},
            {-10,-56}},         color={0,0,255}));
    connect(voltageSensor.p, halfBridgeConverterModular.ac) annotation (Line(
          points={{32,24},{8,24},{8,-2},{3.08571,-2}}, color={0,0,255}));
    connect(voltageSensor.n, ground.p) annotation (Line(points={{48,24},{80,24},
            {80,-52},{-10,-52},{-10,-56}},       color={0,0,255}));
    connect(sine.y, feedback.u1)
      annotation (Line(points={{-143.2,2},{-138,2},{-138,0},{-134,0}},
                                                     color={0,0,127}));
    connect(currentSensor.i, feedback.u2) annotation (Line(points={{68,-8},{68,
            -40},{-126,-40},{-126,-8}}, color={0,0,127}));
    connect(feedback.y, controllerModelTuning.Error)
      annotation (Line(points={{-117,0},{-112,0},{-112,5.14286},{-108,5.14286}},
                                                   color={0,0,127}));
    connect(halfBridgeConverterModular.ground, ground.p) annotation (Line(
          points={{-9.71429,-22.9},{-9.71429,-22},{-10,-22},{-10,-56}}, color={
            0,0,255}));
    connect(const.y, controllerModelTuning.Vdc2)
      annotation (Line(points={{-95,-21.3},{-95,-12}}, color={0,0,127}));
    connect(capacitor.p, resistor.p)
      annotation (Line(points={{14,-12},{14,-2}}, color={0,0,255}));
    connect(capacitor.n, ground.p) annotation (Line(points={{14,-32},{14,-46},{
            -10,-46},{-10,-56}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-180,
              -80},{100,80}})),                                    Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-180,-80},{100,
              80}})));
  end OnePhTwoLevelConvCompModelTuning;

  model OnePhTwoLevelConvCompModelTuningAver
    Components.HalfBridgeConverterModularAver
                        halfBridgeConverterModularAver
      annotation (Placement(transformation(extent={{-28,-24},{4,20}})));
    Components.PWM
        pWM(f=3420)
      annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-20,-76},{0,-56}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor(R=plant.R)
      annotation (Placement(transformation(extent={{14,-10},{30,6}})));
    Modelica.Electrical.Analog.Basic.Inductor inductor(L=plant.L)
      annotation (Placement(transformation(extent={{40,-10},{56,6}})));
    Components.ControllerModelTuning
               controllerModelTuning
      annotation (Placement(transformation(extent={{-108,-12},{-82,12}})));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
      annotation (Placement(transformation(extent={{62,-8},{74,4}})));
    Modelica.Blocks.Sources.Sine sine(amplitude=1000,
      freqHz=60,
      phase=0,
      startTime=0.07)
      annotation (Placement(transformation(extent={{-160,-8},{-144,8}})));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
      annotation (Placement(transformation(extent={{32,16},{48,32}})));
    Modelica.Blocks.Math.Feedback feedback
      annotation (Placement(transformation(extent={{-136,-10},{-116,10}})));
    Records.Plant plant
      annotation (Placement(transformation(extent={{60,60},{80,80}})));
    Modelica.Blocks.Sources.Constant const(k=plant.Vd/2) annotation (Placement(
          transformation(
          extent={{-7,-7},{7,7}},
          rotation=90,
          origin={-95,-29})));
  equation
    connect(pWM.Q1, halfBridgeConverterModularAver.Q1gate) annotation (Line(
          points={{-52.8,2},{-48,2},{-48,3.775},{-28.2286,3.775}}, color={255,0,255}));
    connect(pWM.Q4, halfBridgeConverterModularAver.Q4gate) annotation (Line(
          points={{-52.8,-5},{-38,-5},{-38,-10.525},{-28.2286,-10.525}}, color={255,
            0,255}));
    connect(halfBridgeConverterModularAver.ac, resistor.p)
      annotation (Line(points={{3.08571,-2},{14,-2}}, color={0,0,255}));
    connect(resistor.n, inductor.p)
      annotation (Line(points={{30,-2},{40,-2}}, color={0,0,255}));
    connect(inductor.n, currentSensor.p)
      annotation (Line(points={{56,-2},{62,-2}}, color={0,0,255}));
    connect(controllerModelTuning.y, pWM.ModulatingSignal)
      annotation (Line(points={{-82,5.14286},{-76,5.14286},{-76,0},{-71.4,0}},
                                                   color={0,0,127}));
    connect(currentSensor.n, ground.p) annotation (Line(points={{74,-2},{74,-56},
            {-10,-56}},         color={0,0,255}));
    connect(voltageSensor.p, halfBridgeConverterModularAver.ac) annotation (Line(
          points={{32,24},{8,24},{8,-2},{3.08571,-2}}, color={0,0,255}));
    connect(voltageSensor.n, ground.p) annotation (Line(points={{48,24},{80,24},
            {80,-52},{-10,-52},{-10,-56}},       color={0,0,255}));
    connect(sine.y, feedback.u1)
      annotation (Line(points={{-143.2,0},{-134,0}}, color={0,0,127}));
    connect(currentSensor.i, feedback.u2) annotation (Line(points={{68,-8},{68,
            -40},{-126,-40},{-126,-8}}, color={0,0,127}));
    connect(feedback.y, controllerModelTuning.Error)
      annotation (Line(points={{-117,0},{-112,0},{-112,5.14286},{-108,5.14286}},
                                                   color={0,0,127}));
    connect(halfBridgeConverterModularAver.ground, ground.p) annotation (Line(
          points={{-9.71429,-22.9},{-9.71429,-22},{-10,-22},{-10,-56}}, color={0,0,
            255}));
    connect(const.y, controllerModelTuning.Vdc2)
      annotation (Line(points={{-95,-21.3},{-95,-12}}, color={0,0,127}));
    connect(controllerModelTuning.y, halfBridgeConverterModularAver.DutyCycle)
      annotation (Line(points={{-82,5.14286},{-78,5.14286},{-78,30},{-8.8,30},{
            -8.8,20}},
          color={0,0,127}));
    connect(halfBridgeConverterModularAver.current, currentSensor.i) annotation (
        Line(points={{4.68571,-12.175},{36,-12.175},{36,-12},{68,-12},{68,-8}},
          color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-180,
              -80},{100,80}})),                                    Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-180,-80},{100,
              80}})));
  end OnePhTwoLevelConvCompModelTuningAver;

  model OnePhTwoLevelConvCompMod
    Components.HalfBridgeConverterModular
                        halfBridgeConverterModular
      annotation (Placement(transformation(extent={{-22,-20},{4,16}})));
    Components.PWM
        pWM(f=3420)
      annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-18,-80},{2,-60}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor(R=plant.R)
      annotation (Placement(transformation(extent={{14,-12},{34,8}})));
    Modelica.Electrical.Analog.Basic.Inductor inductor(L=plant.L)
      annotation (Placement(transformation(extent={{42,-12},{62,8}})));
    Components.ControllerMod
               controllerMod
      annotation (Placement(transformation(extent={{-122,-12},{-96,12}})));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
      annotation (Placement(transformation(extent={{74,-8},{86,4}})));
    Modelica.Blocks.Sources.Sine sine(amplitude=1000,
      freqHz=60,
      phase=0,
      startTime=0.07)
      annotation (Placement(transformation(extent={{-156,0},{-140,16}})));

    Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
      annotation (Placement(transformation(extent={{52,28},{68,44}})));
    Modelica.Blocks.Sources.Constant const(k=plant.Vd/2) annotation (Placement(
          transformation(
          extent={{-7,-7},{7,7}},
          rotation=90,
          origin={-109,-29})));
    Records.Plant plant
      annotation (Placement(transformation(extent={{60,60},{80,80}})));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor(C=1e-1) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={14,-26})));
  equation
    connect(pWM.Q1, halfBridgeConverterModular.Q1gate) annotation (Line(points={{-52.8,2},
            {-48,2},{-48,2.725},{-22.1857,2.725}},            color={255,0,255}));
    connect(pWM.Q4, halfBridgeConverterModular.Q4gate) annotation (Line(points={{-52.8,
            -5},{-38,-5},{-38,-8.975},{-22.1857,-8.975}},         color={255,0,
            255}));
    connect(resistor.n, inductor.p)
      annotation (Line(points={{34,-2},{42,-2}}, color={0,0,255}));
    connect(inductor.n, currentSensor.p)
      annotation (Line(points={{62,-2},{74,-2}}, color={0,0,255}));
    connect(sine.y, controllerMod.Reference) annotation (Line(points={{-139.2,8},{
            -132,8},{-132,4.32},{-122,4.32}}, color={0,0,127}));
    connect(currentSensor.i, controllerMod.FeedbackSignal) annotation (Line(
          points={{80,-8},{80,-46},{-132,-46},{-132,-4.32},{-122,-4.32}}, color=
           {0,0,127}));
    connect(controllerMod.y, pWM.ModulatingSignal)
      annotation (Line(points={{-96,0},{-71.4,0}}, color={0,0,127}));
    connect(halfBridgeConverterModular.ac, resistor.p)
      annotation (Line(points={{3.25714,-2},{14,-2}}, color={0,0,255}));
    connect(currentSensor.n, ground.p) annotation (Line(points={{86,-2},{88,-2},
            {88,-50},{-8,-50},{-8,-60}},color={0,0,255}));
    connect(resistor.p, voltageSensor.p)
      annotation (Line(points={{14,-2},{14,36},{52,36}}, color={0,0,255}));
    connect(voltageSensor.n, ground.p) annotation (Line(points={{68,36},{90,36},
            {90,-60},{-8,-60}},          color={0,0,255}));
    connect(controllerMod.Vdc2, const.y)
      annotation (Line(points={{-109,-12},{-109,-21.3}}, color={0,0,127}));
    connect(halfBridgeConverterModular.ground, ground.p) annotation (Line(
          points={{-7.14286,-19.1},{-7.14286,-39.55},{-8,-39.55},{-8,-60}},
          color={0,0,255}));
    connect(capacitor.p, resistor.p)
      annotation (Line(points={{14,-16},{14,-2}}, color={0,0,255}));
    connect(capacitor.n, ground.p) annotation (Line(points={{14,-36},{14,-42},{
            -8,-42},{-8,-60}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,
              -80},{100,80}})),                                    Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-160,-80},{100,
              80}})));
  end OnePhTwoLevelConvCompMod;

  model OnePhTwoLevelConvCompModAver
    Components.HalfBridgeConverterModularAver
                        halfBridgeConverterModularAver
      annotation (Placement(transformation(extent={{-22,-20},{4,16}})));
    Components.PWM
        pWM(f=3420)
      annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-18,-80},{2,-60}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor(R=plant.R)
      annotation (Placement(transformation(extent={{14,-12},{34,8}})));
    Modelica.Electrical.Analog.Basic.Inductor inductor(L=plant.L)
      annotation (Placement(transformation(extent={{42,-12},{62,8}})));
    Components.ControllerMod
               controllerModAver
      annotation (Placement(transformation(extent={{-122,-12},{-96,12}})));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
      annotation (Placement(transformation(extent={{74,-8},{86,4}})));
    Modelica.Blocks.Sources.Sine sine(amplitude=1000,
      freqHz=60,
      phase=0,
      startTime=0.07)
      annotation (Placement(transformation(extent={{-156,0},{-140,16}})));

    Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
      annotation (Placement(transformation(extent={{52,28},{68,44}})));
    Modelica.Blocks.Sources.Constant const(k=plant.Vd/2) annotation (Placement(
          transformation(
          extent={{-7,-7},{7,7}},
          rotation=90,
          origin={-109,-29})));
    Records.Plant plant
      annotation (Placement(transformation(extent={{60,60},{80,80}})));
  equation
    connect(pWM.Q1, halfBridgeConverterModularAver.Q1gate) annotation (Line(
          points={{-52.8,2},{-48,2},{-48,2.725},{-22.1857,2.725}}, color={255,0,255}));
    connect(pWM.Q4, halfBridgeConverterModularAver.Q4gate) annotation (Line(
          points={{-52.8,-5},{-38,-5},{-38,-8.975},{-22.1857,-8.975}}, color={255,
            0,255}));
    connect(resistor.n, inductor.p)
      annotation (Line(points={{34,-2},{42,-2}}, color={0,0,255}));
    connect(inductor.n, currentSensor.p)
      annotation (Line(points={{62,-2},{74,-2}}, color={0,0,255}));
    connect(sine.y, controllerModAver.Reference) annotation (Line(points={{-139.2,
            8},{-132,8},{-132,4.32},{-122,4.32}}, color={0,0,127}));
    connect(currentSensor.i, controllerModAver.FeedbackSignal) annotation (Line(
          points={{80,-8},{80,-46},{-132,-46},{-132,-4.32},{-122,-4.32}}, color=
           {0,0,127}));
    connect(controllerModAver.y, pWM.ModulatingSignal)
      annotation (Line(points={{-96,0},{-71.4,0}}, color={0,0,127}));
    connect(halfBridgeConverterModularAver.ac, resistor.p)
      annotation (Line(points={{3.25714,-2},{14,-2}}, color={0,0,255}));
    connect(currentSensor.n, ground.p) annotation (Line(points={{86,-2},{88,-2},
            {88,-50},{-8,-50},{-8,-60}},color={0,0,255}));
    connect(resistor.p, voltageSensor.p)
      annotation (Line(points={{14,-2},{14,36},{52,36}}, color={0,0,255}));
    connect(voltageSensor.n, ground.p) annotation (Line(points={{68,36},{90,36},
            {90,-60},{-8,-60}},          color={0,0,255}));
    connect(controllerModAver.Vdc2, const.y)
      annotation (Line(points={{-109,-12},{-109,-21.3}}, color={0,0,127}));
    connect(halfBridgeConverterModularAver.ground, ground.p) annotation (Line(
          points={{-7.14286,-19.1},{-7.14286,-39.55},{-8,-39.55},{-8,-60}}, color=
           {0,0,255}));
    connect(controllerModAver.y, halfBridgeConverterModularAver.DutyCycle)
      annotation (Line(points={{-96,0},{-90,0},{-90,22},{-6.4,22},{-6.4,16}},
          color={0,0,127}));
    connect(halfBridgeConverterModularAver.current, currentSensor.i) annotation (
        Line(points={{4.55714,-10.325},{42,-10.325},{42,-20},{80,-20},{80,-8}},
          color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,
              -80},{100,80}})),                                    Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-160,-80},{100,
              80}})));
  end OnePhTwoLevelConvCompModAver;

  package Records
    record PI_par "PI parameters"
      extends Modelica.Icons.Record;
      extends PI_Lambda;
      parameter Real K = K_lambda "Proportional gain";
      parameter Modelica.SIunits.Time Ti=Ti_lambda "Integral time";
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end PI_par;

    record Plant "Parameters of the converter (First order model 1/(L*s+(R+ron)))"
      extends Modelica.Icons.Record;
      parameter Real R = 5e-3 "Resistance of external network";
      parameter Real L = 690e-6 "Inductance of external network";
      parameter Real ron = 0.88e-3 "Resistance of the switch ON state";
      parameter Real lambda = 5e-3 "Closed-loop time constant";
      parameter Real Vd = 1200 "DC side voltage of the converter";
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Plant;

    record PI_Lambda "PI Lambda Tuning"
      extends Plant;
      final parameter Real K_lambda=1/(1/(R+ron)*lambda);
      final parameter Real Ti_lambda=L/(R+ron);

      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end PI_Lambda;
  end Records;

  package Components
    model HalfBridgeConverter
      Modelica.Electrical.Analog.Ideal.IdealGTOThyristor Q1(Ron=Ron)
                                                            annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=-90,
            origin={0,30})));
      Modelica.Electrical.Analog.Ideal.IdealDiode D1(Ron=Ron)
                                                     annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={40,30})));
      Modelica.Electrical.Analog.Ideal.IdealGTOThyristor Q4(Ron=Ron)
                                                            annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=-90,
            origin={0,-30})));
      Modelica.Electrical.Analog.Ideal.IdealDiode D4(Ron=Ron)
                                                     annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={40,-30})));
      Modelica.Blocks.Interfaces.BooleanInput Q1gate
        annotation (Placement(transformation(extent={{-72,12},{-50,34}})));
      Modelica.Electrical.Analog.Interfaces.PositivePin ac
        annotation (Placement(transformation(extent={{66,-10},{86,10}})));
      Modelica.Blocks.Interfaces.BooleanInput Q4gate
        annotation (Placement(transformation(extent={{-72,-48},{-50,-26}})));
      parameter Modelica.SIunits.Resistance Ron=1
        "Forward state-on differential resistance (closed resistance)";
      Modelica.Electrical.Analog.Sources.ConstantVoltage Vdc1(V=Vd1)
                                                               annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-34,46})));
      Modelica.Electrical.Analog.Sources.ConstantVoltage Vdc2(V=Vd2)
                                                               annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-34,-54})));
      Modelica.Electrical.Analog.Interfaces.PositivePin ground
        annotation (Placement(transformation(extent={{10,-86},{30,-66}})));
      parameter Modelica.SIunits.Voltage Vd1=600 "Value of constant voltage";
      parameter Modelica.SIunits.Voltage Vd2=600 "Value of constant voltage";
    equation
      connect(Q4.p, ac)
        annotation (Line(points={{0,-20},{0,0},{76,0}}, color={0,0,255}));
      connect(Q1gate, Q1.fire)
        annotation (Line(points={{-61,23},{-11,23}}, color={255,0,255}));
      connect(Q4gate, Q4.fire)
        annotation (Line(points={{-61,-37},{-11,-37}}, color={255,0,255}));
      connect(Q1.n, ac)
        annotation (Line(points={{0,20},{0,0},{76,0}}, color={0,0,255}));
      connect(D1.p, ac) annotation (Line(points={{40,20},{20,20},{20,10},{0,10},{
              0,0},{76,0}}, color={0,0,255}));
      connect(D4.n, ac) annotation (Line(points={{40,-20},{40,-12},{0,-12},{0,0},
              {76,0}}, color={0,0,255}));
      connect(Vdc1.n, Vdc2.p) annotation (Line(points={{-34,36},{-34,-44},{-34,
              -44}}, color={0,0,255}));
      connect(ground, Vdc2.p) annotation (Line(points={{20,-76},{-22,-76},{-22,
              0},{-34,0},{-34,-44}}, color={0,0,255}));
      connect(Vdc2.n, Q4.n) annotation (Line(points={{-34,-64},{-34,-72},{0,-72},
              {0,-40}}, color={0,0,255}));
      connect(D4.p, Q4.n) annotation (Line(points={{40,-40},{40,-52},{0,-52},{0,
              -40},{-1.77636e-15,-40}}, color={0,0,255}));
      connect(Vdc1.p, Q1.p) annotation (Line(points={{-34,56},{-34,68},{0,68},{
              0,40}}, color={0,0,255}));
      connect(D1.n, Q1.p) annotation (Line(points={{40,40},{40,54},{0,54},{0,40},
              {1.83187e-15,40}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-60,-80},
                {80,80}})),        Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-60,-80},{80,80}})));
    end HalfBridgeConverter;

    model PWM
      Modelica.Blocks.Interfaces.RealInput ModulatingSignal
        annotation (Placement(transformation(extent={{-108,-14},{-80,14}})));
      Modelica.Blocks.Nonlinear.Limiter limiter(uMax=1, uMin=-1)
        annotation (Placement(transformation(extent={{-36,-10},{-16,10}})));
      Modelica.Blocks.Sources.SawTooth Carrier(period=1/f,
        offset=-1,
        amplitude=2)
        annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
      Modelica.Blocks.Logical.Less less
        annotation (Placement(transformation(extent={{20,2},{40,-18}})));
      Modelica.Blocks.Interfaces.BooleanOutput Q1
        annotation (Placement(transformation(extent={{82,10},{102,30}})));
      parameter Modelica.SIunits.Frequency f=1000 "Switching frequency";
      Modelica.Blocks.Logical.Not not1
        annotation (Placement(transformation(extent={{52,-60},{72,-40}})));
      Modelica.Blocks.Interfaces.BooleanOutput Q4
        annotation (Placement(transformation(extent={{82,-60},{102,-40}})));
    equation
      connect(ModulatingSignal, limiter.u)
        annotation (Line(points={{-94,1.77636e-15},{-60,1.77636e-15},{-60,0},{-38,
              0}},                                 color={0,0,127}));
      connect(limiter.y, less.u2)
        annotation (Line(points={{-15,0},{18,0}}, color={0,0,127}));
      connect(Carrier.y, less.u1) annotation (Line(points={{1,-50},{10,-50},{10,-8},
              {18,-8}}, color={0,0,127}));
      connect(less.y,Q1)  annotation (Line(points={{41,-8},{66,-8},{66,20},{92,20}},
            color={255,0,255}));
      connect(not1.u, Q1) annotation (Line(points={{50,-50},{46,-50},{46,-8},{66,
              -8},{66,20},{92,20}}, color={255,0,255}));
      connect(not1.y, Q4)
        annotation (Line(points={{73,-50},{92,-50}}, color={255,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end PWM;

    model ControllerMod
      Modelica.Blocks.Nonlinear.Limiter limiter(uMax=1, uMin=-1)
        annotation (Placement(transformation(extent={{68,-6},{80,6}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{-78,-6},{-66,6}})));
      Modelica.Blocks.Interfaces.RealInput Reference
        annotation (Placement(transformation(extent={{-110,26},{-90,46}})));
      Modelica.Blocks.Interfaces.RealInput FeedbackSignal
        annotation (Placement(transformation(extent={{-110,-46},{-90,-26}})));
      Modelica.Blocks.Interfaces.RealInput Vdc2 annotation (Placement(
            transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={0,-100})));
      Modelica.Blocks.Math.Division division
        annotation (Placement(transformation(extent={{42,-6},{54,6}})));
      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Blocks.Continuous.TransferFunction transferFunction(b={1,966}, a={1,5633})
        annotation (Placement(transformation(extent={{-14,-6},{-2,6}})));
      Modelica.Blocks.Continuous.TransferFunction transferFunction1(b={1,2}, a={1,0.05})
        annotation (Placement(transformation(extent={{8,-6},{20,6}})));
      Modelica.Blocks.Continuous.TransferFunction transferFunction2(b={1,8.52}, a={1,
            0,142129})
        annotation (Placement(transformation(extent={{-38,-6},{-26,6}})));
      Modelica.Blocks.Math.Gain gain(k=8680)
        annotation (Placement(transformation(extent={{-58,-6},{-48,4}})));
    equation
      connect(Reference, add.u1) annotation (Line(points={{-100,36},{-86,36},{-86,3.6},
              {-79.2,3.6}}, color={0,0,127}));
      connect(FeedbackSignal, add.u2) annotation (Line(points={{-100,-36},{-86,-36},
              {-86,-3.6},{-79.2,-3.6}}, color={0,0,127}));
      connect(division.y, limiter.u)
        annotation (Line(points={{54.6,0},{66.8,0}}, color={0,0,127}));
      connect(limiter.y, y)
        annotation (Line(points={{80.6,0},{100,0}}, color={0,0,127}));
      connect(division.u2, Vdc2) annotation (Line(points={{40.8,-3.6},{40,-3.6},{40,
              -4},{32,-4},{32,-74},{0,-74},{0,-100}},
                                      color={0,0,127}));
      connect(transferFunction2.u, gain.y) annotation (Line(points={{-39.2,0},{-40,0},
              {-40,-1},{-47.5,-1}}, color={0,0,127}));
      connect(add.y, gain.u) annotation (Line(points={{-65.4,0},{-64,0},{-64,-1},{-59,
              -1}}, color={0,0,127}));
      connect(transferFunction2.y, transferFunction.u)
        annotation (Line(points={{-25.4,0},{-15.2,0}}, color={0,0,127}));
      connect(transferFunction.y, transferFunction1.u)
        annotation (Line(points={{-1.4,0},{6.8,0}}, color={0,0,127}));
      connect(transferFunction1.y, division.u1) annotation (Line(points={{20.6,0},{30,
              0},{30,3.6},{40.8,3.6}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ControllerMod;

    model ModelBased_PI
      replaceable Records.PI_par pi_settings constrainedby Records.PI_par
        annotation (Placement(transformation(extent={{56,36},{76,56}})));
      Modelica.Blocks.Interfaces.RealInput Measurements
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
      Modelica.Blocks.Interfaces.RealOutput ActuatorSignal
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Blocks.Continuous.PI PI(k=pi_settings.K, T=pi_settings.Ti)
        annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
    equation
      connect(Measurements, PI.u)
        annotation (Line(points={{-100,0},{-10,0}}, color={0,0,127}));
      connect(PI.y, ActuatorSignal)
        annotation (Line(points={{13,0},{54,0},{54,0},{100,0}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-40},{100,80}})),                               Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,
                80}})));
    end ModelBased_PI;

    model ControllerModelTuning
      ModelBased_PI                 modelBased_PI
        annotation (Placement(transformation(extent={{-70,-10},{-42,10}})));
      Modelica.Blocks.Nonlinear.Limiter limiter(uMax=1, uMin=-1)
        annotation (Placement(transformation(extent={{32,-6},{44,6}})));
      Modelica.Blocks.Interfaces.RealInput Error
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica.Blocks.Interfaces.RealInput Vdc2 annotation (Placement(
            transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={0,-100})));
      Modelica.Blocks.Math.Division division
        annotation (Placement(transformation(extent={{-2,-6},{10,6}})));
      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      parameter Real k=1 "PI Gain";
      parameter Modelica.SIunits.Time T=10 "PI Time Constant (T>0 required)";
    equation
      connect(division.y, limiter.u)
        annotation (Line(points={{10.6,0},{30.8,0}}, color={0,0,127}));
      connect(limiter.y, y)
        annotation (Line(points={{44.6,0},{100,0}}, color={0,0,127}));
      connect(division.u2, Vdc2) annotation (Line(points={{-3.2,-3.6},{-10,-3.6},{-10,
              -74},{0,-74},{0,-100}}, color={0,0,127}));
      connect(Error, modelBased_PI.Measurements)
        annotation (Line(points={{-100,0},{-86,0},{-86,-3.33333},{-70,-3.33333}},
                                                    color={0,0,127}));
      connect(modelBased_PI.ActuatorSignal, division.u1) annotation (Line(
            points={{-42,-3.33333},{-28,-3.33333},{-28,3.6},{-3.2,3.6}},
                                                           color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,40}})),                              Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,40}})));
    end ControllerModelTuning;

    model SwitchCell
      Modelica.Electrical.Analog.Ideal.IdealGTOThyristor Q(Ron=Ron)
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=-90,
            origin={-20,-10})));
      Modelica.Electrical.Analog.Ideal.IdealDiode D(Ron=Ron) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,-10})));
      Modelica.Blocks.Interfaces.BooleanInput GateSignal
        annotation (Placement(transformation(extent={{-94,-30},{-68,-4}})));
      Modelica.Electrical.Analog.Interfaces.Pin pin
        annotation (Placement(transformation(extent={{-30,26},{-10,46}})));
      parameter Modelica.SIunits.Resistance Ron
        "Forward state-on differential resistance (closed resistance)";
      Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
        annotation (Placement(transformation(extent={{-30,-66},{-10,-46}})));
    equation
      connect(Q.fire, GateSignal)
        annotation (Line(points={{-31,-17},{-81,-17}}, color={255,0,255}));
      connect(Q.p, pin)
        annotation (Line(points={{-20,0},{-20,36}}, color={0,0,255}));
      connect(D.n, pin) annotation (Line(points={{0,0},{0,16},{-20,16},{-20,36}},
            color={0,0,255}));
      connect(Q.n, pin_n) annotation (Line(points={{-20,-20},{-20,-56},{-20,-56}},
            color={0,0,255}));
      connect(D.p, pin_n) annotation (Line(points={{0,-20},{0,-32},{-20,-32},{-20,
              -56}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-80,
                -60},{20,40}})), Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-80,-60},{20,40}})));
    end SwitchCell;

    model HalfBridgeConverterModular
      Modelica.Blocks.Interfaces.BooleanInput Q1gate
        annotation (Placement(transformation(extent={{-72,10},{-50,32}})));
      Modelica.Electrical.Analog.Interfaces.PositivePin ac
        annotation (Placement(transformation(extent={{66,-10},{86,10}})));
      Modelica.Blocks.Interfaces.BooleanInput Q4gate
        annotation (Placement(transformation(extent={{-72,-42},{-50,-20}})));

      Modelica.Electrical.Analog.Sources.ConstantVoltage Vdc1(V=plant.Vd/2)
                                                               annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-34,46})));
      Modelica.Electrical.Analog.Sources.ConstantVoltage Vdc2(V=plant.Vd/2)
                                                               annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-34,-54})));
      Modelica.Electrical.Analog.Interfaces.PositivePin ground
        annotation (Placement(transformation(extent={{10,-86},{30,-66}})));

      SwitchCell switch1(Ron=plant.ron)
        annotation (Placement(transformation(extent={{-8,12},{10,32}})));
      SwitchCell switch4(Ron=plant.ron)
        annotation (Placement(transformation(extent={{-8,-40},{10,-20}})));
      Records.Plant plant
        annotation (Placement(transformation(extent={{50,56},{70,76}})));
    equation
      connect(Vdc1.n, Vdc2.p) annotation (Line(points={{-34,36},{-34,-44},{-34,
              -44}}, color={0,0,255}));
      connect(ground, Vdc2.p) annotation (Line(points={{20,-76},{-22,-76},{-22,
              0},{-34,0},{-34,-44}}, color={0,0,255}));
      connect(Q1gate, switch1.GateSignal) annotation (Line(points={{-61,21},{
              -36.5,21},{-36.5,20.6},{-8.18,20.6}}, color={255,0,255}));
      connect(switch1.pin, Vdc1.p) annotation (Line(points={{2.8,31.2},{2.8,64},
              {-34,64},{-34,56}}, color={0,0,255}));
      connect(switch1.pin_n, ac)
        annotation (Line(points={{2.8,12.8},{2.8,0},{76,0}}, color={0,0,255}));
      connect(Q4gate, switch4.GateSignal) annotation (Line(points={{-61,-31},{
              -36.5,-31},{-36.5,-31.4},{-8.18,-31.4}}, color={255,0,255}));
      connect(switch4.pin, ac) annotation (Line(points={{2.8,-20.8},{2.8,0},{76,
              0}}, color={0,0,255}));
      connect(Vdc2.n, switch4.pin_n) annotation (Line(points={{-34,-64},{-34,
              -68},{2.8,-68},{2.8,-39.2}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-60,-80},
                {80,80}})),        Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-60,-80},{80,80}})));
    end HalfBridgeConverterModular;

    model SwitchCellAverP
      Modelica.Blocks.Interfaces.BooleanInput GateSignal
        annotation (Placement(transformation(extent={{-114,-28},{-88,-2}})));
      Modelica.Electrical.Analog.Interfaces.Pin pin
        annotation (Placement(transformation(extent={{-82,46},{-62,66}})));

      Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
        annotation (Placement(transformation(extent={{-82,-86},{-62,-66}})));

      Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-72,-16})));

      Modelica.Blocks.Interfaces.RealInput DutyCycle
        annotation (Placement(transformation(extent={{68,18},{52,34}})));
      Modelica.Blocks.Math.Gain gain2(k=2) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=180,
            origin={37,25})));
      Modelica.Blocks.Sources.Constant const(k=1)
        annotation (Placement(transformation(extent={{46,0},{34,12}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{24,14},{14,24}})));
      Modelica.Blocks.Math.Add add1(k2=+1)
        annotation (Placement(transformation(extent={{2,10},{-8,20}})));
      Modelica.Blocks.Math.Division division
        annotation (Placement(transformation(extent={{-22,-2},{-34,10}})));
      Modelica.Blocks.Sources.Constant const2(k=2)
        annotation (Placement(transformation(extent={{2,-14},{-10,-2}})));
      Modelica.Blocks.Sources.Constant const1(k=1)
        annotation (Placement(transformation(extent={{24,-6},{12,6}})));
      Modelica.Blocks.Math.Product product
        annotation (Placement(transformation(extent={{-40,-22},{-52,-10}})));
      Modelica.Blocks.Interfaces.RealInput current
        annotation (Placement(transformation(extent={{70,-60},{50,-40}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor(R=Ron)
                                                         annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-72,-48})));
      parameter Modelica.SIunits.Resistance Ron "Forward state-on differential resistance (closed resistance)";
    equation
      connect(pin, signalCurrent.p)
        annotation (Line(points={{-72,56},{-72,-6}}, color={0,0,255}));
      connect(gain2.u, DutyCycle) annotation (Line(points={{43,25},{44.5,25},{
              44.5,26},{60,26}}, color={0,0,127}));
      connect(gain2.y, add.u1) annotation (Line(points={{31.5,25},{30,25},{30,
              24},{28,24},{28,22},{25,22}}, color={0,0,127}));
      connect(const.y, add.u2) annotation (Line(points={{33.4,6},{30,6},{30,16},
              {25,16}}, color={0,0,127}));
      connect(add1.u1, add.y) annotation (Line(points={{3,18},{8,18},{8,19},{
              13.5,19}}, color={0,0,127}));
      connect(add1.u2, const1.y) annotation (Line(points={{3,12},{6,12},{6,0},{
              11.4,0}}, color={0,0,127}));
      connect(add1.y, division.u1) annotation (Line(points={{-8.5,15},{-14.25,
              15},{-14.25,7.6},{-20.8,7.6}}, color={0,0,127}));
      connect(const2.y, division.u2) annotation (Line(points={{-10.6,-8},{-16,
              -8},{-16,0.4},{-20.8,0.4}}, color={0,0,127}));
      connect(division.y, product.u1) annotation (Line(points={{-34.6,4},{-36,4},
              {-36,-12.4},{-38.8,-12.4}}, color={0,0,127}));
      connect(current, product.u2) annotation (Line(points={{60,-50},{12,-50},{
              12,-19.6},{-38.8,-19.6}}, color={0,0,127}));
      connect(product.y, signalCurrent.i)
        annotation (Line(points={{-52.6,-16},{-65,-16}}, color={0,0,127}));
      connect(signalCurrent.n, resistor.p)
        annotation (Line(points={{-72,-26},{-72,-38}}, color={0,0,255}));
      connect(resistor.n, pin_n)
        annotation (Line(points={{-72,-58},{-72,-76}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -80},{60,60}})), Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-100,-80},{60,60}})));
    end SwitchCellAverP;

    model SwitchCellAverN
      Modelica.Blocks.Interfaces.BooleanInput GateSignal
        annotation (Placement(transformation(extent={{-172,-12},{-146,14}})));
      Modelica.Electrical.Analog.Interfaces.Pin pin
        annotation (Placement(transformation(extent={{-142,66},{-122,86}})));
      parameter Modelica.SIunits.Resistance Ron
        "Forward state-on differential resistance (closed resistance)";
      Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
        annotation (Placement(transformation(extent={{-142,-66},{-122,-46}})));
      Modelica.Electrical.Analog.Sources.SignalCurrent   signalCurrent
        annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=-90,
            origin={-132,0})));

      Modelica.Blocks.Interfaces.RealInput DutyCycle
        annotation (Placement(transformation(extent={{30,32},{10,52}})));
      Modelica.Blocks.Math.Gain gain2(k=2) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=180,
            origin={-13,41})));
      Modelica.Blocks.Sources.Constant const(k=1)
        annotation (Placement(transformation(extent={{-4,16},{-16,28}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{-26,30},{-36,40}})));
      Modelica.Blocks.Math.Add add1(k2=+1, k1=-1)
        annotation (Placement(transformation(extent={{-48,26},{-58,36}})));
      Modelica.Blocks.Math.Division division
        annotation (Placement(transformation(extent={{-72,14},{-84,26}})));
      Modelica.Blocks.Sources.Constant const2(k=2)
        annotation (Placement(transformation(extent={{-48,2},{-60,14}})));
      Modelica.Blocks.Sources.Constant const1(k=1)
        annotation (Placement(transformation(extent={{-26,10},{-38,22}})));
      Modelica.Blocks.Math.Product product
        annotation (Placement(transformation(extent={{-90,-6},{-102,6}})));
      Modelica.Blocks.Interfaces.RealInput current
        annotation (Placement(transformation(extent={{30,-46},{10,-26}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor(R=Ron)
                                                         annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-132,-30})));
    equation
      connect(signalCurrent.n, pin)
        annotation (Line(points={{-132,10},{-132,76}}, color={0,0,255}));
      connect(gain2.u, DutyCycle) annotation (Line(points={{-7,41},{-5.5,41},{
              -5.5,42},{20,42}}, color={0,0,127}));
      connect(gain2.y, add.u1) annotation (Line(points={{-18.5,41},{-20,41},{
              -20,40},{-22,40},{-22,38},{-25,38}}, color={0,0,127}));
      connect(const.y, add.u2) annotation (Line(points={{-16.6,22},{-20,22},{
              -20,32},{-25,32}}, color={0,0,127}));
      connect(add1.u1, add.y) annotation (Line(points={{-47,34},{-42,34},{-42,
              35},{-36.5,35}}, color={0,0,127}));
      connect(add1.u2, const1.y) annotation (Line(points={{-47,28},{-44,28},{
              -44,16},{-38.6,16}}, color={0,0,127}));
      connect(add1.y, division.u1) annotation (Line(points={{-58.5,31},{-64.25,
              31},{-64.25,23.6},{-70.8,23.6}}, color={0,0,127}));
      connect(const2.y, division.u2) annotation (Line(points={{-60.6,8},{-66,8},
              {-66,16.4},{-70.8,16.4}}, color={0,0,127}));
      connect(division.y, product.u1) annotation (Line(points={{-84.6,20},{-86,
              20},{-86,3.6},{-88.8,3.6}}, color={0,0,127}));
      connect(current, product.u2) annotation (Line(points={{20,-36},{-34,-36},
              {-34,-3.6},{-88.8,-3.6}}, color={0,0,127}));
      connect(product.y, signalCurrent.i)
        annotation (Line(points={{-102.6,0},{-125,0}}, color={0,0,127}));
      connect(signalCurrent.p, resistor.p)
        annotation (Line(points={{-132,-10},{-132,-20}}, color={0,0,255}));
      connect(resistor.n, pin_n) annotation (Line(points={{-132,-40},{-132,-56},{-132,
              -56}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,
                -60},{20,80}})), Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-160,-60},{20,80}})));
    end SwitchCellAverN;

    model HalfBridgeConverterModularAver
      Modelica.Blocks.Interfaces.BooleanInput Q1gate
        annotation (Placement(transformation(extent={{-72,10},{-50,32}})));
      Modelica.Electrical.Analog.Interfaces.PositivePin ac
        annotation (Placement(transformation(extent={{66,-10},{86,10}})));
      Modelica.Blocks.Interfaces.BooleanInput Q4gate
        annotation (Placement(transformation(extent={{-72,-42},{-50,-20}})));

      Modelica.Electrical.Analog.Sources.ConstantVoltage Vdc1(V=plant.Vd/2)
                                                               annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-34,46})));
      Modelica.Electrical.Analog.Sources.ConstantVoltage Vdc2(V=plant.Vd/2)
                                                               annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-34,-54})));
      Modelica.Electrical.Analog.Interfaces.PositivePin ground
        annotation (Placement(transformation(extent={{10,-86},{30,-66}})));
      SwitchCellAverP switch1(Ron=plant.ron)
        annotation (Placement(transformation(extent={{-8,12},{10,32}})));
      SwitchCellAverN switch4(Ron=plant.ron)
        annotation (Placement(transformation(extent={{-8,-40},{10,-20}})));

      Modelica.Blocks.Interfaces.RealInput DutyCycle annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={24,80})));
      Modelica.Blocks.Interfaces.RealInput current
        annotation (Placement(transformation(extent={{94,-48},{72,-26}})));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
        annotation (Placement(transformation(extent={{48,-10},{28,10}})));
      Records.Plant plant
        annotation (Placement(transformation(extent={{56,60},{76,80}})));
      Modelica.Blocks.Math.Product product2
        annotation (Placement(transformation(extent={{4,-4},{-4,4}},
            rotation=90,
            origin={30,24})));
      Modelica.Blocks.Sources.Constant const5(k=plant.Vd/2)
        annotation (Placement(transformation(extent={{54,24},{44,34}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{4,-4},{-4,4}},
            rotation=90,
            origin={26,40})));
      Modelica.Blocks.Math.Gain gain2(k=2) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=270,
            origin={24,56})));
      Modelica.Blocks.Sources.Constant const(k=1)
        annotation (Placement(transformation(extent={{4,-4},{-4,4}},
            rotation=0,
            origin={40,50})));
    equation
      connect(Vdc1.n, Vdc2.p) annotation (Line(points={{-34,36},{-34,-44},{-34,
              -44}}, color={0,0,255}));
      connect(ground, Vdc2.p) annotation (Line(points={{20,-76},{-22,-76},{-22,
              0},{-34,0},{-34,-44}}, color={0,0,255}));
      connect(Q1gate, switch1.GateSignal) annotation (Line(points={{-61,21},{
              -36.5,21},{-36.5,21.2857},{-8.1125,21.2857}},
                                                    color={255,0,255}));
      connect(Q4gate, switch4.GateSignal) annotation (Line(points={{-61,-31},{
              -36.5,-31},{-36.5,-31.2857},{-7.9,-31.2857}},
                                                       color={255,0,255}));
      connect(Vdc1.p, switch1.pin) annotation (Line(points={{-34,56},{-34,64},{
              -4.85,64},{-4.85,31.4286}},
                           color={0,0,255}));
      connect(switch4.pin_n, Vdc2.n) annotation (Line(points={{-5.2,-39.4286},{
              -5.2,-64},{-34,-64}},
                          color={0,0,255}));
      connect(switch1.pin_n, signalVoltage.n)
        annotation (Line(points={{-4.85,12.5714},{-4.85,0},{28,0}},
                                                             color={0,0,255}));
      connect(switch4.pin, signalVoltage.n) annotation (Line(points={{-5.2,
              -20.5714},{-5.2,-12},{-6,-12},{-6,0},{28,0}},
                                         color={0,0,255}));
      connect(product2.y, signalVoltage.v) annotation (Line(points={{30,19.6},{
              30,14},{38,14},{38,7}}, color={0,0,127}));
      connect(const5.y, product2.u2) annotation (Line(points={{43.5,29},{42.85,
              29},{42.85,28.8},{32.4,28.8}}, color={0,0,127}));
      connect(DutyCycle, switch1.DutyCycle) annotation (Line(points={{24,80},{
              24,72},{14,72},{14,27.1429},{10,27.1429}}, color={0,0,127}));
      connect(switch4.DutyCycle, DutyCycle) annotation (Line(points={{10,
              -25.4286},{38,-25.4286},{38,-24},{66,-24},{66,56},{50,56},{50,68},
              {24,68},{24,80}}, color={0,0,127}));
      connect(current, switch4.current) annotation (Line(points={{83,-37},{48.5,
              -37},{48.5,-36.5714},{10,-36.5714}}, color={0,0,127}));
      connect(current, switch1.current) annotation (Line(points={{83,-37},{20,
              -37},{20,16},{18,16},{18,16.2857},{10,16.2857}}, color={0,0,127}));
      connect(signalVoltage.p, ac)
        annotation (Line(points={{48,0},{76,0}}, color={0,0,255}));
      connect(DutyCycle, gain2.u)
        annotation (Line(points={{24,80},{24,60.8}}, color={0,0,127}));
      connect(const.y, add.u2) annotation (Line(points={{35.6,50},{28.4,50},{
              28.4,44.8}}, color={0,0,127}));
      connect(gain2.y, add.u1) annotation (Line(points={{24,51.6},{24,48},{24,
              44.8},{23.6,44.8}}, color={0,0,127}));
      connect(add.y, product2.u1) annotation (Line(points={{26,35.6},{27.6,35.6},
              {27.6,28.8}}, color={0,0,127}));
      connect(ground, signalVoltage.n) annotation (Line(points={{20,-76},{32,-76},{32,
              -14},{-4,-14},{-4,0},{28,0}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-60,-80},
                {80,80}})),        Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-60,-80},{80,80}})));
    end HalfBridgeConverterModularAver;

  end Components;

  annotation (uses(Modelica(version="3.2.2")));
end HalfBridgeConverter;
