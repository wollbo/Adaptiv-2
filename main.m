%% main ASP-2

[y,fs]=audioread('EQ2401Project2data2019.wav');


%%

% LMS
N = 512;
delay = 50;
muu = 0.1;

mulim = analyzeMu(y,N) % varies with N
%%
[theta, xhat, delta] = LMS(y,N,muu,delay);

soundsc(xhat)

%%

figure(1)
plot(theta)
figure(2)
plot(delta(2*delay:end))


%%

% RLS




%%

% Kalman