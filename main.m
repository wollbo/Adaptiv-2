%% main ASP-2

[y,fs]=audioread('EQ2401Project2data2019.wav');


%%

% LMS
N = 512;
muu = 0.1;

[theta, xhat, delta] = LMS(y, N, muu);
% for i = 1:length(y)
%     [xhat, theta] = LMS(y,N,muu);
% end


 % temp

soundsc(xhat)
plot(theta)


%%

% RLS




%%

% Kalman