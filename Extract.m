function varargout = Extract(varargin)
% EXTRACT MATLAB code for Extract.fig
%      EXTRACT, by itself, creates a new EXTRACT or raises the existing
%      singleton*.
%
%      H = EXTRACT returns the handle to a new EXTRACT or the handle to
%      the existing singleton*.
%
%      EXTRACT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXTRACT.M with the given input arguments.
%
%      EXTRACT('Property','Value',...) creates a new EXTRACT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Extract_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Extract_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Extract

% Last Modified by GUIDE v2.5 03-May-2015 21:18:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Extract_OpeningFcn, ...
                   'gui_OutputFcn',  @Extract_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Extract is made visible.
function Extract_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Extract (see VARARGIN)

% Choose default command line output for Extract
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Extract wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Extract_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%%%%%%%%%%%%%%%%%% Frame 2: Extract data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on selection change in popupmenu_axis.
function popupmenu_axis_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_axis contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_axis



popup=get(hObject,'Value'); 

if popup==2       % 'value'=2 means the data that want to be extracted is parallel to Y axis
    str = sprintf('X axis value (km): ');
    set(handles.text_axis, 'String', str);
    set(handles.pushbutton_profile,'Enable', 'on');
elseif popup==3   % 'value'=3 means the data that want to be extracted is parallel to X axis
    str = sprintf('Y axis value (km): ');
    set(handles.text_axis, 'String', str);
    set(handles.pushbutton_profile,'Enable', 'on');
end


% --- Executes during object creation, after setting all properties.
function popupmenu_axis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_value_Callback(hObject, eventdata, handles)
% hObject    handle to edit_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_value as text
%        str2double(get(hObject,'String')) returns contents of edit_value as a double


% --- Executes during object creation, after setting all properties.
function edit_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_profile.
function pushbutton_profile_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_profile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global x y data g_mean

hold on;

% Choose two points on current axes
[xp(1),yp(1)] = ginput(1);

[xp(2),yp(2)] = ginput(1);

% Label the two points as 'A' and 'B'
h = text(xp(1)-0.1,yp(1)-0.1,'A');
set(h,'FontSize',12);
set(h,'FontWeight','bold');

h = text(xp(2)+0.1,yp(2)+0.1,'B');
set(h,'FontSize',12);
set(h,'FontWeight','bold');

% calculate coordiate
dist=((xp(1)-xp(2))^2+(yp(1)-yp(2))^2)^0.5;
coor=linspace(0,dist);

% Interpolation
x_coor=linspace(xp(1),xp(2));
y_coor=linspace(yp(1),yp(2));
profile = griddata(x,y,data,x_coor,y_coor)

% Minus the aveage value from extracted data for inversion
G_obv=profile-g_mean;

% plot interpolated profile
figure; plot(coor,G_obv);
xlabel('Distance (km)');
ylabel('Gravity anomaly (mGal)');
title('Interpolated gravity profile after subtracting the mean value');
grid on

% Save the data as .txt
local_path=pwd;

[FileName,PathName] = uiputfile('*.txt','Save File');
head1='X[m]';
head2='Anomaly (mGal)';
header=strcat(head1, '\t', head2);

cd(PathName);
fid = fopen(FileName,'w');
fprintf(fid, header, 'newline', 'pc');
fclose(fid);
coor=coor*1000;  % change from km to m
dlmwrite(FileName, [coor',G_obv'], 'newline','pc', 'delimiter','\t', '-append', 'roffset',1, 'precision','%.3f');

cd(local_path);
















%%%%%%%%%%%%%%%%%%%%%%%%%%%% Menu %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%% menu 1: File
% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global x y data dt g_mean

%% Open a .gxf file
[FileName,PathName] = uigetfile('*.gxf','Choose a data file'); % Pop up a dialog for opening .gxf file
LocalPath=pwd;   %save current path location
cd(PathName);   %go to the directory of file wish to be loaded


fid=fopen(FileName,'r'); %open a file with permission read only

% Save the header parameter into an array called header.data
i=0;
while ~feof(fid);
    line=fgets(fid);
    if strfind(line,'#GRID')>0 %Find the header word to indicate the start of the data values
        break
    elseif strcmp(line(1),'#')==0 %Find the header fields
        i=i+1;
        header(i).data=line; %Put all header data fields into a structure
    end
end

%% Display the header parameters in GUI textbox
set(handles.text_title, 'String', header(1).data);
set(handles.text_rows, 'String', header(5).data);
set(handles.text_columns, 'String', header(2).data);
set(handles.text_seperation, 'String', header(6).data);
set(handles.text_x_origin, 'String', header(9).data);
set(handles.text_y_origin, 'String', header(10).data);
set(handles.text_sense, 'String', header(7).data);
set(handles.text_rotation, 'String', header(4).data);

dt=str2double(header(6).data);      %thickness (m)
dt=dt/1000;                         %thickness (km)
point=str2double(header(2).data);   %no. of data point
row=str2double(header(5).data);     %no. of rows

gravmag=fscanf(fid,'%f',point*row);
data=reshape(gravmag,point,row);
data=data';
data(data==-9999)=NaN; % -9999.0 represent dummy data in .gxf file, replace they with not a number (NaN)

fclose(fid);
cd(LocalPath); % Go back to original directory


%% Calculate the mean of all data
data_dummy=data;
n=numel(data)-numel(find(isnan(data_dummy)));     % number of valid data, excluding NaN
data_dummy(isnan(data_dummy))=0;
S=sum(sum(data_dummy));     % sum of data
g_mean=S/n;

set(handles.text_numdata, 'String', num2str(n));
set(handles.text_mean, 'String', num2str(g_mean));




%% Define the location of the first grid point according to the value of #SENSE
% please refer to the attached pdf file 'gxf details'

sense=str2double(header(7).data);

if sense == 1
    horz=(1:point)*dt;
    vert=(1:row)*dt;
    [x,y]=meshgrid(vert,horz);
elseif sense == -1
    data=data';
    horz=(1:row)*dt;
    vert=(1:point)*dt;
    [x,y]=meshgrid(horz,vert);
else
    display('Sorry, the value of sense is unexpected and have not been considered in this version of invG');
    
end

% CAUTION: please note that there are other values of #SENSE, and the orientation is
% different form +1 or -1, but they didn't consider in here



%% Plot gravity anomaly
figure(1)
surfc(x,y,data);
title(header(1).data);
xlabel('x (km)');
ylabel('y (km)');
zlabel('anomaly');
axis tight % set the limit of axis, so that the plot extend to the edges of axis
colormap default
colorbar;

%% Plot the countour map for choosing which line of data to be extracted
axes(handles.axes_contour);
contour(x,y,data);
xlabel('x (km)');
ylabel('y (km)');
title('Contour map of anomaly')
colorbar
grid on
grid minor






%%%%%%%% menu 2: exit
% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
invG;
close ('Extract');

% --------------------------------------------------------------------
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close ('Extract');


% --------------------------------------------------------------------
function inversion_Callback(hObject, eventdata, handles)
% hObject    handle to inversion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Inversion
close ('Extract');



% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_numdata_Callback(hObject, eventdata, handles)
% hObject    handle to edit_numdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_numdata as text
%        str2double(get(hObject,'String')) returns contents of edit_numdata as a double


% --- Executes during object creation, after setting all properties.
function edit_numdata_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_numdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
