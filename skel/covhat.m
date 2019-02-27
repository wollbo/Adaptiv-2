function SigmaYYhat = covhat(y, N)

%
% SigmaYYhat = covhat(y,N)
%
%	y			- Data sequence
%	N			- Size of covariance matrix
%
%  covhat: Estimates SigmaYY=E[Y(n)Y^{T}(n)]
%
%		where 
%
%	   	Y(n)=[y(n) y(n-1) ... y(n-N+1)]^{T}
%
%     
%     Author: 
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
