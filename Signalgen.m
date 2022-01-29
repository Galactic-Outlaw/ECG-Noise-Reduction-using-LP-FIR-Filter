clc;
close all;
clear all;
ecg_signal=10000*ecg(1000);
coeff=floor(10000*firrcos(100,15,10,1000))
binary_ecg=dec2bin(typecast(int16(ecg_signal),'uint16'))
binary_coeff=dec2bin(typecast(int16(coeff),'uint16'))
%reading array into .txt
fileID1 = fopen('D:\FIR\binary_ecg.txt','w');
fprintf(fileID1,'%s \n',string(binary_ecg));
fileID2 = fopen('D:\FIR\binary_coeff.txt','w');
fprintf(fileID2,'%s \n',string(binary_coeff));
fclose(fileID1);
fclose(fileID2);