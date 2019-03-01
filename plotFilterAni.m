function plotFilterAni(y, theta, fs)

N = 512;
framelen = 1024;
ulen = 64;
numframes = floor((length(y)-framelen) / ulen) + 1;
    
for i = 1:numframes
    subplot(2,1,1)
    [P,w] = pwelch(y((i-1)*ulen+1:i*ulen + framelen),blackman(N),N/2,512,fs);
    %hold on
    
    H = abs(fft(theta((i-1)*ulen+floor(framelen/2),:), 512));
    H = H(1:512/2 +1);

    plot(w, 10*log10(P));
    hold on
    plot(w, 10*log10(H)-40);
    
    ylim([-120,-10]);
    xlim([0, 4000]);
    grid on 
    box off
    hold off
    
    subplot(2,1,2)
    plot(y);
    rectangle('Position', [i*ulen, min(y), framelen, max(y)-min(y)], 'FaceColor', [0.6 0.7 0.6 0.4], 'EdgeColor', [1 1 1, 0])
    xlim([1, length(y)]);
    
    drawnow

end
end

