% BME Lab 1B - respiration
% Group 3- Allie Smith, Dreya Martin, Crystal Murray
fname = 'RestingHR.BME3014.csv';
Fs = 200;
rawdataRes = importdata(fname);
Resdata = rawdataRes.data(:,4);
time = rawdataRes.data(:,1);

%Plot raw data
    figure
    plot(time,Resdata,'b-')
    title('Respiration Resting Raw Data')
    xlabel('Time (ms)')
    ylabel('Potential (V)')

% low pass filter % takes 5 seconds for breath
filt = designfilt('lowpassfir','PassbandFrequency', .1,...
    'StopbandFrequency', 5,'StopbandAttenuation',65,'SampleRate',200);
t=linspace(0,2,length(Resdata));%2seconds
groupf1 = grpdelay(filt);
f1 = filter(filt, Resdata);

figure
plot(t, Resdata, t, f1, '-r')
title('Filtered Data');xlabel('Time (s)');ylabel('Potential (V)');

figure
pwelch(f1, [], [] ,[], 200);

%% Exercise one

fnameEx = 'Exercise.BME3014.csv';
rawdataResEx = importdata(fnameEx);
ResdataEx = rawdataResEx.data(:,4);
time = rawdataResEx.data(:,1);
Fs = 200;

    figure
    plot(time,ResdataEx,'b-')
    title('Respiration Exercise Raw Data')
    xlabel('Time (s)')
    ylabel('Potential (V)')

% low pass filter % takes 5 second for breath
filtEx = designfilt('lowpassfir','PassbandFrequency', .1,...
    'StopbandFrequency', 5,'StopbandAttenuation',65,'SampleRate',200);
t=linspace(0,2,length(ResdataEx));%2seconds
groupf1Ex = grpdelay(filtEx);
f1Ex = filter(filtEx, ResdataEx);

figure
plot(t, ResdataEx, t, f1Ex, '-r')

%y = interp1(rpeak, rrint, time); % rpeak???
figure
pwelch(f1Ex, [], [] ,[], 200);
