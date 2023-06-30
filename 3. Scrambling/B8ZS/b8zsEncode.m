function encodedSignal = b8zsEncode(signal, last)
    count = 0;
    for i = 1:length(signal)
        % checking if the bit is 0 or not
        if signal(i)==0
            count = count + 1;
        else
            count = 0;
            signal(i) = -1*last; % change bit depends on last non zero transitioin
            last = -1*last; % update last flag
        end
        
        % if i get 8 consecutive 0's then apply the 000VB0VB
        if count == 8
            if last == 1 % previous nonzero transition is positive
                signal(i-4) = 1;
                signal(i-3) = -1;
                signal(i-2) = 0;
                signal(i-1) = -1;
                signal(i) = 1;
                last = 1;
                count = 0;
            else % previous nonzero transition is negetive
                signal(i-4) = -1;
                signal(i-3) = 1;
                signal(i-2) = 0;
                signal(i-1) = 1;
                signal(i) = -1;
                last = -1;
                count = 0;
            end
        end
    end
    encodedSignal = signal;
end