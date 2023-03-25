model lab06
  constant Real alpha = 0.30;
  constant Real beta = 0.70;
  constant Integer N = 15089;
  constant Integer I_crit = 64;
  //constant Integer I_crit = 128;
  
  Real t = time;
  Real S(t);
  Real I(t);
  Real R(t);
initial equation
  I = 95;
  R = 45;
  S = N - I - R;
equation
  if I > I_crit then
    der(S) = - alpha * S;
    der(I) = alpha * S - beta * I;
  else
    der(S) = 0;
    der(I) = - beta * I; 
  end if;
  der(R) = beta * I;
  annotation(experiment(StartTime = 0, StopTime = 30, Interval = 0.05));
end lab06;
