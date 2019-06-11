Fs = input("Enter the sample frequency:")

t = 0:1/Fs:1

Ac = input("Enter the carrier signal amplitude")

Fc = input("Enter the carrier frequency")

Vc = Ac*sin(((2*%pi)*Fc)*t);

k = input("Enter the k factor:");

Vm= integrate('sin(x)','x',0,%pi);

Vpm = Ac*sin(((2*%pi)*Fc)*t)+(k*Vm);

plot(Vpm);
legend('PM Signal')
title('Phase Modulated Signal')
