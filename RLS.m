function [thetahat,xhat, Pnorm]=RLS(y,N,lambda)

% [thetahat,xhat]=rls(x,y,N,lambda)
%
%	x			- Data sequence
%	y			- Data sequence
%	N			- Dimension of the parameter vector
%	lambda			- Forgetting factor
%	thetahat		- Matrix with estimates of theta. 
%				  Row n corresponds to time n-1
%	xhat			- Estimate of x for n=1
%
%
%
%  rls: Recursive Least-Squares Estimation
%
% 	Estimator: xhat(n)=Y^{T}(n)thetahat(n-1)
%
%	thetahat is estimated using RLS. 
%
%	Initalization:	P(0)=10000*I, thetahat(0)=0
%
%     
%     Author: 
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialize P, xhat and thetahat
M = length(y);
d = 100;

%P = zeros(N,N,M);
%P(:,:,1) = 1e5 .* eye(N);
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

	% Update the n+1 row in the matrix thetahat which in the 
	% notation in the Lecture Notes corresponds to thetahat(n)

	thetahat(:,n+1) = thetahat(:,n) + K(:,n) * e;
end

% Shift thetahat one step so that row n corresponds to time n

%thetahat=thetahat(2:M+1,:);
