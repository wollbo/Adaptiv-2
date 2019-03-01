function [thetahat,xhat,delta]= preprocessNLMS(y,N,muu,d)

M = length(y);

Y = zeros(M,N);
xhat = zeros(M,1);
thetahat = zeros(M,N);
delta = zeros(M,1);
c = 1; % used in NLMS
yhat = zeros(M,1);
feedback = 0.8;
gamma = 1;

%ypp = filter(H,1,y);

for n=1:M-1
	% Generate Y. Set elements of Y  that does not exist to zero
   
    
    % normalized muu
    nmuu = muu/(c + norm(Y(n,:)));
    %nmuu = muu;
    
	% Estimate of x
    % Predict yhat and subtract from y --> yields 'x'
    
    
	% Update the n+1 row in the matrix thetahat which in the notation in the Lecture Notes
	% corresponds to thetahat(n)
    
    assert(nmuu<2, 'LMSs unstable')
    
    
    
    
    % double ALE
    if n > d
        Y(n+1,1:N-1) = Y(n,2:N);
        thetaDistance = vectorDistance(thetahat(n+1,:), thetahat(n-10,:));
        if thetaDistance < gamma
            alpha = feedback;
        else
            alpha = 0;
        end
        Y(n+1,N) = (1-alpha)*y(n-d+1)+alpha*yhat(n-d);  
    end
    yhat(n) = thetahat(n,:)*Y(n,:)';
    xhat(n+1) = y(n+1)-yhat(n);
	thetahat(n+1,:) = thetahat(n,:) + nmuu*Y(n,:)*(y(n+1)-yhat(n));
    
end