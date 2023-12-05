function [audio,fs] = loadAudioFile(filename)
    [audio,fs] = audioread(filename);
end
    