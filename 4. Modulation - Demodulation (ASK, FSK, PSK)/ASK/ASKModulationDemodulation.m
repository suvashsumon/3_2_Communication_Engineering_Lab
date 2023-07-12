clc;
signal = [1 0 1 1 0 0 1];

bitrate = 1;
% finding sampling time and rate
sampling_rate = 1000;
sampling_time = 1/sampling_rate;
end_time = length(signal)/bitrate;
time = 0:sampling_time:end_time;

% career freequency properties
a = 3;
f = 2;

% lets modulate
index = 1;
modulatedSignal = a*sin(2*pi*f*time);
for i=1:length(time)
    if signal(index)==0
        modulatedSignal(i) = 0;
    end
    
    if time(i)*bitrate>=index
        index = index + 1;
    end
end

% ok...lets demodulate
index = 1;
%demodulatedSignal = zeros(1, length(modulatedSignal)/sampling_rate);
for i=1:length(modulatedSignal)
    if modulatedSignal(i) ~= 0
        demodulatedSignal(index) = 1;
    else
        demodulatedSignal(index) = 0;
    end
    
    if time(i)*bitrate >= index
        index = index + 1;
    end
end

%plotting
bitDuration = length(modulatedSignal)/length(signal);
subplot(3, 1, 1);
plot(expandSignal(signal, bitDuration), 'linewidth', 2);
title('Original Signal');
hold on;
subplot(3, 1, 2);
plot(modulatedSignal, 'linewidth', 2);
title('Modulated Signal');
subplot(3, 1, 3);
plot(expandSignal(demodulatedSignal, bitDuration), 'linewidth', 2);
title('Demodulated Signal');