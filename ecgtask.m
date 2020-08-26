T = readtable('samples.csv');
x = (T(:,2));
x = abs(table2array(x));
Fs = 1500;
figure
plot(x)

%Statistical Operations
disp("The mean of signal:")
Mean = round(mean(x))

disp("The mode of the signal:")
moDE = mode(x)
disp("The Standard Deviation of signal:")
sd = std(x)

disp("The Variance of the signal:")
var = sd*sd

disp("The kurtosis of the signal:")
k = kurtosis(x)

disp("The skewness of the signal:")
y = round(skewness(x))

disp("The peak to peak values of the signal:")
peakToPeak = peak2peak(x)

disp("The instantaneous frequency of the signal:")
ifq = instfreq(x,Fs)
figure;
plot(ifq)
title("Instantaneous Frequency")

mu = 0;
sigma = 1;
pd = makedist('Normal','mu',Mean,'sigma',sd);
pdfunc = pdf(pd,x);
[f,xi] = ksdensity(x);
figure;
plot(xi,f);
title("Probability Density Function");
