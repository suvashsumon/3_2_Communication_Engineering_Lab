clc;
signal = [1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0];
%signal = [1 0 0 0 0 1 1 0 0 0 0 0];
lastPole = -1;
encodedSignal = hdb3Encode(signal, lastPole);
decodedSignal = hdb3Decode(encodedSignal, lastPole);

subplot(3, 1, 1);
stem(signal);
title('Original Signal');
hold on;
subplot(3, 1, 2);
stem(encodedSignal);
title('Encoded Signal');
subplot(3, 1, 3);
stem(decodedSignal);
title('Decoded Signal');