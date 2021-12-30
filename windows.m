clc;
clear all;
close all;

Fs = 10000;
Ts = 1/Fs;

L = 55;
c = (L+1)/2;

Fc = 2000;
Wc = 2*pi*Fc/Fs;

%Bartlett window (triangular window).
M = L-1;
W_bart = zeros(1,L);
for i =1:c
    W_bart(i) = 2*(i-1)/M;
end
W_bart(c+1:L) = W_bart(c-1:-1:1);

%hanning window
W_Hann=zeros(1,L);
for n=1:L
    W_Hann(n)=0.5-0.5*cos(2*pi*(n-1)/M); % n-1 used as starting index is 1 instead of 0
end

%hamming window.
W_Hamming=zeros(1,L);
for n=1:L
    W_Hamming(n)=0.54-0.46*cos(2*pi*(n-1)/M); % n-1 used as starting index is 1 instead of 0
end

%blackmann window
W_Blackman=zeros(1,L);
for n=1:L
    W_Blackman(n)=0.42-0.5*cos(2*pi*(n-1)/M)+0.08*cos(4*pi*(n-1)/M); % n-1 used as starting index is 1 instead of 0
end
h_Bart =h.*W_bart;