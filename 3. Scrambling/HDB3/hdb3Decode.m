function decodedSignal = hdb3Decode(encodedSignal, lastPole)
    for i=1:length(encodedSignal)
        if encodedSignal(i)==lastPole
            lastPole = encodedSignal(i);
            encodedSignal(i) = 0;
            encodedSignal(i-1) = 0;
            encodedSignal(i-2) = 0;
            encodedSignal(i-3) = 0;
        else
            if encodedSignal(i)~=0
                lastPole = encodedSignal(i);
                encodedSignal(i) = 1;
            else
                encodedSignal(i) = 0;
            end
        end
    end
    decodedSignal = encodedSignal;
end