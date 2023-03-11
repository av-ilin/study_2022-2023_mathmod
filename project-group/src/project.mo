model project
  constant Real pi = 2 * Modelica.Math.asin(1.0);
  constant Integer N = 50;
  constant Integer m = 1;
  constant Integer k = 1;
  constant Integer d = 1;
  constant Integer A = 0;
  constant Integer B = 1;
  constant Integer l = 3;
  constant Real p_l = (l * pi)/((N + 1) * d);
  constant Real omega_0 = sqrt(k/m);
  constant Real omega_l = 2 * omega_0 * sin((l * pi)/(2 * (N + 1)));
  constant Real t = 0.0;
  Real x;
  Real y;
equation
  der(x) = 1;
  y = (A * cos(p_l * x) + B * sin(p_l * x)) * cos(omega_l * t);
  annotation(experiment(StartTime=0, StopTime=51, Interval = 0.1));
end project;
