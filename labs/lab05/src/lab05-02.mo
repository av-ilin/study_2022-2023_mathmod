model lab05_02
    constant Real a = 0.81;
	constant Real b = 0.048;
	constant Real c = 0.76;
	constant Real d = 0.038;
    Real x;
    Real y;
    Real t = time;
initial equation
    x = c / d;
    y = a / b;
equation
  der(x) = -a * x + b * x * y;
  der(y) = c * x - d * x * y;
  annotation(experiment(StartTime = 0, StopTime = 33, Interval = 0.05));
end lab05_02;
