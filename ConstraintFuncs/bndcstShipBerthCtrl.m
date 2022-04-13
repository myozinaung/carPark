function [c, ceq] = bndcstShipBerthCtrl(t0,x0,tF,xF,u)

% c = -u(2,1);
c = [];
ceq = abs(xF(8)); % stop propeller

end