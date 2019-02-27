%% main ASP-2

[y,fs]=audioread('EQ2401Project2data2019.wav');


%%

% LMS
N = 128;
muu = 0.00001;

[theta, xhat, delta] = LMS(y, N, muu);
% for i = 1:length(y)
%     [xhat, theta] = LMS(y,N,muu);
% end


 % temp

soundsc(xhat)


%%

% RLS




%%

% Kalman