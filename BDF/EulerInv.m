function [x_plot y] = EulerInv(y0, n, a, b, Fun)
  h = (b-a)/n;
  y = zeros(1, n);
  x = zeros(1, n);
  y_final = [];
  x_plot = [];
  # Initial conditions
  y(1) = y0;
  x(1) = a;
  i = 0;

  for j=a:h:b
    i += 1;
    x(i+1) = x(i) + h;
    # Forward Euler Method
    y(i+1) = y(i)+ h*Fun(x(i+1), y(i));
    # Backward Euler Method
    y(i+1) = y(i) + h*Fun(x(i+1), y(i+1));
    y_final = [y_final y(i+1)];
  endfor
  y = [y(1) y_final];
  x_plot = x;
end
