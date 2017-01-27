% Functions:
% load gravity data from .txt file 

global prof_l num_data G_obs xx xx_min xx_max

CurrentPath=pwd;   %save current path location

[FileName,PathName] = uigetfile('*.txt','Choose a .txt data file');
cd(PathName);   %go to the directory of the file
loaded_data=dlmread(FileName, '\t', 1, 0);  %save x coordinate and grav. anomaly in a 2 column matrix
cd(CurrentPath);

xx=loaded_data(:,1);       % x coordinate of measurment location
G_obs=loaded_data(:,2);    % grav. anomaly (mGal)
xx_min=min(xx); xx_max=max(xx);
prof_l=xx_max-xx_min;   % profile length
num_data=length(xx);    % number of data = M
