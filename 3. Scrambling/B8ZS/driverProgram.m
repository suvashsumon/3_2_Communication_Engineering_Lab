clc;
bits = [1 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 1];
%bits = [1 0 0 0 1 0 0 0 0 0 0 0 0 0 1];
last = -1;
encodedSignal = b8zsEncode(bits, last);
decodedSignal = b8zsDecode(encodedSignal, last);

subplot(3, 1, 1);
stem(bits);
title('Original Signal');
hold on;
subplot(3, 1, 2);
stem(encodedSignal);
title('Encoded Signal');
subplot(3, 1, 3);
stem(decodedSignal);
title('Decoded Signal');