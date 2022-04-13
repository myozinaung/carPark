function obs = obstacles

%% %%%%%%% Obstacles for Collision Avoidance %%%%%%%%%%%%%%%%%%
obs = [];
%% Rectangles [x0, y0, a, b, psi]
% rect(1,:) = [-12, 15, 7.0, 20, 0];
% rect(1,:) = [700, -463, 1400, 500, deg2rad(-3)]; % for Bulker Kashima
% % rect(2,:) = [1500, 463, 3000, 500, deg2rad(-3)]; % for Bulker Kashima
% % rect(1,:) = [20, 0, 14, 19.2, 0];
% % rect(2,:) = [20, 20, 14, 19.2, 0];
% % rect(1,:) = [30, -1.9, 10, 3, 0]; % Exp pond 1
% % rect(2,:) = [30, 1.9, 10, 3, 0]; % Exp pond 2
% % rect(3,:) = [3, 15, 20, 10, pi/4];
% % rect(1,:) = [20, 5, 20, 9, 0];
% % rect(2,:) = [20, 15, 20, 4, 0];
% 
% obs.rect  = rect;
% 
%% Circles [x0, y0, rad]
circ(1,:) = [15, 0.5, 2.5];
% circ(1,:) = [1400, -500, 250]; % for Bulker Kashima
% % circ(2,:) = [17, 0, 3];
% % circ(3,:) = [17, 5, 3];
obs.circ  = circ;
% % 
%% Ellipses [x0, y0, a, b, psi, vel]
% elli(1,:) = [30, 12, 5, 3, pi/2, 0];
% elli(2,:) = [16, 6.5, 5, 1.5, 0, 0];
% obs.elli  = elli;
% 
%% Soft Rectangles [x0, y0, a, b, psi, vel]
% sRect(1,:) = [16, 10, 2, 0.5, 0, 0];
% sRect(2,:) = [24, 10, 2, 0.5, 0, 0];
% sRect(3,:) = [15, 0, 2, 1, pi/2, 0.255];
% obs.sRect  = sRect;


%% %%%%%%% Obstacles for Berthing %%%%%%%%%%%%%%%%%%
% obs = [];
%% Rectangles [x0, y0, a, b, psi]
% rect(1,:) = [12, 6, 4.5, 8.0, 0];
% rect(2,:) = [12, -6, 4.5, 8.0, 0];
% obs.rect  = rect;

% Circles [x0, y0, rad]
% circ(1,:) = [15, 0, 3];
% obs.circ  = circ;

%% Ellipses [x0, y0, a, b, psi, vel]
% elli(1,:) = [16, -4, 3, 1.5, pi/2, 0];
% elli(2,:) = [10, 5, 4, 2, pi/4 , 0.1];
% elli(3,:) = [10, 5, 2, 2, -pi/4 , 0.1];
% obs.elli  = elli;

%% Soft Rectangles [x0, y0, a, b, psi, vel]
% sRect(1,:) = [12, 2, 2, 1, 0, 0];
% sRect(2,:) = [15, -2.5, 1.5, 1, 0, 0];
% obs.sRect  = sRect;

%%%%%%%%% Obstacles for Berthing %%%%%%%%%%%%%%%%%%

end