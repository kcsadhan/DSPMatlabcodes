clc;
clear all;

Fs = 10000;
Ts = 1/Fs;
FcH = 4000;
WcH = 2*pi*FcH/Fs;
Wc = pi - WcH;

L = 99;
c = (L+1)/2;
h = zeros(1,L);

for n=1:(c-1)
    h(n) = sin(Wc*(n-c))/(pi*(n-c));
end

h(c) = Wc/pi;

for k =1:(c-1)
    h(c+k) = h(c-k);
end

n=0:L-1;

h = (-1).^(n-c+1).*h;
figure;
stem(0:L-1,h);
n = log2(L);
n = ceil(n);
N = max(256,2^n);
H = fft(h,N);

figure;
subplot(3,1,1);
stem(0:N-1,abs(H));

%digital frequencies.
w= 0:2*pi/N:2*pi - 2*pi/N;
w = w/pi;
subplot(3,1,2);
plot(w,H);

%analog frequencies.
f = 0:Fs/N:Fs-Fs/N;
subplot(3,1,3);
plot(f,H);

nTs = 0:Ts:1;
x1 = cos(2*pi*3500*nTs);
y1 = conv(x1, h);
figure;
plot(y1(L:L+2500));
