function pL = plotCar2(t,xpos,ypos,theta,no_car)

T   = linspace(t(1), t(end), no_car);
xpos   = interp1(t, xpos, T);
ypos   = interp1(t, ypos, T);
theta   = interp1(t, theta, T);

%%
plot(xpos,ypos,'ko-'); 
xlabel('Position x [m]');
ylabel('Position y [m]');
hold on;
axis equal; grid on;

%% 
l_axes = 2.588; % Total length = 4.084 m
l_front = 0.839;
l_rear = 0.657;
b_width = 1.771/2;

Ax = xpos + (l_axes+l_front).*cos(theta) - b_width.*sin(theta);
Ay = ypos + (l_axes+l_front).*sin(theta) + b_width.*cos(theta);

Bx = xpos + (l_axes+l_front).*cos(theta) + b_width.*sin(theta);
By = ypos + (l_axes+l_front).*sin(theta) - b_width.*cos(theta);

Cx = xpos - l_rear.*cos(theta) + b_width.*sin(theta);
Cy = ypos - l_rear.*sin(theta) - b_width.*cos(theta);

Dx = xpos - l_rear.*cos(theta) - b_width.*sin(theta);
Dy = ypos - l_rear.*sin(theta) + b_width.*cos(theta);


for i = 1:length(T)
    
    if (i == 1) || (i == length(T))
        plot([Ax(i) Bx(i) Cx(i) Dx(i) Ax(i)], [Ay(i) By(i) Cy(i) Dy(i) Ay(i)], 'g-',"LineWidth",2);
    else
        plot([Ax(i) Bx(i) Cx(i) Dx(i) Ax(i)], [Ay(i) By(i) Cy(i) Dy(i) Ay(i)], 'b-');
    end
    axis equal
    pause(0.05);
    

end

hold off; axis equal;

end
