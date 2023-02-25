model Battle01
    Real x;
    Real y;
    Real a = 0.312;
    Real b = 0.456;
    Real c = 0.256;
    Real h = 0.340;
    Real t = time;
initial equation
    x = 44200;
    y = 54200;
equation
    der(x) = -a * x - b * y  + sin(t + 3);
    der(y) = -c * x - h * y  + cos(t + 7);
end Battle01;