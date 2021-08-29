clear
clc

q=3;
f1=2500;
% Record your voice for q seconds.
recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj, q);
disp('End of Recording.');

% Play back the recording.
play(recObj);

% Store data in double-precision array.
myRecording = getaudiodata(recObj);
% Time axis
qa=recObj.TotalSamples;
t=(0:q/qa:q-q/qa)';

% for the frrequency axis
Ts=q/qa; %sampling time
fs=1/Ts; %sampling frequency
[na,nb]=size(t(:)); % na=number of points of signal
ff=fs*[0:na-1]/na-fs/2;

% Plot the waveform.
figure()
plot(t,myRecording);
xlabel('time (secs)')
ylabel('amplitude (V)')
figure

cs=cos(2*pi*f1*t);
mods=cs.*myRecording;
plot(ff,fftshift(abs(fft(myRecording))),'r')
% hold on
% plot(ff,fftshift(abs(fft(mods))),'k')
% hold off
xlabel('frequency (Hz)')
ylabel('Magnitude (V)')



% statitical variables 

skw = skewness(myRecording)
kurt = kurtosis(myRecording)
tMean = mean(myRecording)
stDev = std(myRecording)
v = var(myRecording)
deviation = v/stDev


% histogram
figure()
histogram(myRecording, 10)


% autocorreltaion:

[c_ww,lags] = xcorr(myRecording,10,'coeff');
figure()
stem(lags,c_ww);
title("Audio Autocorrelation")


% probability density function
xDist = linspace(-0.1,0.1,length(t));
pd = makedist("Normal",mean(myRecording),std(myRecording));
pdfT = pdf(pd,xDist);
% cumulative distribution Fucntion
cdfT = cdf(pd,xDist);

figure()
subplot(1,2,1)
plot(xDist,pdfT,'LineWidth',2)
title("Probability Density Function");
xlabel("audio values")
ylabel("probability")
subplot(1,2,2)
plot(xDist,cdfT,'LineWidth',2)
title("Cumulative Distribution Function");
xlabel("audio values")
ylabel("probability")



% Power Spectral Density
N = 20; % lenght of the overall fourier transform
Ns = length(myRecording);
psd = abs(fft(myRecording,N)).^2/Ns;
figure();
stem( (0:(N-1))/N,psd )








