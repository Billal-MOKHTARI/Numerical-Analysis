function s = errorFunc(y1, y2)
  n = min(length(y1), length(y2));
  s = 0;
  for i=1:n
    s += abs(y1(i)-y2(i));
  end
  s = s/n;
end
