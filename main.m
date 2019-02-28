%% main ASP-2

[y,fs]=audioread('EQ2401Project2data2019.wav');


%% LMS
N = 128;
muu = 0.02;

[thetalms, xhatlms, delta] = LMS_j(y, N, muu);
soundsc(xhatlms)


%% RLS
N = 128;
lambda = 1 - 0.0005;
[thetarls,xhatrls, Pnorm]=RLS(y,N,lambda);
soundsc(xhatrls)

%% Diagnostics

%plotNoteSpectrum(y, xhatlms, xhatrls, fs);
%plotFilteredSounds(y, xhatlms, xhatrls, fs);
%plotEstimatedParameters(y, thetalms, thetarls);
plotRLS(y, Pnorm);