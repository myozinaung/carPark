function ceq = cstPIP(xpos, ypos, Bound)
% Check qp[x,y] is inside the Polygon defined by Bound
% Bound = [no. of vetices x 2]
% qp    = [1 x 2] % query point

boundX = Bound(:,1);
boundY = Bound(:,2);
noEdge = length(boundX);

theta = zeros(1,length(xpos));

for i = 1 : noEdge
    k = i + 1;
    if i == noEdge
        k = 1; % last edge, reset to 1
    end
    dx1 = boundX(i) - xpos;
    dy1 = boundY(i) - ypos;    

    dx2 = boundX(k) - xpos;
    dy2 = boundY(k) - ypos;

    theta1 = atan2( dy1, dx1 );
    theta2 = atan2( dy2, dx2 );
   
    dTheta = theta1 - theta2;  % th1 relative to th2

    dTheta = rem(dTheta+sign(dTheta)*pi,2*pi)- sign(dTheta)*pi; %Rewrite within +/-pi
    
    theta = theta + dTheta;

end

ceq =  2*pi - abs(theta); % zero if inside, 2pi if outside
% Not continuous function, only two values: zero or 2pi
% for gradient-based NLP solver, need/better to have a continuous smooth function that
% varies with how far the point is near to polygon area so that the solver
% can know where to find in next step to satisfy the constraint