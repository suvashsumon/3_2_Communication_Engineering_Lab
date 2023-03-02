input_data = [0 1 0 0 1 0 1 1 0];
bit_duration = 100;
output_data = zeros(1, length(input_data)*bit_duration);
time = 1:length(output_data);

% modulation
index = 1;
state = 1;
for i=1:length(input_data)
  if input_data(i)==1
    for j=1:bit_duration-1
      output_data(index) = state;
      index = index + 1;
    endfor
    if state == 1
      state = -1;
    else 
      state = 1;
    endif
  else
    for j=1:bit_duration-1
      output_data(index) = 0;
      index = index + 1;
    endfor
  endif
endfor
plot(time, output_data, 'LineWidth', 3);
xlim([0 length(time)]);
ylim([-1.5 1.5]);

% demodulation
demodulated_data = zeros(1, length(output_data)/bit_duration);
index = 1;
for i=1:bit_duration:length(output_data)
  if output_data(i) == 0
    demodulated_data(index) = 0;
    index = index + 1;
  else
    demodulated_data(index) = 1;
    index = index + 1;
  endif
endfor
demodulated_data