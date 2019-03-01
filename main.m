%% main ASP-2
[y,fs]=audioread('EQ2401Project2data2019.wav');

H = [0.000450512197862359 0.00153912705777974 0.00348497385302193 0.00599355718918530 0.00815343557605641 0.00859295274071084 0.00606548279898037 0.000284675521385878 -0.00742297904630504 -0.0141538572037984 -0.0164274088286248 -0.0119240768534546 -0.00119316487527940 0.0116848156034187 0.0202132060951871 0.0182984233594518 0.00371824537758764 -0.0194511274008931 -0.0409901694894724 -0.0477953197077677 -0.0292744267612075 0.0173348835091749 0.0842451800303790 0.154606017278228 0.208004389555267 0.227913624795602 0.208004389555267 0.154606017278228 0.0842451800303790 0.0173348835091749 -0.0292744267612075 -0.0477953197077677 -0.0409901694894724 -0.0194511274008931 0.00371824537758764 0.0182984233594518 0.0202132060951871 0.0116848156034187 -0.00119316487527940 -0.0119240768534546 -0.0164274088286248 -0.0141538572037984 -0.00742297904630504 0.000284675521385878 0.00606548279898037 0.00859295274071084 0.00815343557605641 0.00599355718918530 0.00348497385302193 0.00153912705777974 0.000450512197862359];

%% LMS
N = 512; %J 128
delay = 20;
muu = 0.02; %J 0.02

%mulim = analyzeMu(y,N); % varies with N
[thetalms, xhatlms, delta] = LMS(y,N,muu,delay);

soundsc(xhatlms);

%% pre-LMS
N = 256; %J 128
delay = 40;
muu = 0.02; %J 0.02

%mulim = analyzeMu(y,N); % varies with N
[thetaplms, xhatplms, pdelta] = preprocessLMS(y,N,muu,delay,H);

%mulim = analyzeMu(y,N); % varies with N
%[thetaplms, xhatplms, pdelta] = preprocessLMS(y,N,muu,delay,H);

soundsc(xhatplms)
[thetaplms, xhatplms, pdelta] = preprocessLMSrev(xhatplms,16, 4e-7,1);
pause(3.8)
soundsc(xhatplms)

%% RLS
N = 128;
delay = 20;
lambda = 1 - 0.0001;
[thetarls,xhatrls, Pnorm]=RLS(y,N,lambda, delay);
soundsc(xhatrls)


%% Diagnostics

% plotNoteSpectrum(y, xhatlms, xhatrls, fs);
% plotFilteredSounds(y, xhatlms, xhatrls, fs);
%plotEstimatedParameters(thetalms, thetarls);
plotFilterAni(y, thetaplms, fs);
% plotRLS(Pnorm);

% figure(1)
% plot(theta)
% figure(2)
% plot(delta(2*delay:end))
