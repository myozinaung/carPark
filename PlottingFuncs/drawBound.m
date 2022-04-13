function drawBound(bndXY,radInfl,A)

xmin = bndXY(1) - radInfl;
xmax = bndXY(2) + radInfl;

ymin = bndXY(3) - radInfl;
ymax = bndXY(4) + radInfl;

X1 = [xmin xmin xmax xmax xmin];
Y1 = [ymin ymax ymax ymin ymin];

X2 = [xmin-A xmin-A xmax+A xmax+A xmin-A];
Y2 = [ymin-A ymax+A ymax+A ymin-A ymin-A];

Bound = polyshape({X1,X2},{Y1,Y2});

plot(Bound,'LineStyle',"-",'LineWidth',1,'FaceColor',[0.5 0 0],'FaceAlpha',0.3,'DisplayName','Bound');

end