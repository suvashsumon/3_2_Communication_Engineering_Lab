input_data = [0 1 0 0 1 1 1 1 0];
bit_duration = 100;
time = 1:1:bit_duration*length(input_data);

%modulation
output_data = zeros(1, bit_duration*length(input_data));
index = 1;
for i=1:length(input_data)
  if input_data(i)==0
    for j=1:bit_duration/2
      output_data(index) = 1;
      index = index + 1;
    endfor
    for j=1:bit_duration/2
      output_data(index) = -1;
      index = index + 1;
    endfor
  else
    for j=1:bit_duration/2
      output_data(index) = -1;
      index = index + 1;
    endfor
    for j=1:bit_duration/2
      output_data(index) = 1;
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
for i = 1:bit_duration:length(output_data)
  if output_data(i) == 1
    demodulated_data(index) = 0;
    index = index + 1;
  else
    demodulated_data(index) = 1;
    index = index + 1;
  endif
endfor
demodulated_data