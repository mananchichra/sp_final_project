input_file = "q1.wav";
[x,fs] = loadAudioFile(input_file);
delay = input("Enter delay:");
[y,Fs] = echo_generation(x,fs,delay);
% sound(x,Fs);
% pause(10);
sound(y,Fs);


