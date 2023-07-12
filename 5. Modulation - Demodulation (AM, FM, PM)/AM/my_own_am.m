clc;
t = 0:0.0001:1;

% message signal
fm = 4;
am = 3;
ym = am*sin(2*pi*fm*t);

% carrier signal
fc = 50;
ac = 4;
yc = ac*sin(2*pi*fc*t);

% modulation
modulatedSignal = (ac + am*sin(2*pi*fm*t)).*sin(2*pi*fc*t);

% demodulation
demodulatedSignal = modulatedSignal./sin(2*pi*fc*t) - ac;

% plotting
subplot(4, 1, 1);
plot(ym);
title('Message Signal');
subplot(4, 1, 2);
plot(yc);
title('Carrier Signal');
subplot(4, 1, 3);
plot(modulatedSignal);
title('Modulated Signal');
subplot(4, 1, 4);
plot(demodulatedSignal);
title('Modulated Signal');