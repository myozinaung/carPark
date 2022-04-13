function elli_traj = moveEllipse(t, ellis)
[No_elli,No_item] = size(ellis);
elli_traj =  zeros(No_elli, No_item, length(t));

for i = 1:length(t)
    
    for j = 1:No_elli
        elli = ellis(j,:);
        x0  = elli(1);
        y0  = elli(2);
        psi = elli(5);
        vel = elli(6);

        vx = vel * cos(psi);
        vy = vel * sin(psi);

        x0 = x0 + vx.*t(i);
        y0 = y0 + vy.*t(i);
        
        elli(1) = x0;
        elli(2) = y0;
        elli_traj(j,:,i) = elli;
    end
end