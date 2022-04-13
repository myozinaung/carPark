function dxdt = stateFunc(t,x,u,p)
l_axes = 2.588;

%% Extract Variables
v       = x(3); % speed
theta   = x(4); % car orientation angle

a       = u(1); % accelerator
phi     = u(2); % steering angle

%% ODEs
xpos_dot    = v*cos(theta);
ypos_dot    = v*sin(theta);
v_dot       = a;
theta_dot   = (v*tan(phi))/l_axes;

%%
dxdt = x; % to initilize the size of dxdt with x
dxdt(1) = xpos_dot;
dxdt(2) = ypos_dot;
dxdt(3) = v_dot;
dxdt(4) = theta_dot;
