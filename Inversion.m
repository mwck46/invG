function varargout = Inversion(varargin)
% INVERSION MATLAB code for Inversion.fig
%      INVERSION, by itself, creates a new INVERSION or raises the existing
%      singleton*.
%
%      H = INVERSION returns the handle to a new INVERSION or the handle to
%      the existing singleton*.
%
%      INVERSION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INVERSION.M with the given input arguments.
%
%      INVERSION('Property','Value',...) creates a new INVERSION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Inversion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Inversion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
%
% Edit the above text to modify the response to help Inversion

% Last Modified by GUIDE v2.5 01-May-2015 19:12:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Inversion_OpeningFcn, ...
                   'gui_OutputFcn',  @Inversion_OutputFcn, ...
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


% --- Executes just before Inversion is made visible.
function Inversion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Inversion (see VARARGIN)

% Choose default command line output for Inversion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Inversion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


%% Determine if this window is activated by 'Synthetic menu'
% if true, no need to load a data file

global synthetic x g xx_min xx_max prof_l num_data G_obs xx

% if this menu is linked from 'Synthetic.m', noise= 'No'
if strcmp(synthetic,'Yes')==1   %strcmp compare the string of variable 'synthetic' and string 'Yes', same returns 1, different returns 2
    xx=x;
    G_obs=g;
    xx_min=min(xx); xx_max=max(xx);
    prof_l=xx_max-xx_min;   % profile length
    num_data=length(xx);    % number of data = M
    
    
    % Plot observed gravity data on axes_plot
    axes(handles.axes_plot);
    plot(xx, G_obs,'*');
    grid on
    legend('observed gravity data');
    Xmax=max(xx); Xmin=min(xx);
    xlim([Xmin Xmax])
    
    % Display info of profile in frame 1
    str_prof_l = sprintf('%d', prof_l);
    set(handles.text_prof_l, 'String', str_prof_l);
    str_num_data = sprintf('%d', num_data);
    set(handles.text_num_data, 'String', str_num_data);
    % Enable to push the Go button
    set(handles.pushbutton_go, 'Enable', 'on'); 
    
else
    synthetic ='No';
    
end



% --- Outputs from this function are returned to the command line.
function varargout = Inversion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%%%%%%%%%%%%%%%% Frame 1: profile information %%%%%%%%%%%%%%%%%%%%%
% text_prof_l
% text_num_data





%%%%%%%%%%%%%%%% Frame 2: model parameters %%%%%%%%%%%%%%%%%%%%%%%%
function edit_CX_Callback(hObject, eventdata, handles)
% hObject    handle to edit_CX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_CX as text
%        str2double(get(hObject,'String')) returns contents of edit_CX as a double

% --- Executes during object creation, after setting all properties.
function edit_CX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_CX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_CZ_Callback(hObject, eventdata, handles)
% hObject    handle to edit_CZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_CZ as text
%        str2double(get(hObject,'String')) returns contents of edit_CZ as a double

% --- Executes during object creation, after setting all properties.
function edit_CZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_CZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_dz_Callback(hObject, eventdata, handles)
% hObject    handle to edit_dz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_dz as text
%        str2double(get(hObject,'String')) returns contents of edit_dz as a double


% --- Executes during object creation, after setting all properties.
function edit_dz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_dz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in radiobutton_limit.
function radiobutton_limit_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_limit


function edit_uplim_Callback(hObject, eventdata, handles)
% hObject    handle to edit_uplim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_uplim as text
%        str2double(get(hObject,'String')) returns contents of edit_uplim as a double


% --- Executes during object creation, after setting all properties.
function edit_uplim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_uplim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_lowlim_Callback(hObject, eventdata, handles)
% hObject    handle to edit_lowlim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_lowlim as text
%        str2double(get(hObject,'String')) returns contents of edit_lowlim as a double


