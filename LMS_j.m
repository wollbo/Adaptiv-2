function [thetahat,xhat,delta]=LMS_j(y,N,muu) %N = M ?

% [thetahat,xhat]=lms(x,y,N,muu)
%
%	x			- Data sequence
%	y			- Data sequence
%	N			- Dimension of the parameter vector
%	muu			- Step size
%	thetahat		- Matrix with estimates of theta. 
%				  Row n corresponds to the estimate thetahat(n)'
%	xhat			- Estimate of x
%
%
%
%  lms: The Least-Mean Square Algorithm
%
% 	Estimator: xhat(n)=Y^{T}(n)thetahat(n-1)
%
%	thetahat is estimated using LMS. 
%
%     
%     Author: 
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialize xhat and thetahat
M = length(y);
d = 20;

Y = zeros(N,1);
xhat = zeros(M,1);
thetahat = zeros(N, M+N);
delta = zeros(M,1);

% Loop
u = [zeros(d,1); y];

for n=1:M-1
	% Generate Y. Set elements of Y that does not exist to zero
    Y = circshift(Y,-1);
    Y(end) = u(n);
   
    % normalized muu
    % nmuu = muu/(c + norm(Y));
    nmuu = muu;
    
	% Estimate of x
    % Predict yhat and subtract from y --> yields 'x'
    
    yhat = Y.' * thetahat(:,n);
    e = y(n+1) - yhat;
    xhat(n+1) = e;
    delta(n) = abs(e);
   
	% Update the n+1 row in the matrix thetahat which in the notation in the Lecture Notes
	% corresponds to thetahat(n)
    
	thetahat(:,n+1)= thetahat(:,n) + nmuu*Y*e;
end

% normalize muu see p. 137
%c = 1; % used in NLMS

% this line is necessary in block/one sample implementation with main loop in main.m
