function [thetahat,xhat,delta]= preprocessLMSrev(y,N,muu,d)

M = length(y);

Y = zeros(M,N);
xhat = zeros(M,1);
thetahat = zeros(M,N);
delta = zeros(M,1);
c = 1; % used in NLMS
yhat = zeros(M,1);
feedback = 0.3;
gamma = 1e6;%gamma = 0.01;

for n=1:M-1
	% Generate Y. Set elements of Y  that does not exist to zero
   
    
    % normalized muu
    nmuu = muu/(c + norm(Y(n,:)));
    %nmuu = muu;
    
	% Estimate of x
    % Predict yhat and subtract from y --> yields 'x'
    
    yhat(n) = thetahat(n,:)*Y(n,:)';
    
	% Update the n+1 row in the matrix thetahat which in the notation in the Lecture Notes
	% corresponds to thetahat(n)
    

    %delta(n) = eigenAnalyze(Y(n,:),nmuu);
    %assert(delta(n)>0, 'LMSs unstable')
    
    xhat(n+1) = yhat(n);
	thetahat(n+1,:) = thetahat(n,:) + nmuu*Y(n,:)*(y(n+1)-yhat(n));
    
    if n > d
        Y(n+1,1:N-1) = Y(n,2:N);
        thetaDistance = vectorDistance(thetahat(n+1,:), thetahat(n-min(10,d),:));
        if thetaDistance < gamma
            alpha = feedback;
        else
            alpha = 0;
        end
        Y(n+1,N) = (1-alpha)*y(n+1-d)+alpha*yhat(n-d); 
    end
    
end