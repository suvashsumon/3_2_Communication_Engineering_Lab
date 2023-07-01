% this function takes a digital signal and bitduration

function outputSignal = expandSignal(inputSignal, bitDuration)
    outputSignal = zeros(1, length(inputSignal)*bitDuration);
    index = 1;
    for i=1:length(inputSignal)
        for j=1:bitDuration
            outputSignal(index) = inputSignal(i);
            index = index + 1;
        end
    end
end