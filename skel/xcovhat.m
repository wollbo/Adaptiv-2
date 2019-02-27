function SigmaYxhat = xcovhat(x, y, N)

%
% SigmaYxhat = xcovhat(x, y, N)
%
%	y, x			- Data sequences
%	N			- Size of covariance matrix
%
%  xcovhat: Estimates SigmaYx=E[Y(n)x(n)]
%
%		where 
%
%	   	Y(n)=[y(n) y(n-1) ... y(n-N+1)]^{T}
%
%     
%     Author: 
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
