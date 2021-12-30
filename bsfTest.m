Fs = 10000;
Ts = 1/Fs;
FcL = 3000;
FcU = 4000;
WcL = 2*pi*FcL/Fs;
WcU = 2*pi*FcU/Fs;
Wc0 = (WcU+WcL)/2;
Wc = (WcU - WcL)/2;

L = 555;
c = (L+1)/2;
h = zeros(1,L);

for n=1:(c-1)
    h(n) = sin(Wc*(n-c))/(pi*(n-c));
end
h(c) = Wc/pi;
for k = 1:(c-1)
    h(c+k) = h(c-k);
end

n = 0:L-1;
h = 2*cos(Wc0*(n-c+1)).*h;

h(c) = h(c)-1;
h = -h;

n = log2(L);
n = ceil(n);
N = max(256,2^n);
H = fft(h,N);

w = 0:2*pi/N:2*pi-2*pi/N;
w = w/pi;
plot(w, abs(H));
