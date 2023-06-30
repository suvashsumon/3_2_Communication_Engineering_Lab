function decodedSignal = b8zsDecode(encodedSignal, last)
    for i=1:length(encodedSignal)
        if encodedSignal(i)==last && i+4<length(encodedSignal)
            last = encodedSignal(i+4);
            encodedSignal(i) = 0;
            encodedSignal(i+1) = 0;
            encodedSignal(i+2) = 0;
            encodedSignal(i+3) = 0;
            encodedSignal(i+4) = 0;
            i = i+5;
        elseif encodedSignal(i)==1 || encodedSignal(i)==-1
            last = encodedSignal(i);
            encodedSignal(i) = 1;
        end
    end
    decodedSignal = encodedSignal;
end