function[y]=ampdemod(x,Vc,fc,fs,Em,Ec)
    xdem = x.*Vc;
    H = iir(7,'lp','butt',[fc/fs,0],[.1,.1]);
    num = coeff(H(2));
    den = coeff(H(3));
    num = num(length(num):-1:1);
    den = den(length(den):-1:1);
    y = filter(num,den,xdem);
    subplot(2,1,2);
    plot(y,'r');
    title('AM Demodulated Signal')
endfunction 
Ab = input("enter the amplitude of the baseband signal");

Ac = input("enter the amplitude of the carrier signal");

baseband_freq = input("enter the baseband frequency of the signal");

carrier_freq = input("enter the carrier frequency of the signal");

sampling_freq = input("enter the sampling frequency");

buffer_length = input("enter the bufferlength of the signal");

n = 0:(buffer_length-1);

baseband_signal=Ab*sin(2*%pi*n/(sampling_freq/baseband_freq));
carrier_signal =Ac*sin(2*%pi*n/(sampling_freq/carrier_freq));
Modulated_signal = carrier_signal.*(1+baseband_signal/Ac);
Demodulated_signal = (Modulated_signal).*(carrier_signal);
colorspecs1 = [0.7 0.7 0.7]
colorspecs3 = [0.4 0.4 0.4]
colorspec2 =[0.1 0.3 0.8]
subplot(4,2,1);
plot(n,baseband_signal,'Color', colorspecs1);
title("BaseBand signal");
subplot(4,2,2);
plot(n,carrier_signal,'Color',colorspecs3);
title("carrier signal");
subplot(4,2,3);
plot(n,Modulated_signal,'Color',colorspec2);
title("Modulated signal");
subplot(4,2,4);
ampdemod(Modulated_signal,carrier_signal,carrier_freq,sampling_freq,Ab,Ac);

