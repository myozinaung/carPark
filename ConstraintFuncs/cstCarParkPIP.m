function [c, ceq] = cstCarParkPIP(t,x,u,Bound)

xpos = x(1,:);
ypos = x(2,:);
theta  = x(4,:);

l_axes = 2.588;
l_front = 0.839;
l_rear = 0.657;
b_width = 1.771/2;

Ax = xpos + (l_axes+l_front).*cos(theta) - b_width.*sin(theta);
Ay = ypos + (l_axes+l_front).*sin(theta) + b_width.*cos(theta);

Bx = xpos + (l_axes+l_front).*cos(theta) + b_width.*sin(theta);
By = ypos + (l_axes+l_front).*sin(theta) - b_width.*cos(theta);

Cx = xpos - l_rear.*cos(theta) + b_width.*sin(theta);
Cy = ypos - l_rear.*sin(theta) - b_width.*cos(theta);

Dx = xpos - l_rear.*cos(theta) - b_width.*sin(theta);
Dy = ypos - l_rear.*sin(theta) + b_width.*cos(theta);

CornerX = [Ax; Bx; Cx; Dx];
CornerY = [Ay; By; Cy; Dy];

%% Inequility Constraint
c = [];

%% Equality constraint
ceq = [];

for i = 1:4
    cstPolygon = cstPIP(CornerX(i,:), CornerY(i,:), Bound);
    ceq = [ceq, cstPolygon];
end