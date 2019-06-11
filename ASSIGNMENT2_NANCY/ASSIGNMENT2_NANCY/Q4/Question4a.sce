Fs = input("Enter the sampling frequency");

t = 0:1/Fs:1;

Am = input("Enter the Amplitude of message signal");

Ac = input("Enter the Amplitude of carrier signal");

Fm = input("Enter the frequency of the message signal");

Fc = input("Enter the frequency of the carrier signal");

Vc = Ac*sin(((2*%pi)*Fc)*t+%pi);

Vm = Am*sin(((2*%pi)*Fm)*t);

k = input("enter the frequency sensitivity");

Vfm = Ac*sin(((2*%pi)*Fc)*t) + k*(Am/Fm)*sin(((2*%pi)*Fm)*t);

title("Frequency modulation");
plot(t,Vfm);
