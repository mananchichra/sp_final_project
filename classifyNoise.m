function noiseType = classifyNoise(audio)
[y1,~] = audioread("music_ceiling-fan.wav");
[y2,~] = audioread("music_city-traffic.wav");
[y3,~] = audioread("music_pressure-cooker.wav");
[y4,~] = audioread("music_water-pump.wav");


ft = y1-y2;
fp = y1-y3;
fw = y1-y4;

pt = y2-y3;
pw = y3-y4;

wt = y4-y2;



r1_fan = xcorr(ft, audio, 'coeff');
r2_fan = xcorr(fp, audio, 'coeff');
r3_fan = xcorr(fw, audio, 'coeff');
max_r1_fan = max(abs(r1_fan));
max_r2_fan = max(abs(r2_fan));
max_r3_fan = max(abs(r3_fan));
overall_max_fan = max_r1_fan+max_r2_fan+max_r3_fan;
disp(overall_max_fan);


r1_traffic = xcorr(ft,audio,'coeff');
r2_traffic = xcorr(pt,audio,'coeff');
r3_traffic = xcorr(wt,audio,'coeff');
max_r1_traffic = max(abs(r1_traffic)); 
max_r2_traffic = max(abs(r2_traffic));
max_r3_traffic = max(abs(r3_traffic));
overall_max_traffic = max_r1_traffic+max_r2_traffic+max_r3_traffic;
disp(overall_max_traffic);

r1_pump = xcorr(wt,audio,'coeff');
r2_pump = xcorr(fw,audio,'coeff');
r3_pump = xcorr(pw,audio,'coeff');
max_r1_pump = max(abs(r1_pump));
max_r2_pump = max(abs(r2_pump));
max_r3_pump = max(abs(r3_pump));
overall_max_pump = max_r1_pump+max_r2_pump+max_r3_pump;
disp(overall_max_pump);

r1_pressure = xcorr(pt,audio,'coeff');
r2_pressure = xcorr(fp,audio,'coeff');
r3_pressure = xcorr(pw,audio,'coeff');
max_r1_pressure = max(abs(r1_pressure));
max_r2_pressure = max(abs(r2_pressure));
max_r3_pressure = max(abs(r3_pressure));
overall_max_pressure = max_r1_pressure+max_r2_pressure+max_r3_pressure;
disp(overall_max_pressure);

if max([overall_max_pressure,overall_max_pump,overall_max_traffic,overall_max_fan])==overall_max_fan
    noiseType=1;
elseif max([overall_max_pressure,overall_max_pump,overall_max_traffic,overall_max_fan])==overall_max_traffic
    noiseType=2;
elseif max([overall_max_pressure,overall_max_pump,overall_max_traffic,overall_max_fan])==overall_max_pressure
    noiseType=3;
elseif max([overall_max_pressure,overall_max_pump,overall_max_traffic,overall_max_fan])==overall_max_pump
    noiseType=4;
else 
    noiseType=0;
end

figure;
plot(1:length(r1_traffic),r1_traffic);
xlabel('n--->');
ylabel('ft<-->audio');
grid on;
figure;
plot(1:length(r2_traffic),r2_traffic);
xlabel('n--->');
ylabel('pt<--->audio');
grid on;
figure;
plot(1:length(r3_traffic),r3_traffic);
xlabel('n--->');
ylabel('wt<--->audio');
grid on;
figure;
plot(1:length(r2_fan),r2_fan);
xlabel('n--->');
ylabel('fp<--->audio');
grid on;
figure;
plot(1:length(r3_fan),r3_fan);
xlabel('n--->');
ylabel('fw<--->audio');
grid on;
figure;
plot(1:length(r3_pump),r3_pump);
xlabel('n--->');
ylabel('pw<-->audio');
grid on;
end

