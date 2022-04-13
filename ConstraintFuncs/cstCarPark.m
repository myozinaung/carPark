function [c, ceq] = cstCarPark(t,x,u,p)
xpos0 = x(1,:);
ypos0 = x(2,:);
psiS0 = x(4,:); % theta

%% Inequality Constraints
c = [];

%% Obstacles
if isfield(p.obs,'rect')
    rect = p.obs.rect;
    [rectNo,~] = size(rect);
end

if isfield(p.obs,'circ')
    circ = p.obs.circ;
    [circNo,~] = size(circ);
end

if isfield(p.obs,'elli')
    elli = p.obs.elli;
    [elliNo,~] = size(elli);
end

if isfield(p.obs,'sRect')
    sRect = p.obs.sRect;
    [sRectNo,~] = size(sRect);
end

if isfield(p.obs,'rect') || isfield(p.obs,'circ') || isfield(p.obs,'elli') || isfield(p.obs,'sRect')
    % 4 points for 4 series of circles for Ego Car
    point = (-1.5:1:1.5) + 1.3850; % (l_rear + l_axes + l_front)/2 - l_rear = 1.3850
    for i = 1:length(point)
        xposP = xpos0 + point(i).*cos(psiS0);
        yposP = ypos0 + point(i).*sin(psiS0);

        if isfield(p.obs,'rect')
            for ir = 1:rectNo
                rectCst = cstRectangle(xposP,yposP,rect(ir,:));
                c = [c, rectCst];
            end
        end

        if isfield(p.obs,'circ')
            for ic = 1:circNo
                circCst = cstCircle(xposP,yposP,circ(ic,:));
                c = [c, circCst];
            end
        end
        
        if isfield(p.obs,'elli')
            for ie = 1:elliNo
                elliCst = cstEllipse(xposP,yposP,elli(ie,:),t);
                c = [c, elliCst];
            end
        end
        
        if isfield(p.obs,'sRect')
            for is = 1:sRectNo
                sRectCst = cstSoftRect(xposP,yposP,sRect(is,:),t);
                c = [c, sRectCst];
            end
        end        
        
    end
end

%% For XY Bounds % if XY Bound are inf/-inf this will result fmincon error
% xposB = xpos0 + 1.5*cos(psiS0); % Bow
% % yposB = ypos0 + 1.25*sin(psiS0);
% 
% xposS = xpos0 - 1.5*cos(psiS0); % Stern
% % yposS = ypos0 - 1.25*sin(psiS0);
% % 
% % % For Bound Constraints (e.g. Berth), only bow point and stern points are needed
% xMinB = -(xposB - p.bndXY(1));
% xMinS = -(xposS - p.bndXY(1));
% c = [c, xMinB, xMinS];
% % 

% xMaxB =  xposB - p.bndXY(2);
% xMaxS =  xposS - p.bndXY(2);
% c = [c, xMaxB, xMaxS];
% 
% % yMinB = -(yposB - p.bndXY(3));
% % yMinS = -(yposS - p.bndXY(3));
% % c = [c, yMinB, yMinS];
% 
% % yMaxB = yposB - p.bndXY(4);
% % yMaxS = yposS - p.bndXY(4);
% % c = [c, yMaxB, yMaxS];

%% For control rate limits 
% jerkRateBound = 0.5; % deg/s
% phiRateRateBound   = deg2rad(10); % deg/s^2
% 
% cstJerkR = abs((u(1,2:end) - u(1,1:end-1))./(t(2:end) - t(1:end-1))) - jerkRateBound;
% cstPhiRateR   = abs((u(2,2:end) - u(2,1:end-1))./(t(2:end) - t(1:end-1))) - phiRateRateBound;
% c = [c, cstJerkR, cstPhiRateR];


%% Equality Constraits
ceq = [];


end