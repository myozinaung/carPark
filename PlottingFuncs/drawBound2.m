function drawBound2(bndXY,halfBreadth,A)
xmin = bndXY(1) - halfBreadth;
xmax = bndXY(2) + halfBreadth;

ymin = bndXY(3) - halfBreadth;
ymax = bndXY(4) + halfBreadth;

%% for xmin rectangle
x01 = xmin - A;
y01 = 0;
a1  = 2*A;
b1  = 20;

xminRect = [x01, y01, a1, b1, 0];

%% 




end