Ac = input("Enter the amplitude of carrier signal");

Am = input("enter the amplitude of message signal");

Fc = input("Enter the carrier signal frequencies:");

Fm = input("Enter the modulated signal frequencies:");

Fs = input("Enter the sampling signal frequencies:");

t=0:1/Fs:4/Fm;

m = cos(2*%pi*Fm*t);

c = cos(2*%pi*Fc*t);

colorspread1 = [1.0 0.5 0.1]

colorspread2 =[0.1 0.5 1.0]
M = m.*c;
title("dsb signal")
subplot(2,1,1);
plot(t,M,'Color',colorspread2);

l1=length(M);
F=linspace(-Fs/2,Fs/2,l1);
Z1=fftshift(fft2(M,1,l1)/l1);
subplot(2,1,2),plot(F,abs(Z1));
title('DSB SC MODULATION IN FREQUENCY DOMAIN');
xlabel('frequency(hz)');
ylabel('amplitude');

h = gca(); // get current axes 
h.data_bounds = [-200000, 0 ; 200000, 0.3]; 
//task 3.3 demodulation
s1=M.*c;
S1=fftshift(fft2(s1,1,length(s1))/length(s1));
figure(3)
plot(F,abs(S1));
title(' demodulated signal IN FREQUENCY DOMAIN before filtring');
xlabel('frequency(hz)');
ylabel('amplitude');
h = gca(); // get current axes 
h.data_bounds = [-200000, 0 ; 200000, 0.3]; 
//hold on                       
Hlp=1./sqrt(1+(F./Fc).^(2*100));
plot(F,Hlp,'g');
title(' frequency response of low pass filter');
xlabel('frequency(hz)');
ylabel('amplitude');
h = gca(); // get current axes 
h.data_bounds = [-200000, 0 ; 200000,2]; 
// task 3.4
E1=Hlp.*S1;
figure(4)
subplot(2,1,1),plot(F,E1);
title(' Recover signal IN FREQUENCY DOMAIN after filtring');
xlabel('frequency(hz)');
ylabel('amplitude');
h = gca(); // get current axes 
h.data_bounds = [-200000, 0 ; 200000, 0.3]; 
e1=ifft(ifftshift(E1))*length(E1);
subplot(2,1,2),plot(t,(1/0.5)*e1);
title(' Recover signal IN Time DOMAIN after filtring');
xlabel('time(sec)');
ylabel('amplitude');


