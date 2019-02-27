function [Ahat, sigma2hat] = ar_id(y, N)

% [Ahat,sigma2hat]=ar_id(y,N)
%
%	y			- Data sequence
%	N			- Model order 
%	Ahat			- Estimate of AR polynomial [1, a1, ..., aN]
%	sigma2hat		- Estimate of noise variance 
%
%
%  ar_id: Identification of AR model
%
%         Model: y(n)+a_{1}y(n-1)+...+a_{N}y(n-N)=e(n)
%
%     
%     Author: 
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

