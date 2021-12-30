clc;
close all;
clear all;
[x,Fs]=audioread("saamisaami.mp3");
disp('sampling rate is :');
disp(Fs);
x=x';
%without filterin.
xp = x(:,1:10*Fs);
sound(xp,Fs);
pause(10);

%LPF
Fc = 1000;
Wc = 2*pi*Fc/Fs;
L = 233;
c = (L+1)/2;
h = zeros(1,L);

for i = 1:(c-1)
    h(i) = sin(Wc*(i-c))/(pi*(i-c));
end
h(c) = Wc/pi;
for i = 1:(c-1)
    h(c+i) = h(c-i);
end
%stem(h);
hf = flip(h);
hf = hf';
y = zeros(2,length(x(1)));
for n =L:10*Fs
    y(1,n) = x(1,n-L+1:n)*hf;
    y(2,n) = x(2,n-L+1:n)*hf;
end
%0 to 1k filtered sound.

sound(y,Fs);
pause(10);

%playing with bpf
for kbp = 1:4
    %design a bpf;
    FcL =kbp*1000;
    FcU = FcL+1000;
    WcL = 2*pi*FcL/Fs;
    WcU = 2*pi*FcU/Fs;
    Wc0 = (WcL + WcU)/2;
    Wc = (WcU-WcL)/2;
    h = zeros(1,L);
    
    for n = 1:c-1
        h(n) = sin(Wc*(n-c))/(pi*(n-c));
    end
    h(c) = Wc/pi;
    for n = 1:c-1
        h(c+n) = h(c-n);
    end
    n = 0:L-1;
    h = 2*cos(Wc0*(n-c+1)).*h;
    hf = flip(h);
    hf=hf';
    y=zeros(2,length(x));
    
    for n =L:10*Fs
        y(1,n) = x(1,n-L+1:n)*hf;
        y(2,n) = x(2,n-L+1:n)*hf;
    end
    disp(['playing sound in the frequency range: ',num2str(FcL),' to ', num2str(FcU)]);
    sound(y,Fs);
    pause(10);
end

    
    
    
    


    