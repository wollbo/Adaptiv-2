%% main ASP-2
[y,fs]=audioread('EQ2401Project2data2019.wav');

%% LMS
N = 512; %J 128
delay = 50;
muu = 0.1; %J 0.02

mulim = analyzeMu(y,N); % varies with N
[theta, xhat, delta] = LMS(y,N,muu,delay);

soundsc(xhat)

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

figure(1)
plot(theta)
figure(2)
plot(delta(2*delay:end))
