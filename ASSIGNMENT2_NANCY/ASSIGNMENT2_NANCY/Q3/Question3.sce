Am = input("Enter the amplitude of carrier signal");

Ac = input("Enter the amplitude of message signal");

Fc = input("Enter the carrier frequency");

Fm = input("Enter the message frequency");

Fs = input("Enter the sampling frequency");

T = input("Enter the Time");

t = 0:T/Fs:T;

m = Am*cos(2*%pi*Fm*t);

c = Ac*cos(2*%pi*Fc*t);

d = m.*c;

m1 = imag(hilbert(m));

c1 = imag(hilbert(c));

d1 = m1.*c1;

s_u = d - d1;

s_a = d + d1;

subplot(3,1,1)

plot(t,s_u)

subplot(3,1,2)

plot(t,s_a)
