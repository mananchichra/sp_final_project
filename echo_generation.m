function [y,Fs] = echo_generation(x,Fs,delay)
    alpha = input("enter attenuation:");
    D = delay*Fs;
    y = zeros(size(x));
    y(1:D) = x(1:D);

    for i = D+1:length(x)
        y(i) = x(i);
        for k = D:D:i
        
            if i-k < 1
                break
            end

        y(i) = y(i) + (alpha*x(i-k))/(k/D);
        end
    end
end

