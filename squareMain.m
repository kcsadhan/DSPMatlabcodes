clc;
clear all;
close all;
T = input('enter time period of the square wave:');
[signal,time] = squareFunction(T);
plot(time,signal);