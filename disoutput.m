clc;clear all;close all;
file0=fopen('D:\FIR\binary_ecg.txt','r')
form='%d'
x0=fscanf(file0,form)
x=x0./10000
fclose(file0);
%file1=fopen('D:\FIR\out.txt','r')
%form='%d'
%y0=fscanf(file1,form)
%y=y0./10^8
%fclose(file1);
subplot(2,1,1);plot(abs(fft(x)));
title("ecg signal,1000 samples")
xlabel("freq")
ylabel("DFT of ecg signal")
axis([0 100 0 10^7])
%subplot(2,1,2);plot(abs(fft(y)));
%title("output of LPF filter")
%axis([0 100 0 50])
%xlabel("freq")
%ylabel("DFT of output of LPF")