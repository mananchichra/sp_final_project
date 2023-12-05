function ynlms=echo_cancel(xn2,x_ref2,fs)
    xn1 = xn2(:,1);
    x_ref = x_ref2(:,1);
    
    xn = zeros(length(x_ref),1);
    xn(1:length(xn1)) = xn1((1:length(xn1)));
    xd = xn;
    L = 7;
    nlms = dsp.LMSFilter(L,'Method','Normalized LMS');
    [~,mumaxmsenlms] = maxstep(nlms,xd);
    nlms.StepSize = mumaxmsenlms/200 ;
    [~,enlms,wnlms] = nlms(x_ref,xd);
    bw = firwiener(L-1,x_ref,xd); % Optimal FIR Wiener filter
    MAfilt = dsp.FIRFilter('Numerator',bw);
    yw = MAfilt(x_ref); % Estimate of x using Wiener filter
    ew = xd - yw; % Estimate of actual sinusoid
    [ynlms,enlms,wnlms] = nlms(x_ref,xd);
    for i = 1:20
    [ynlms,enlms,wnlms] = nlms(x_ref,xd);
    end
end