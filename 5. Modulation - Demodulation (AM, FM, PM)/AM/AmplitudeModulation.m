clc;

% properties message signal
fm = 10;
am = 1;

% properties carrier signal
fc = 500;
ac = 1;

% sampling frequency
fs = 2*10*(fc+2*fm);
t = 0:1/fs:((2/fm)-(1/fs)); % we use 2 cycle

% message signlal and carrier signal
x = am*sin(2*pi*fm*t);
c = ac*sin(2*pi*fc*t);

% modulation
modulatedSignal = ammod(x, fc, fs);

% demodulation
demodulatedSignal = amdemod(modulatedSignal, fc, fs);


% plotting
subplot(4, 1, 1);
plot(x);
title('Message Signal');
subplot(4, 1, 2);
plot(c);
title('Carrier Signal');
subplot(4, 1, 3);
plot(modulatedSignal);
title('Modulated Signal');
subplot(4, 1, 4);
plot(demodulatedSignal);
title('Demodulated Signal');





