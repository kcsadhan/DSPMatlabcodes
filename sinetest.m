Fs = 10000;
Ts = 1/Fs;
f=10;
nTs = 0:Ts:1;

x = sin(2*pi*f*nTs);

plot(nTs,x);



%plot n cycles.

n = 2;
T = 1/f;

nc = 0:Ts:n*T;
y = x(1:length(nc));

plot(nc,y);