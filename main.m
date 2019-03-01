%% main ASP-2
[y,fs]=audioread('EQ2401Project2data2019.wav');

%% LMS
N = 128;
delay = 40;
muu = 0.02;

[thetalms, xhatlms, delta] = LMS(y,N,muu,delay);

%% pre-LMS
N = 128;
delay = 40;
muu = 0.5;

[thetaplms, xhatplms] = preprocessNLMS(y,N,muu,delay);

%% RLS
N = 128;
delay = 40;
lambda = 1 - 0.00001;
[thetarls, xhatrls, Pnorm]=RLS(y,N,lambda, delay);

%% Filter Animations
plotFilterAni(y, thetalms, fs);
plotFilterAni(y, thetaplms, fs);
plotFilterAni(y, thetarls, fs);

%% Diagnostics
% Plots spectrum of the filtered signals during the middle of each note
plotNoteSpectrum(y, xhatlms, xhatplms, xhatrls, fs);

% Shows the filtered signals in the time domain
plotFilteredSounds(y, xhatlms, xhatplms, xhatrls);

% Shows a few of the estimated parameters over time
plotEstimatedParameters(thetalms, thetaplms, thetarls);

%% Listening
audiolen = length(y) / fs;
wait = 0.4;

soundsc(y);
pause(audiolen + wait);
soundsc(xhatlms);
pause(audiolen + wait);
soundsc(xhatplms);
pause(audiolen + wait);
soundsc(xhatrls);
pause(audiolen + wait);

%% Extra Plots
plotRLS(Pnorm);

