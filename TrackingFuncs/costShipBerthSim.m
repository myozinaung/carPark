function cost = costShipBerthSim(t,x,u,x_ref,u_ref, Q_weights, R_weights)
cost = zeros(size(t));
cost_xTrack = zeros(size(t));
cost_uTrack = zeros(size(t));

for i = 1:size(t)
    x_error = x_ref(:,i) - x(:,i);
    cost_xTrack(i) = x_error'*Q_weights*x_error;
    
    u_error = u_ref(:,i) - u(:,i);
    cost_uTrack(i) = u_error'*R_weights*u_error;
end

% this cost should be balanced with the t_F cost using weights
cost = cost + cost_xTrack + cost_uTrack; % Tracking only here, min time is difined in "bndCost"
end
