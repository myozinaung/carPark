function drawBerth

X_LowBerth = [7.5+10, -7.5, -19.5, -22.5, -22.5, 7.5+10];
Y_LowBerth = [-0.35, -0.35, -12.35, -12.35, -20.35, -20.35];
LowBerth = polyshape(X_LowBerth,Y_LowBerth);
plot(LowBerth, 'LineStyle',"-",'LineWidth',1,'FaceColor',[0 0 0],'FaceAlpha',0.3,'DisplayName','LowBerth'); axis equal; hold on;

X_UppBerth = [7.5+10, -22.5, -22.5, -19.5, -10.5, 7.5+10];
Y_UppBerth = [13.8, 13.8, -3.2, -3.2, 5.8, 5.8];
UppBerth = polyshape(X_UppBerth,Y_UppBerth);
plot(UppBerth, 'LineStyle',"-",'LineWidth',1,'FaceColor',[0 0 0],'FaceAlpha',0.3,'DisplayName','UppBerth'); axis equal; hold on;