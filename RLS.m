function [thetahat,xhat, Pnorm]=RLS(y,N,lambda, delay)
M = length(y);
d = delay;

P = 1e5 .* eye(N);
Y = zeros(N,1);
xhat = zeros(M,1);
K = zeros(N,M);
thetahat = zeros(N, M+N);
u = [zeros(d,1); y];
Pnorm = zeros(M,1);

for n=1:M-1
	% Generate Y(n). Set elements of Y that does not exist to zero
    Y = circshift(Y,-1);
    Y(end) = u(n);

	% Estimate of x
    yhat = Y.' * thetahat(:,n);
    e = y(n+1) - yhat;
    xhat(n) = e;
    
	% Update K
    K(:,n) = (P * Y) / (lambda + Y.' * P * Y);

	% Update P
    P = (1/lambda) * (P - K(:,n) * Y.' * P);
    Pnorm(n) = norm(P, 'fro');

    % Update theta
	thetahat(:,n+1) = thetahat(:,n) + K(:,n) * e;
end

thetahat = thetahat.';