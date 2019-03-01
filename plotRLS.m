function plotRLS(Pnorm)
figure('Position', [100, 100, 700, 650])
noteIdx = [5000, 12000, 20000];


semilogy(Pnorm);
hold on
grid on
box off
yl = ylim;
for i = 1:length(noteIdx)
    plot([noteIdx(i), noteIdx(i)], [yl(1), yl(2)], '--','Color',[.8 .1 .2 .7])
end

title('Frobenius Norm of P matrix from RLS')
end

