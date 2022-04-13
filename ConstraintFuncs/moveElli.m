function elliTS = moveElli(t,elli)

elliTS = zeros(size(elli,1),size(elli,2),length(t));

for i = 1:length(t)
    vx = elli(:,6).*cos(elli(:,5));
    vy = elli(:,6).*sin(elli(:,5));
    elliTS(:,1,i) = elli(:,1) + vx.*t(i);
    elliTS(:,2,i) = elli(:,2) + vy.*t(i);
    elliTS(:,3:6,i) = elli(:,3:6);
end

end