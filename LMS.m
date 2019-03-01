function [thetahat,xhat,delta]=LMS(y,N,muu,d)
% Estimate of x
% Predict yhat and subtract from y --> yields 'x'

M = length(y);

Y = zeros(M,N);
xhat = zeros(M,1);
thetahat = zeros(M,N);
delta = zeros(M,1);
yhat = zeros(M,1);

for n=1:M-1
	% Generate Y. Set elements of Y  that does not exist to zero
    if n > d
        Y(n+1,1:N-1) = Y(n,2:N);
        Y(n+1,N) = y(n-d); 
    end
    
    yhat(n) = thetahat(n,:)*Y(n,:)';
    delta(n) = eigenAnalyze(Y(n,:),muu);
    if (delta(n)<0)
        warning('LMSs unstable');
    end

    xhat(n+1) = y(n+1)-yhat(n);
	thetahat(n+1,:) = thetahat(n,:) + muu*Y(n,:)*(y(n+1)-yhat(n));
end