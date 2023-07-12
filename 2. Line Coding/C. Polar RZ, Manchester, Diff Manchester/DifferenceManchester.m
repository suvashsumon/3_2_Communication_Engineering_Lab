input_data = [0 1 0 0 1 1 1 1 0 1 0];
bit_duration = 100;
time = 0:1:bit_duration*length(input_data);

% modulation
lastState = -1;
output_data = [lastState zeros(1, length(input_data)*bit_duration)];
index = 2;
for i=1:length(input_data)
  if input_data(i) == 1 % if input bit is 1
    for j=1:bit_duration/2
      output_data(index) = lastState;
      index = index + 1;
    endfor
    if lastState == 1
      lastState = -1;
    else
      lastState = 1;
    endif
    for j=1:bit_duration/2
      output_data(index) = lastState;
      index = index + 1;
    endfor
  else %% if input bit is 0
    if lastState == 1
      lastState = -1;
    else
      lastState = 1;
    endif
    for j=1:bit_duration/2
      fprintf('i am here\n');
      output_data(index) = lastState;
      index = index + 1;
    endfor
    if lastState == 1
      lastState = -1;
    else
      lastState = 1;
    endif
    for j=1:bit_duration/2
      output_data(index) = lastState;
      index = index + 1;
    endfor
  endif
endfor
plot(time, output_data, 'LineWidth', 3);
xlim([0 length(time)]);
ylim([-1.5 1.5]);

% demodulation
demodulated_data = zeros(1, (length(output_data)-1)/bit_duration);
index_dd = 1;
lastState = output_data(1);
for i=2:bit_duration:length(output_data)
  if lastState == output_data(i)
    demodulated_data(index_dd) = 1;
    index_dd = index_dd + 1;
    lastState = output_data(i+bit_duration-1);
  else
    demodulated_data(index_dd) = 0;
    index_dd = index_dd + 1;
    lastState = output_data(i+bit_duration-1);
  endif
endfor
demodulated_data

% self synchronization ache, no dc component, no baseline wondering, r=.5 Savg = N