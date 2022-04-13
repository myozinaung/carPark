function [c, ceq] = bndcstShipBerth(t0,x0,tF,xF,u)

% c = -u(2,1);
c = [];
ceq = [];

%% rudderRate at IC, to match CA end with Berth start
% rudderRateIC = u(1,1) - 0.0170;
% ceq = [ceq, rudderRateIC];

% rudderRateFC = u(1,end) - (-0.5236);
% ceq = [ceq, rudderRateFC];

%% stop propeller
% stopProp = abs(u(2,end)); % stop propeller
% ceq = [ceq, stopProp];

%% zeroRudderRateFC
% zeroRudderRateFC = abs(u(1,end));
% ceq = [ceq, zeroRudderRateFC];

zeroRudderRateIC = abs(u(1,1));
ceq = [ceq, zeroRudderRateIC];
end