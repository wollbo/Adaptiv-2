%% main ASP-2
[y,fs]=audioread('EQ2401Project2data2019.wav');

%% LMS
N = 512; %J 128
delay = 20;
muu = 0.02; %J 0.02

[thetalms, xhatlms, delta] = LMS(y,N,muu,delay);

%% pre-LMS
N = 256; %J 128
delay = 40;
muu = 0.02; %J 0.02

[thetaplms, xhatplms, pdelta] = preprocessNLMS(y,N,muu,delay);

%% RLS
N = 128;
delay = 20;
lambda = 1 - 0.0001;
[thetarls,xhatrls, Pnorm]=RLS(y,N,lambda, delay);

%% Diagnostics

%plotNoteSpectrum(y, xhatlms, xhatrls, fs);
%plotFilteredSounds(y, xhatlms, xhatrls, fs);
%plotEstimatedParameters(thetalms, thetarls);
%plotFilterAni(y, thetaplms, fs);
% plotRLS(Pnorm);

% figure(1)
% plot(theta)
% figure(2)
% plot(delta(2*delay:end))
