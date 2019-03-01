%% main ASP-2
[y,fs]=audioread('EQ2401Project2data2019.wav');


%% LMS
N = 128; %J 128
delay = 100;
muu = 0.1; %J 0.02

%mulim = analyzeMu(y,N); % varies with N
[thetalms, xhatlms, delta] = LMS(y,N,muu,delay);

soundsc(xhatlms)

%% RLS
N = 128;
lambda = 1 - 0.0001;
[thetarls,xhatrls, Pnorm]=RLS(y,N,lambda);
soundsc(xhatrls)


%% Diagnostics

% plotNoteSpectrum(y, xhatlms, xhatrls, fs);
% plotFilteredSounds(y, xhatlms, xhatrls, fs);
plotEstimatedParameters(thetalms, thetarls);
% plotRLS(Pnorm);

% figure(1)
% plot(theta)
% figure(2)
% plot(delta(2*delay:end))
