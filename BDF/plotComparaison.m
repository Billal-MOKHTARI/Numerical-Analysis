function plotComparaison(x1, y1, x2, y2, x_f, f, sub1, sub2, subPos, color1, color2, color3, tit, legend1, legend2, legend3, a, b)
  subplot(sub1, sub2, subPos);
  plot(x1, y1, color1, x2, y2, color2, x_f, f, color3);
  title(tit);
  h = legend(legend1, legend2, legend3);
  legend (h, "location", "northeastoutside");
  xlim([a, b]);
  ylim([min([y1 y2 f]) max(y1)]);


end
