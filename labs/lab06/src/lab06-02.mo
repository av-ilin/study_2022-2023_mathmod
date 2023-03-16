model lab06_02
  constant Real alpha = 0.01;
  constant Real beta = 0.02;
  constant Integer N = 15089;
  Real t = time;
  Real S(t);
  Real I(t);
  Real R(t);
initial equation
  I = 95;
  R = 45;
  S = N - I - R;
equation
  der(S) = - alpha * S;
  der(I) = alpha * S - beta * I;
  der(R) = beta * I;
  annotation(experiment(StartTime = 0, StopTime = 30, Interval = 0.05));
end lab06_02;
