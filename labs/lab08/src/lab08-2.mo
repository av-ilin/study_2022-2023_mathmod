model lab08_2
  constant Real M1_0 = 6.8 * 1e6;
  constant Real M2_0 = 6 * 1e6;

  constant Integer p_crit = 35 * integer(1e3);
  constant Integer N = 31 * integer(1e3);
  constant Integer q = 1;
  constant Real p1 = 11.5 * integer(1e3);
  constant Integer tau1 = 18;
  constant Real p2 = 8.7 * integer(1e3);
  constant Integer tau2 = 23;

  constant Real a1 = p_crit / (tau1 ^ 2 * p1^2 * N * q);
  constant Real a2 = p_crit / (tau2 ^ 2 * p2^2 * N * q);
  constant Real b = p_crit / (tau1 ^ 2 * p1^2 * tau2 ^ 2 * p2^2 * N * q);
  constant Real c1 = (p_crit - p1) / (tau1 * p1);
  constant Real c2 = (p_crit - p2) / (tau2 * p2);

  Real t = time / c1;
  Real M1(t);
  Real M2(t);
initial equation
    M1 = M1_0;
    M2 = M2_0;
equation
  der(M1) = M1 - (b / c1 + 0.00067) * M1 * M2 - a1 / c1 * M1 ^ 2;
  der(M2) = c2 / c1 * M2 - (b / c1) * M1 * M2 - a2 / c1 * M2 ^ 2;
  annotation(experiment(StartTime = 0, StopTime = 15, Interval = 0.01));
end lab08_2;