% --- Executes during object creation, after setting all properties.
function edit_lowlim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_lowlim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes on button press in pushbutton_go.
function pushbutton_go_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_go (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




%%%%%%%%%%%%%%%%%%%%%%%%% Inversion procedures %%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Step 1: load inversion parameters
global CX CZ dz iter_max l_0 tDepth num_model xx xx_min xx_max...
 xspace zspace Xmid Zmid dx G_obs prof_l V_inv G_model toggle ...
 uplim lowlim disp_interm

CX=str2double(get(handles.edit_CX,'string'));
CZ=str2double(get(handles.edit_CZ,'string'));
dz=str2double(get(handles.edit_dz,'string'));
iter_max=str2double(get(handles.edit_iter_max,'string'));
l_0=str2double(get(handles.edit_l_0,'string'));
uplim=str2double(get(handles.edit_uplim,'string'));
lowlim=str2double(get(handles.edit_lowlim,'string'));


%% Step 2: generate grid
dx=prof_l/CX;   % width of prism or x-interval
num_model=CX*CZ; % total no. of prisms(model) = N
tDepth=CZ*dz; % total depth

xspace=(xx_min:dx:xx_max-dx/2);
zspace=(0:dz:tDepth-dz/2);

%generate the x,y coordinate of mid-point of each prisms
[Xmid,Zmid]=meshgrid(xspace+dx/2,zspace+dz/2);


%% Step 3: compute kernel
kernel

%% Step 4: inversion procedures

% Choose appropriate inversion route
% Determine if limit is set
toggle=get(handles.radiobutton_limit,'Value'); %toggle = 0 if radiobutton is empty; =1 if filled

% Determine if intermediate iterations need to be display
disp_interm=get(handles.radiobutton_interm,'Value'); %disp_interm = 0 if radiobutton is empty; =1 if filled



% Execute inversion
compactInversion


%% Step 5: plot on grid

% 5.1 plot the modelled gravity
axes(handles.axes_plot);
plot(xx, G_model,'r',xx, G_obs,'*');
legend('modelled anomaly', 'observed data');
Xmax=max(xx); Xmin=min(xx);
xlim([Xmin Xmax]);                           
ylabel('Gravity effect (mGal)')
grid on

% 5.2 Visualize the position of anomaly
%Display the density of each prisms and with scaled colour bar
axes(handles.axes_grid); % specify the following change will be made on axes_grid
imagesc(Xmid(1,:),Zmid(:,1)',V_inv);   %display matrix as image, but with scaled bar
set(gca,'XAxisLocation','top','XTick',xspace, 'YTick',zspace);
grid on

%load self-defined colormap
load invG_colormap.mat
colormap(mycamp)
caxis([-300 300])
colorbar('southoutside')
axis('ij');





% Show another figure with no exaggeration
figure(3) % figure(1) and figure (2) has been used already
imagesc(Xmid(1,:),Zmid(:,1)',V_inv);   %display matrix as image, but with scaled bar
set(gca,'XAxisLocation','top');
axis([xx_min xx_max 0 xx_max])
grid on
title('Inverted model with no exaggeration')
load invG_colormap.mat 
colormap(mycamp)
caxis([-300 300])
colorbar('southoutside')
axis('ij');

% Remarks:
% the grid is generate from Xmin to Xmax with x interval dx
% i.e. xspace and zspace are the boundary of blocks
% imagesc show the respective value of mid point of the block
% i.e. Xmid and Zmid are the mid point of the block







%%%%%%%%%%%%%%%% Frame 3: Inversion parameters %%%%%%%%%%%%%%%%%%%%%%

function edit_iter_max_Callback(hObject, eventdata, handles)
% hObject    handle to edit_iter_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_iter_max as text
%        str2double(get(hObject,'String')) returns contents of edit_iter_max as a double


% --- Executes during object creation, after setting all properties.
function edit_iter_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_iter_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_l_0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_l_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_l_0 as text
%        str2double(get(hObject,'String')) returns contents of edit_l_0 as a double


% --- Executes during object creation, after setting all properties.
function edit_l_0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_l_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end









%%%%%%%%%%%%%%%%%%%%%%%%%%% Menu %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------------File------------------------------
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


opentxt;

% Plot observed gravity data on axes_plot
axes(handles.axes_plot);
plot(xx, G_obs,'*');          
grid on
legend('observed gravity data');
Xmax=max(xx); Xmin=min(xx);
xlim([Xmin Xmax])

% Display info of profile in frame 1
prof_l=ceil(prof_l);
str_prof_l = sprintf('%d', prof_l);
set(handles.text_prof_l, 'String', str_prof_l);
str_num_data = sprintf('%d', num_data);
set(handles.text_num_data, 'String', str_num_data);

% Enable to push the Go button
set(handles.pushbutton_go, 'Enable', 'on');

% --------------------------------------------------------------------
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
savedensity



%------------------------------- Exit -------------------------------
% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_Callback(hObject, eventdata, handles)
% hObject    handle to Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
invG;
close ('Inversion');

% --------------------------------------------------------------------
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close ('Inversion');

% --------------------------------------------------------------------
function forward_Callback(hObject, eventdata, handles)
% hObject    handle to forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global inver
% save parametes for Forward modelling
inver='Yes';
Forward

% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function grid_on_Callback(hObject, eventdata, handles)
% hObject    handle to grid_on (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes_grid); % specify the following change will be made on axes_grid
%set(gca,'XAxisLocation','top','XTick',xspace, 'YTick',zspace);
grid on


% --------------------------------------------------------------------
function grid_off_Callback(hObject, eventdata, handles)
% hObject    handle to grid_off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes_grid); % specify the following change will be made on axes_grid
%set(gca,'XAxisLocation','top','XTick',xspace, 'YTick',zspace);
grid off


% --------------------------------------------------------------------
function axis_dense_Callback(hObject, eventdata, handles)
% hObject    handle to axis_dense (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global xspace zspace
axes(handles.axes_grid); % specify the following change will be made on axes_grid
set(gca,'XAxisLocation','top','XTick',xspace, 'YTick',zspace);

% --------------------------------------------------------------------
function axis_dense_off_Callback(hObject, eventdata, handles)
% hObject    handle to axis_dense_off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Xmid Zmid V_inv

axes(handles.axes_grid); % specify the following change will be made on axes_grid
imagesc(Xmid(1,:),Zmid(:,1)',V_inv);   %display matrix as image, but with scaled bar
set(gca,'XAxisLocation','top');
grid on

%load self-defined colormap
load invG_colormap.mat
colormap(mycamp)
caxis([-300 300])
colorbar('southoutside')
axis('ij');



% --------------------------------------------------------------------
function colour_Callback(hObject, eventdata, handles)
% hObject    handle to colour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Xmid Zmid V_inv xspace zspace
axes(handles.axes_grid); % specify the following change will be made on axes_grid
imagesc(Xmid(1,:),Zmid(:,1)',V_inv);   %display matrix as image, but with scaled bar
set(gca,'XAxisLocation','top');
set(gca,'XAxisLocation','top','XTick',xspace, 'YTick',zspace);
grid on
colormap('default')
colorbar('southoutside')
axis('ij');


% --- Executes on button press in radiobutton_interm.
function radiobutton_interm_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_interm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_interm
