function [c, ceq] = cstCurvatureRate(t,x,u,p)

l_axes = 2.588;

phi = x(6,:);
phiRate = u(2,:);

%%
c = [];
curvatureRate_cst = abs(phiRate./(l_axes.*(cos(phi)).^2)) - 0.6;

c = [c, curvatureRate_cst];

%%
ceq = [];