function plotFilteredSounds (y, xhatlms, xhatrls, fs)
figure()

ax1 = subplot(3,1,1);
plot(y)
title('Original')
box off

ax2 = subplot(3,1,2);
plot(xhatlms)
title('LMS')
box off


ax3 = subplot(3,1,3);
plot(xhatrls)
title('RLS')
box off

linkaxes([ax1,ax2,ax3],'xy')

end

