function [thetahat,xhat,delta]=LMS(y,N,muu)

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

Y = zeros(M,N);
xhat = zeros(M,1);
thetahat = zeros(M,N);
delta = zeros(M,1);
c = 1; % used in NLMS
d = 50;
for n=1:M-1
	% Generate Y. Set elements of Y  that does not exist to zero
    
    if n > d
        Y(n+1,1:N-1) = Y(n,2:N);
        Y(n+1,N) = y(n-d); 
    end
   
    % normalized muu
     nmuu = muu/(c + norm(Y(n,:)));
     %nmuu = muu;
    
	% Estimate of x
    % Predict yhat and subtract from y --> yields 'x'
    
    yhat = thetahat(n,:)*Y(n,:)';
    
    delta(n) = abs(y(n+1)-yhat);
    
	% Update the n+1 row in the matrix thetahat which in the notation in the Lecture Notes
	% corresponds to thetahat(n)
    
    xhat(n+1) = y(n+1)-yhat;
    %thetahat(n+1,1:N-1) = thetahat(n,2:N);
	thetahat(n+1,:) = thetahat(n,:) + nmuu*Y(n,:)*(y(n+1)-yhat);
    
    
end


% this line is necessary in block/one sample implementation with main loop in main.m
% Shift thetahat one step so that row n corresponds to time n
% 
