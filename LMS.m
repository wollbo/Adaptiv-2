function [thetahat,xhat]=lms(x,y,N,muu) %N = M ?

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

M = length(y);
Y = zeros(M+N,1);
for n=1:M %M+N ?

	% Generate Y. Set elements of Y that does not exist to zero
    
    if n-N < 1
        for i = 1:N
            if n-i < 1
                Y(n) = 0;
            end
        end
    else
        Y(n:n+N) = y(n-N:n);
    end
            
	% Estimate of x


	% Update the n+1 row in the matrix thetahat which in the notation in the Lecture Notes
	% corresponds to thetahat(n)

	thetahat(n+1,:)=
end

% Shift thetahat one step so that row n corresponds to time n

thetahat=thetahat(2:M+1,:);