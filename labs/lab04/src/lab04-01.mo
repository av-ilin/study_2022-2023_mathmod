model lab04_01
    Real x(t);
    Real y(t);
    constant Real w = 3.3; 
    Real t = time;
initial equation
    x = 1.3;
    y = 0.3;
equation
    der(x) = y;
    der(y) = - w * x;
    annotation(experiment(StartTime=0.3, StopTime=33, Interval = 0.05));
end lab04_01;
