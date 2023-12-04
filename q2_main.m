[xn2, Fs] = loadAudioFile("q1_hard.wav");
[x_ref2,Fs1] = loadAudioFile("q1_hard_echo.wav");
ynlms=echo_cancel(xn2,x_ref2,Fs);
sound(ynlms,Fs);