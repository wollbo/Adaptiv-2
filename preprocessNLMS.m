function [thetahat,xhat]= preprocessNLMS(y,N,muu,d)
% Estimate of x
% Predict yhat and subtract from y --> yields 'x'
M = length(y);

Y = zeros(M,N);
xhat = zeros(M,1);
thetahat = zeros(M,N);
c = 1;
yhat = zeros(M,1);
alpha = 0.5;

if (muu>2)
    warning('LMS unstable');
end

for n=1:M-1
	% Generate Y. Set elements of Y  that does not exist to zero
    % double ALE
    if n > d
        Y(n+1,1:N-1) = Y(n,2:N);
        Y(n+1,N) = (1-alpha)*y(n-d+1)+alpha*yhat(n-d);  
    end
    
    yhat(n) = thetahat(n,:)*Y(n,:)';
    xhat(n+1) = y(n+1)-yhat(n);
    
    nmuu = muu/(c + norm(Y(n,:)).^2);
	thetahat(n+1,:) = thetahat(n,:) + nmuu*Y(n,:)*(y(n+1)-yhat(n));
end