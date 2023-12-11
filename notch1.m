%% PROGRAM : 
% Write a program in Matlab to "Load & plot ECG signal in time domain" and implement Notch Filter to remove 50 Hz with Q fator 1 
%% TASK UNDER PROGRAM 2: 
% PROCEED PROGRAM 2 ONLY AFTER COMPLETION OF PROGRAM 1
% (2-a) Use Subplot to show both signals together(original signal on the
% top(blue colour) and  bottom is filtered Signal after notch implementation(red colour).
% (2-b) Use Subplot to show both signals together(original signal on the
% left(blue colour) and  right is filtered Signal after notch implementation(red colour).
% (2-c) Plot both signals one over other with Original signal in red and.
% Filtered outupt in green and display only 0 to 201 samples or time frame
% of 0 to 0.804
% (2/1) Learn what does all the comand do in help section and add as
% comment.
% (2/2) Vary the Q factor from 1 to 35 in interval of 5 and check if any
% changes observed.
% Exercise (2/1) & (2/2) is meant for students as assignment. 
%% THINGS TO KNOW 
% 1. What is functions (Hint : iirnotch here is function).
% 2. Learn theoretical concepts of Notch filter.
% 3. If a variable is assigned with the value once do not assign the same.
% variable with another value (Ex : N is already used so we have used N1).
% default colour is always blue. 
% k-black : r-red : g-green : y-yellow: m-magneta( Refer help for more
% details)
%% SOLUTION 2
clc; 
clear all;
close all;
[y,Fs] = audioread('newecg7.wav');
f_s=250;
N=length([y,Fs]);
t=[0:N-1]/f_s; %time period(total sample/Fs )
figure
plot(t,[y,Fs])
title('Raw ECG Data plotting ')             
xlabel('time')
ylabel('amplitude')
w=50/(250/2);
bw=w;
[num,den]=iirnotch(w,bw); % notch filter implementation 
ecg_notch=filter(num,den,[y,Fs]);
figure,
N1=length(ecg_notch);
t1=[0:N1-1]/f_s;
plot(t1,ecg_notch,'r')
title('Filtered ECG signal ')             
xlabel('time')
ylabel('amplitude')
%% Task 2-a
figure, subplot 211  % study useage of subplot under help section 
plot(t,[y,Fs]); title('Raw ECG Data plotting ')             
xlabel('time')
ylabel('amplitude')
legend(' ORIGINAL ECG SIGNAL')
subplot 212
plot(t1,ecg_notch,'r'); title('Filtered ECG signal ')             
xlabel('time')
ylabel('amplitude')
legend(' Flitered ECG SIGNAL')
%% Task 2-b
figure, subplot 121  % study useage of subplot under help section 
plot(t,[y,Fs]); title('Raw ECG Data plotting ')             
xlabel('time')
ylabel('amplitude')
legend(' ORIGINAL ECG SIGNAL')
subplot 122
plot(t1,ecg_notch,'r'); title('Filtered ECG signal ')             
xlabel('time')
ylabel('amplitude')
legend(' Flitered ECG SIGNAL')
%% Task 2-c
figure, plot(t(1:201),ecg(1:201),'r'); title('Data plotting for 0 to 0.804 time frame')             
xlabel('time')
ylabel('amplitude')
hold on
plot(t1(1:201),ecg_notch(1:201),'g');             
legend('ORIGINAL ECG SIGNAL',' Flitered ECG SIGNAL')
hold off
 