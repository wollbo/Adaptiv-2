function plotFilteredSounds (y, xhatlms, xhatplms, xhatrls)
figure()

ax1 = subplot(4,1,1);
plot(y)
title('Original')
box off

ax2 = subplot(4,1,2);
plot(xhatlms)
title('LMS')
box off

ax3 = subplot(4,1,3);
plot(xhatplms)
title('pLMS')
box off

ax4 = subplot(4,1,4);
plot(xhatrls)
title('RLS')
box off

linkaxes([ax1,ax2,ax3, ax4],'xy')

end

