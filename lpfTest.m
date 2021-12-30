clc;close all; clear all;
Fs = 10000;
Ts = 1/Fs;

Fc = 3000;
Wc = 2*pi*Fc/Fs;

L = 55;
c=(L+1)/2;

h = zeros(1,L);
for n = 1:c-1
    h(n) = sin(Wc*(n-c))/(pi*(n-c));
end
h(c) = Wc/pi;

for k=1:(c-1)
    
    h(k+c) = h(c-k);
end

n=0:L-1;
stem(n,h);

n = log2(L);
n = ceil(n);
N = max(256,2^n);
k=0:N-1;
H = fft(h,N);

figure;
subplot(3,1,1);
stem(k,abs(H));

%in digital frequencies.

w = 0:2*pi/N:2*pi-(2*pi/N);
w=w/pi;
subplot(3,1,2);
plot(w,abs(H));

%in analog frequencies.

f = 0:Fs/N:Fs-(Fs/N);
subplot(3,1,3);
plot(f,abs(H));




nTs = 0:Ts:1;

f1 = 1000;
f2 = 4000;

x1 = cos(2*pi*f1*nTs);
x2 = cos(2*pi*f2*nTs);
msg = x1 + x2;

y1 = conv(x1,h);
y2 = conv(x2,h);
y = conv(msg,h);

figure;
subplot(3,2,1);
plot(x1(L:L+250));

subplot(3,2,2);
plot(y1(L:L+250));

subplot(3,2,3);
plot(x2(L:L+250));

subplot(3,2,4);
plot(y2(L:L+250));

subplot(3,2,5);
plot(msg(L:L+250));

subplot(3,2,6);
plot(y(L:L+250));

