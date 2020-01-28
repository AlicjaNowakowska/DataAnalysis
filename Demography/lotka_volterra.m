function dx = lotka_volterra(t, x)
  dx = [0; 0];
  alpha = 1; 
  beta = .05; 
  delta = .02;
  gamma = .5;

  dx(1) = alpha * x(1) - beta * x(1) * x(2);
  dx(2) = delta * x(1) * x(2) - gamma * x(2);
  options = odeset('RelTol', 1e-4, 'NonNegative', [1 2]);
  [t,x] = ode45('lotka_volterra', [0 20], [10 10], options);
  plot(t,x);
  legend('prey', 'predators');
