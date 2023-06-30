input_data = [0 1 0 0 1 1 1 0];
bit_duration = 1000;
output_data = zeros(1, bit_duration*length(input_data));
time = 1:1:length(output_data);
% encoding
index = 1;
for i=1:length(input_data)
  if input_data(i)==1
    for j=index:index+bit_duration-1
      output_data(j) = -1;
    endfor
    index = index + bit_duration;
  else
    for j=index:index+bit_duration-1
      output_data(j) = 1;
    endfor
    index = index + bit_duration;
  endif
endfor
plot(time, output_data, 'LineWidth',5);
xlim([0 length(time)])
ylim([-1.5 1.5]);


% decoding
current_bit = output_data(1);
decoded_data = zeros(1, length(output_data)/bit_duration);
index = 1;
for i=1:bit_duration:length(output_data)
  fprintf('%d\n', i);
  if output_data(i) == 1
    decoded_data(index) = 0;
    index = index + 1;
  else 
    decoded_data(index) = 1;
    index = index + 1;
  endif
endfor
decoded_data