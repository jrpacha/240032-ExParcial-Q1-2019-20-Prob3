clearvars
close all

t=0:0.01:10;
rng(1234); %constant seed to simulate always the same points
price = 1.5+sin(0.5*t)-0.25*sin(3*t)+0.2*rand(1,length(t));

numTicks = length(t);

sp = spline(t(1:50:end),price(1:50:end),t);

plot(t,price,'-m')
ax=gca;
ax.FontSize=6;
xticks([0:10])
yticks([0:0.5:3])
box off
hold on
axis equal
axis([0,10,0,3])
grid on
plot(t,sp,'k-','lineWidth',1.5)
legend('price','spline')
%saveas(gca,'figure.pdf');
hold off

maxPrice = max(price);
maxSpline = max(sp);
minPrice = min(price);
minSpline = min(sp);

fprintf('\nPART (a)\n')
fprintf('%22s%15s\n','minimum','maximum')
fprintf('%10s%14.4e%14.4e\n','price',minPrice,maxPrice)
fprintf('%10s%14.4e%14.4e\n\n','spline',minSpline,maxSpline)
fprintf('* Hint1: when taken every other 40 time ticks,\n')
fprintf('  the maximum falue for the spline is %.4e\n',...
    max(spline(t(1:40:end),price(1:40:end),t)))

fprintf('\nPART (b)\n')
idx = find(price < 1.3);
fprintf('%19s%12.4e\n','time for price',t(idx(1)))
idx = find(sp < 1.3);
fprintf('%19s%12.4e\n\n','time for spline',t(idx(1)))

%Hint2
sp = spline(t(1:40:end),price(1:40:end),t);
idx = find(sp < 1.3);

fprintf('* Hint2: when taken every other 40 time tricks,\n')
fprintf('  the time for the spline to reach the 1.3 level\n')
fprintf('  is %.4e\n',t(idx(1)))