clc,clearvars;
inputAudioFile = 'music_water-pump.wav'; 

audio = loadAudioFile(inputAudioFile);

noiseType = classifyNoise(audio);

if noiseType==1
    disp('The detected noise type is: Fan');
elseif noiseType==2
    disp('The detected noise type is: traffic');
elseif noiseType==3
    disp('The detected noise type is: pressure cooker');
elseif noiseType==4
    disp('The detected noise type is: water-pump');
else
    disp('Unidentified sound');
end


