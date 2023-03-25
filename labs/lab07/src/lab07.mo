model lab07
  constant Integer N = 1670;
  Real t = time;

  Real n1(t);
  constant Real alpha1_1 = 0.133;
  constant Real alpha1_2 = 0.000033;

  Real n2(t);
  constant Real alpha2_1 = 0.8;
  constant Real alpha2_2 = 0.15;

  Real n3(t);
  constant Real alpha3_1 = 0.133;
  constant Real alpha3_2 = 0.000033;

initial equation
  n1 = 12;
  n2 = 12;
  n3 = 12;

equation
  der(n1) = (alpha1_1 + alpha1_2 * n1) * (N - n1);
  der(n2) = (alpha2_1 + alpha2_2 * n2) * (N - n2);
  der(n3) = (alpha3_1 * t + alpha3_2 * sin(t) * n3) * (N - n3);
  annotation(experiment(StartTime=0, StopTime=0.1, Interval = 0.001));
end lab07;
