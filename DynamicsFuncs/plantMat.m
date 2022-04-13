%% State Matrix => State Vector at all discretization points
function dxdtMat = plantMat(t,x,u,p)

N = length(t); % discretization point
dxdtMat = x; % to initialize the size of Matrix

for i = 1:N
    dxdt = stateFunc(t,x(1:4,i),x(5:6,i),p);
    dxdtMat(1:4,i) = dxdt;
end

dxdtMat(5,:) = u(1,:);
dxdtMat(6,:) = u(2,:);