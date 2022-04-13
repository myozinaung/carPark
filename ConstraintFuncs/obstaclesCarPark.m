function obs = obstaclesCarPark

obs = [];

%% EXAMPLE/TEMPLATE %%
%%% Circles %%%
% circ(1,:) = [x0, y0, radius];
% obs.circ  = circ;

%%% Rectangles %%%
% rect(1,:) = [x0, y0, a, b, psi];
% rect(2,:) = [x0, y0, a, b, psi];
% obs.rect  = rect;

%%% Ellipses %%%
% elli(1,:) = [x0, y0, a, b, psi, velocity];
% obs.elli  = elli;

%%% Soft Rectangles %%%
% sRect(1,:) = [x0, y0, a, b, psi, velocity];
% obs.sRect  = sRect;

%% Scenario 1 %%
%%% Circles %%%
circ(1,:) = [10, 4, 4];
obs.circ  = circ;

%% Scenario 2 %%