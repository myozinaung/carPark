function drawEllipse(elli, color, alpha)
[elliNo,~] = size(elli);

for i = 1:elliNo
    
    x0   = elli(i,1);
    y0   = elli(i,2);
    a    = elli(i,3);
    b    = elli(i,4);
    psi  = elli(i,5);

    th = 0:pi/50:2*pi-pi/50;
    Rot = [cos(psi) -sin(psi); sin(psi) cos(psi)];
    X = a*cos(th);
    Y = b*sin(th);
    
    ElliR = Rot*[X; Y];
    
    Elli = polyshape(ElliR(1,:)+x0,ElliR(2,:)+y0);
    plot(Elli,'LineStyle',"--",'LineWidth',0.5,'FaceColor',color,'FaceAlpha',alpha,'EdgeColor',color, 'DisplayName','Eiilpse');
    hold on;

end

end