clc;
%signal = [1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0];
signal = [1 0 0 0 0 1 1 0 0 0 0 0];
lastPole = -1;
encodedSignal = hdb3Encode(signal, lastPole);
stem(encodedSignal);