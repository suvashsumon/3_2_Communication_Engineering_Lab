clc;

signal = [1 0 1 0 1 1 0 1 0 1 1 1];


% sampling rate and frequency
bitrate = 1;
samplingferq = 100;
sampling_time = 1/samplingferq;
end_time = length(signal)/bitrate;
time = 0:sampling_time:end_time;

% properties of carrier signal 0
a0 = 1;
f0 = 0.7;
carrier0 = a0*sin(2*pi*f0*time);

% properties of carrier signal 1
a1 = 1; % a0 and a1 should be similer
f1 = 2;
carrier1 = a1*sin(2*pi*f1*time);

% modulation
modulatedSignal = zeros(1, length(time));
index = 1;
for i=1:length(time)
    if signal(index) == 0
        modulatedSignal(i) = carrier0(i);
    elseif signal(index) == 1
        modulatedSignal(i) = carrier1(i);
    end
    
    if time(i)*bitrate>=index
        index = index + 1;
    end
end


% demodulation
index = 1;
for i=1:length(modulatedSignal)
    if modulatedSignal(i)==carrier0(i)
        demodulatedSignal(index) = 0;
    elseif modulatedSignal(i)==carrier1(i)
        demodulatedSignal(index) = 1;
    end
    
    if time(i)*bitrate>=index
        index = index + 1;
    end
end


% plotting
bitDuration = length(modulatedSignal)/length(signal);
subplot(3, 1, 1);
plot(expandSignal(signal, bitDuration), 'linewidth', 2);
title('Original Signal');
subplot(3, 1, 2);
plot(modulatedSignal, 'linewidth', 2);
title('Modulated Signal');
subplot(3, 1, 3);
plot(expandSignal(demodulatedSignal, bitDuration),  'linewidth', 2);
title('Demodulated Signal');