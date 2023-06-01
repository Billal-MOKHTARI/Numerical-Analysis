function plotPersonalized(x_y, y, x_f, f, sub1, sub2, subPos, color1, color2, tit, legend1, legend2)
  subplot(sub1, sub2, subPos);
  plot(x_y, y, color1, x_f, f, color2);
  title(tit);
  h = legend(legend1, legend2);
  legend (h, "location", "northeastoutside");
  xlim([min([x_y x_f]) max([x_y x_f])]);
  ylim([min([y f]) max([y f])]);
end
