function plotRLS(y, Pnorm)
figure('Position', [100, 100, 700, 650])

ax1 = subplot(2,1,1);
ax1.Position = ax1.Position + [0 0.15 0 -0.17];
plot(y);
axis off

ax2 = subplot(2,1,2);
ax2.Position = ax2.Position + [0 0 0 0.2];
semilogy(Pnorm);
grid on
box off


end

