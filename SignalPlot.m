[y,fs]=audioread('EQ2401Project2data2019.wav');

noteidx = [1000, 4000; 6000, 10500; 13000, 19000;  21000, 31000];

N = 128;
[Porig,w] = pwelch(y(noteidx(1,1):noteidx(1,2)),blackman(N),N/2,1024,fs);

plot(Porig, w)