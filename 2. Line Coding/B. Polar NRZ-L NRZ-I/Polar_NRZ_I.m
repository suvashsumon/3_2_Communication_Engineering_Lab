input_data = [0 1 0 0 1 1 1 0 1 1 0];
bit_duration = 100;
output_data = zeros(1, bit_duration*length(input_data));
time = 1:1:length(output_data);
% encoding
current = 1; % assume that previous state is 1
index = 1;
for i=1:length(input_data)
  if input_data(i) == 1
    % inversation of state
    if current == 1
      current = -1;
    elseif
      current = 1;
    endif
    for j=index:index+bit_duration-1
      output_data(j) = current;
      index = index + 1;
    endfor
  else
    for j=index:index+bit_duration-1
      output_data(j) = current;
      index = index + 1;
    endfor
  endif
endfor

plot(time, output_data, 'LineWidth', 3);
xlim([0 length(time)]);
ylim([-1.5 1.5]);


% decoding 
current = 1; 
decoded_data = zeros(1, length(output_data)/bit_duration);
index = 1;
for i=1:bit_duration:length(output_data)
  if output_data(i)==current
    decoded_data(index) = 0;
    index = index + 1;
  else
    decoded_data(index) = 1;
    index = index + 1;
    if current == 1
      current = -1;
    else
      current = 1;
    endif
  endif
endfor
decoded_data

% no self synchronization , dc ache