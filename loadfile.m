%%%%%%%%%%%%%%%%%%%%%%% loadfile.m %%%%%%%%%%%%%%%%%%%%%%
% Functions:
% load gravity data from .txt file 

global prof_l num_data G_obs xx xx_min xx_max
%controls_cancel
%controls_cancel=0;

[FileName,PathName] = uigetfile('*.txt','Choose a data file');
LocalPath=pwd;   %save current path location

cd(PathName);   %go to the directory of file wish to be loaded
loaded_data=dlmread(FileName, '\t', 1, 0);  %save x coordinate and grav. anomaly in 2 column matrix

cd(LocalPath);

xx=loaded_data(:,1);       % x coordinate of measurment location
G_obs=loaded_data(:,2);    % grav. anomaly (mGal)
xx_min=min(xx); xx_max=max(xx);
prof_l=xx_max-xx_min;
num_data=length(xx);    % number of data = M
