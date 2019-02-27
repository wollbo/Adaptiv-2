function [thetahat,xhat,delta]=LMS(y,N,muu) %N = M ?

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

% Loop

% normalize muu see p. 137

M = length(y);

Y = zeros(N,1);
xhat = zeros(M,1);
thetahat = zeros(M+N,N);
delta = zeros(M,1);
c = 1; % used in NLMS

for n=1:M-1

	% Generate Y. Set elements of Y that does not exist to zero
    
    Y(n<(N+1)) = 0;
    Y(N+1) = y(n);
    Y = Y(2:N+1,:);    
    
    % normalized muu
    nmuu = muu/(c + norm(Y));
    
	% Estimate of x
    % Predict yhat and subtract from y --> yields 'x'
    
    yhat = thetahat(n,:)*Y;
    
    delta(n) = abs(y(n+1)-yhat);
    


	% Update the n+1 row in the matrix thetahat which in the notation in the Lecture Notes
	% corresponds to thetahat(n)
    
	thetahat(n+1,:)= thetahat(n,:) - nmuu*Y'*(y(n+1)-yhat);
    
    xhat(n+1) = y(n+1)-thetahat(n,:)*Y;
    
    
end


% this line is necessary in block/one sample implementation with main loop in main.m
% Shift thetahat one step so that row n corresponds to time n
% thetahat=thetahat(2:N+1,:);
