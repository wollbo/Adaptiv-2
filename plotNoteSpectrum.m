function plotNoteSpectrum(y,xhatlms, xhatrls, fs)
noteidx = [1000, 4000; 6000, 10500; 13000, 19000;  21000, 31000];

figure()
for i = 1:length(noteidx)
    subplot(2,2,i);
    
    N = 512;
    [Porig,w] = pwelch(y(noteidx(i,1):noteidx(i,2)),blackman(N),N/2,1024,fs);
    Plms = pwelch(xhatlms(noteidx(i,1):noteidx(i,2)),blackman(N),N/2,1024,fs);
    Prls = pwelch(xhatrls(noteidx(i,1):noteidx(i,2)),blackman(N),N/2,1024,fs);
    
    hold on
    grid on
    plot(w, 10*log10(Porig));
    plot(w, 10*log10(Plms));
    plot(w, 10*log10(Prls));
    
    title(sprintf('Note %i', i));
    legend('Original', 'LMS', 'RLS')
    xlabel('Frequency (Hz)')
    ylabel('Spectrum (dB)')
    hold off
end


end

