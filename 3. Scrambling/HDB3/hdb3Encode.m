function encodedData = hdb3Encode(signal, lastPole)
    prevPoleCount = 0;
    zerocnt = 0;
    for i=1:length(signal)
        if signal(i)==1
            prevPoleCount = prevPoleCount + 1;
            signal(i) = -1*lastPole;
            lastPole = signal(i);
        else
            zerocnt = zerocnt + 1;
        end
        
        if zerocnt==4
            if mod(prevPoleCount,2)==0
                signal(i-3) = -1*lastPole; % B
                signal(i-2) = 0; % 0
                signal(i-1) = 0; % 0
                signal(i) = signal(i-3); % V
                lastPole = signal(i);
                prevPoleCount = 0;
            else
                signal(i-3) = 0; % 0
                signal(i-2) = 0; % 0
                signal(i-1) = 0; % 0
                signal(i) = lastPole; % V
                lastPole = signal(i);
                prevPoleCount = 0;
            end
            zerocnt = 0;
        end
    end
    encodedData = signal;
end