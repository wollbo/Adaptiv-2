function [xhat,theta] = firw(y, SigmaYx, SigmaYY)

%
% [xhat,theta] = firw(y, SigmaYx, SigmaYY)
%	
%	y	- y(n)=x(n)+v(n)
% 	SigmaYY	- E[Y(n) (Y(n))']
%	SigmaYx	- E[Y(n) x(n)]
%	
% 	xhat	- FIR Wiener estimate of x(n) from y(n)
% 	theta	- FIR Wiener filter.
%	
%
%  firw: FIR Wiener estimate of x(n) from y(n)
%     
%     
%     Author: 
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

