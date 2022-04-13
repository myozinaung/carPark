%% Original cstShipBerth + constranint on du/dt
function [c, ceq] = cstShipBerthSim(t,x,u,p)

[c, ceq] = cstShipBerth(t,x,u,p);

c_uRate = ((x(7:8,1)-p.uLast)./p.dt).^2 - p.uRate.^2; % limit on deltaRate and rpsRate during Sim

c = [c, c_uRate'];

% c = c_uRate;
% ceq = [];

end