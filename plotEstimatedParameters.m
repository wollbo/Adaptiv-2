function plotEstimatedParameters(thetalms, thetarls)
figure()
maxParamsToPlot = 10;
noteIdx = [5000, 12000, 20000];

subplot(2,1,1)
plot(thetalms(:,1:maxParamsToPlot));
title('LMS Parameters')
grid on
box off
hold on
yl =  ylim;
for i = 1:length(noteIdx)
    plot([noteIdx(i), noteIdx(i)], [yl(1), yl(2)], '--','Color',[.8 .1 .2 .7])
end
hold off

subplot(2,1,2)
plot(thetarls(1:maxParamsToPlot,:).');
title('RLS Parameters')
grid on
box off
hold on
yl = ylim;
for i = 1:length(noteIdx)
    plot([noteIdx(i), noteIdx(i)], [yl(1), yl(2)], '--','Color',[.8 .1 .2 .7])
end

hold off
end

