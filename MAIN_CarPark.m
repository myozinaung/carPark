clc; clear;
addpath ../../ % to include the OptimTraj files
addpath ConstraintFuncs\
addpath PlottingFuncs\
addpath ObjectiveFuncs\
addpath DynamicsFuncs\

%%
% BoundX = [-100, 100, 100, -100];
% BoundY = [-100, -100, 100, 100];
% Bound = [BoundX', BoundY'];

b_width = 1.771/2;
radInflate = b_width + 0.15;
obs_ori = obstaclesCarPark;
p.obs   = inflateObs(obs_ori,radInflate);
p.bndXY = [-inf, inf, -inf, inf]; % [xmin,xmax, ymin, ymax];

xposF = 16;
yposF = 6;
thetaF = 90; % deg


%%  STATE, COST(path and bnd), CONSTRAINTS(path and bnd) Functions

% Plant Dynamics
problem.func.dynamics = @(t,x,u)( plantMat(t,x,u,p) );

% Path and Boundry Objectives
problem.func.bndObj   = @(t0,x0,tF,xF)( 1*(tF - t0) ); % Minumum Time

% Path and Boundry Constraints
problem.func.pathCst  = @(t,x,u)( cstCarPark(t,x,u,p) );

%% BOUNDs
v_max = 2;
v_min = -v_max;

acc_max = 0.75;
acc_min = -acc_max;

jark_max = 0.5; % acc rate
jark_min = -jark_max;

phi_max = deg2rad(33); % steering angle
phi_min = -phi_max;

phiRate_max = deg2rad(60); % steering rate
phiRate_min = -phiRate_max;

% Time Bounds
problem.bounds.initialTime.low = 0;
problem.bounds.initialTime.upp = 0;
problem.bounds.finalTime.low   = 0.01;
problem.bounds.finalTime.upp   = inf;

% Initial State [xpos, ypos, v, theta, acc, phi]
problem.bounds.initialState.low = [0; 0; 0; 0; 0; 0];
problem.bounds.initialState.upp = problem.bounds.initialState.low;

% Final State [xpos, ypos, v, theta, acc, phi]
problem.bounds.finalState.low   = [xposF; yposF; 0; deg2rad(thetaF); 0; phi_min] - [0.1; 0.1; 0.01; deg2rad(0.5); 0.01; deg2rad(0.5)];
problem.bounds.finalState.upp   = [xposF; yposF; 0; deg2rad(thetaF); 0; phi_max] + [0.1; 0.1; 0.01; deg2rad(0.5); 0.01; deg2rad(0.5)];

% Path State Bounds [xpos, ypos, v, theta, acc, phi]
problem.bounds.state.low = [-inf; -inf; v_min; -inf; acc_min; phi_min];
problem.bounds.state.upp = [ inf;  inf; v_max;  inf; acc_max; phi_max];

% Path Control Bounds [jerk, phiRate]
problem.bounds.control.low = [jark_min; phiRate_min];
problem.bounds.control.upp = [jark_max; phiRate_max];

%% GUESSes
problem.guess.time    = [0, 10]; % [t_initial, t_final]
problem.guess.state   = [problem.bounds.initialState.low, problem.bounds.finalState.low];
problem.guess.control = [0,0; 0,0];

%% SOLVER OPTIONs
%%% Remember 1st Calculation may not use bndCst and pathCst (check "optimTraj")
% grid_no = [40, 40];
% method  = [1,1,1,2,2,2];  % 1 = Trapezoidal, 2 = HermiteSimpson, 3 = Chebyshev, 4 = Euler, 5 = rungeKutta

grid_no = [20];
method  = [1,1,1,2,2,2];

for i = 1:length(grid_no)
    problem.options(i).nlpOpt = optimset(...
    'Display','iter',...
    'MaxIter',1000,...
    'TolFun',1e-6,... % Optimality Tol
    'TolX',1e-6,...   % Step Tol
    'TolCon',1e-6,...
    'MaxFunEvals',2e6,...
    'Algorithm','sqp',... % sqp interior-point % sqp >> sometime bad results, but less iteration and faster
    'MaxTime',600);

    switch method(i)
        case 1
        problem.options(i).method = 'trapezoid';
        problem.options(i).trapezoid.nGrid = grid_no(i);

        case 2    
        problem.options(i).method = 'hermiteSimpson';
        problem.options(i).hermiteSimpson.nSegment = grid_no(i);

        case 3
        problem.options(i).method = 'chebyshev';
        problem.options(i).chebyshev.nColPts = grid_no(i);

        case 4
        problem.options(i).method = 'euler';
        problem.options(i).euler.nSegment = grid_no(i);
        problem.options(i).euler.nSubStep = 20;

        case 5
        problem.options(i).method = 'rungeKutta';
        problem.options(i).rungeKutta.nSegment = grid_no(i);
        problem.options(i).rungeKutta.nSubStep = 5;
    end
end

%% SOLVE
tic;
soln = optimTraj(problem); % Initial Solution with Mesh Refinement
toc

%% Get Solution for PLOTTING
% Interpolated Solution
t = linspace(soln(end).grid.time(1), soln(end).grid.time(end), 60);
z = soln(end).interp.state(t);
u = soln(end).interp.control(t);

% Grid Point Solution
tG = soln(end).grid.time;
zG = soln(end).grid.state;
uG = soln(end).grid.control;

% t = tG;
% z = zG;
% u = uG;

% Extract States
xpos    = z(1,:);
ypos    = z(2,:);
v       = z(3,:);
theta   = z(4,:);

% Extract Controls
acc = z(5,:);
phi = z(6,:);

% Extract Control Rate
accRate = u(1,:);
phiRate = u(2,:);

%% Timeseries PLOTs
% % State Timeseries Plots
figure;
subplot(4,1,1)
plot(t,xpos); grid on;
subplot(4,1,2)
plot(t,ypos); grid on;
subplot(4,1,3)
plot(t,v); grid on;
subplot(4,1,4)
plot(t,rad2deg(theta)); grid on;

% % Control Timeseries Plots
figure;
subplot(2,1,1)
plot(t,acc); grid on;
subplot(2,1,2)
plot(t,rad2deg(phi)); grid on;
% 
% % Control Rate Timeseries Plots
% figure;
% subplot(2,1,1)
% plot(t,accRate); grid on;
% subplot(2,1,2)
% plot(t,rad2deg(phiRate)); grid on;

% Curvature Timeseries Plot
% l_axes = 2.588;
% curvature = abs(phiRate./(l_axes.*(cos(phi)).^2));
% figure;
% plot(t,curvature); grid on;


%% X-Y Plot
% figure;
% plot(xpos,ypos); grid on; axis equal;

% figure;
% plotCar(t,xpos,ypos,rad2deg(theta),length(t),"blue",0.02,"red",1);

figure;
drawCircle(obs_ori.circ); hold on;
drawCircle(p.obs.circ); hold on;
plotCar2(t,xpos,ypos,theta,length(t)); hold off;
