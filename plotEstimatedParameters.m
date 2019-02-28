function plotEstimatedParameters(y, thetalms, thetarls)
figure()
maxParamsToPlot = 10;

subplot(5,1,[1,2])
plot(thetalms(1:maxParamsToPlot,:).');
title('LMS Parameters')
grid on
box off

subplot(5,1,[3,4])
plot(thetarls(1:maxParamsToPlot,:).');
title('RLS Parameters')
grid on
box off

subplot(5,1,5)
plot(y);
axis off
end

