clear; close all; clc; 

FS = 16e3;

[x,fs] = audioread('it_was_the_women_that_complained_when_the_old_bingo_hall_was_closed_original.wav');

x = resample(x, FS, fs);

y=vocoder(x, FS, 8, 160, 'NOISE', 1);

figure;
plot((1:length(y))/FS, y);
xlabel('Time (second)')
title('Vocoded signal')

audiowrite('it_was_the_women_that_complained_when_the_old_bingo_hall_was_closed_nvs.wav', y, FS)


y=vocoder(x, FS, 8, 160, 'TONE', 1);

figure;
plot((1:length(y))/FS, y);
xlabel('Time (second)')
title('Vocoded signal')

audiowrite('it_was_the_women_that_complained_when_the_old_bingo_hall_was_closed_tvs.wav', y, FS)