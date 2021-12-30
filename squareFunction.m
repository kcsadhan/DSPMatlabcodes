function [x,nTs] = squareFunction(T);
N = input('enter number of frequency components:');
f0 =1/T;
Fmax = (2*N -1);
Fs = max(10000, 4*Fmax);
nTs = 0:1/Fs:1;
x = zeros(1,length(nTs));
for k=1:N
    x = x + sin(2*pi*(2*k-1)*f0*nTs)/(2*k-1);
end
x = 4/pi*x;
end