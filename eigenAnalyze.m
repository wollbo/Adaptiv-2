function delta = eigenAnalyze(signal,muu)

R = signal*signal';
lambda = max(eig(R));
delta = (2/lambda)-muu;

end