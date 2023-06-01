function [x_plot, y] = BDF3(y0, n, a, b, Fun)
  h = (b-a)/n;
  y = zeros(1, n);
  x = zeros(1, n);

  x_plot = [];
  y_c = [];
  # Initial conditions
  y(1) = y0;
  x(1) = a;
  i = 0;

  for j=a:h:b
    i += 1;
    x(i+1) = x(i) + h;
    x(i+2) = x(i+1) + h;
    x(i+3) = x(i+2) + h;
    # Forward BDF3
    y(i+1) = y(i)+ h*Fun(x(i+1), y(i));
    y(i+2) = y(i+1)+ h*Fun(x(i+2), y(i+1));
    y(i+3) = y(i+2)+ h*Fun(x(i+3), y(i+2));
    # Backward BDF3
    y(i+3) = (18/11)*y(i+2)-(9/11)*y(i+1)+(2/11)*y(i)+(6/11)*h*Fun(x(i+3), y(i+3));
    y_c = [y_c y(i+3)];
  endfor
  y = [y(1:3) y_c];
  x_plot = x;
end
