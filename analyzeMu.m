function mulim = analyzeMu(y,N)

% returns an approximation of the largest allowed mu
% while maintaining a stable (unnormalized) LMS

M = length(y);
Y = y(1:N);
mulim = 100;


for n = N:N:M-N
    for i = 1:N
        sigmaY(i) = Y*Y';
        Y(1:end-1) = Y(2:end);
        Y(end) = y(n+i+1);
    end
    sigmaY;
    sigmaY = mean(sigmaY);
    mu = 2/max(eig(sigmaY));
    if mu < mulim
        mulim = mu;
    end
    
end
