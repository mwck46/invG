function varargout = Forward(varargin)
% FORWARD MATLAB code for Forward.fig
%      FORWARD, by itself, creates a new FORWARD or raises the existing
%      singleton*.
%
%      H = FORWARD returns the handle to a new FORWARD or the handle to
%      the existing singleton*.
%
%      FORWARD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORWARD.M with the given input arguments.
%
%      FORWARD('Property','Value',...) creates a new FORWARD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Forward_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Forward_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Forward

% Last Modified by GUIDE v2.5 10-Jun-2015 12:45:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Forward_OpeningFcn, ...
                   'gui_OutputFcn',  @Forward_OutputFcn, ...
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


% --- Executes just before Forward is made visible.
function Forward_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Forward (see VARARGIN)

% Choose default command line output for Forward
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Forward wait for user response (see UIRESUME)
% uiwait(handles.figure1);


%% Determine if this window is activated by 'Inversion'
global inver Xmid Zmid V_inv xspace zspace xx G_model G_obs xx_min xx_max ...
    V_for colour_map axes_dense free_air

if strcmp(inver,'Yes')==1 %strcmp compare the string of variable 'inver' and string 'Yes', same returns 1, different returns 2

    axes(handles.axes_grid)
    V_for=V_inv;
    imagesc(Xmid(1,:),Zmid(:,1)',V_for);   %display matrix as image, but with scaled bar
    set(gca,'XAxisLocation','top','XTick',xspace, 'YTick',zspace);
    load invG_colormap.mat
    xlim([xx_min xx_max]);
    colormap(mycamp);
    caxis([-300 300])
    colorbar('southoutside')
    axis('ij');
    grid on
    
    
    
    axes(handles.axes_plot);
    plot(xx, G_model,'r',xx, G_obs,'*');
    xlim([xx_min xx_max]);
    grid on
    ylabel('Gravity effect (mGal)');
    legend('modelled anomaly', 'observed data');
    



end

% Set default setting of colour_map, axes_dense and free_air
colour_map='standardized';
axes_dense='on';
free_air='off';


% --- Outputs from this function are returned to the command line.
function varargout = Forward_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%%%%%%%%%%%%%%%%%%%%%%% Frame 1: Prism %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Prisms along x
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

%Prisms along z
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

%Thickness (m)
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

% Generate Button
% generate the grid according to new parameters of prisms dimension
% --- Executes on button press in pushbutton_generate.
function pushbutton_generate_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global prof_l dz xx_min xx_max dx num_model xspace zspace ...
Xmid Zmid V_for CX CZ
     
CX=str2double(get(handles.edit_CX,'string'));
CZ=str2double(get(handles.edit_CZ,'string'));
dz=str2double(get(handles.edit_dz,'string'));
dx=prof_l/CX;   % width of prism or x-interval
depth=CZ*dz; % total depth
xspace=(xx_min:dx:xx_max-dx/2);  % x coordinate of prisms edges
zspace=(0:dz:depth-dz/2); % z coordinate of prisms edges


% Lower part of graph: grid for selecting prisms

axes(handles.axes_grid);

axis([xx_min xx_max 0 depth]);  % set limit of axis of the grid
axis('ij'); % axis in matrix mode 
% origin at lower left corner, i: vertical, from top to bottom 
% j: horizontal, form left to right

set(gca,'XAxisLocation','top', 'XTick',xspace, 'YTick',zspace);
grid on;



% calulate parameters for visulising matrix
[Xmid,Zmid]=meshgrid(xspace+dx/2,zspace+dz/2); %mid-point of prisms
V_for=zeros(CZ,CX);   % V_for is nx1 zero matrix representing initial density contrast

% calculate parameters for computing kernel
num_model=CX*CZ;

% Restart button
% After changing the grid dimensions, reset the density model matrix V_for to zero
% --- Executes on button press in pushbutton_restart.
function pushbutton_restart_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_restart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Xmid Zmid V_for xspace zspace CZ CX

axes(handles.axes_grid); % specify the following change will be made on axes_grid

V_for=zeros(CZ,CX);
%Desplay the density of each prisms and with scaled colour bar
imagesc(Xmid(1,:),Zmid(:,1)', V_for); %V_for is zero matrix (vertical no. of prisms)x(horizontal no. of prisms)
grid on
set(gca,'XAxisLocation','top', 'XTick',xspace, 'YTick',zspace);
colorbar('southoutside')



%%%%%%%%%%%%%%%%%%%%%%%%% Frame 2: Area %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Executes on button press in pushbutton_select.
function pushbutton_select_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Xmid Zmid V_for selected_prisms xspace zspace axes_dense

axes(handles.axes_grid); % specify the following change will be made on axes_grid


if strcmp(axes_dense,'off')==1    % compare if axes_dense = 'off', if yes return 1
    %Desplay the density of each prisms and with scaled colour bar
    imagesc(Xmid(1,:),Zmid(:,1)', V_for); %V_for is zero matrix (vertical no. of prisms)x(horizontal no. of prisms)
    grid on
    set(gca,'XAxisLocation','top');
    
    % Remarks:
    % the grid is generate from Xmin to Xmax with x interval dx
    % imagesc show the respective value of mid point of the block
    % i.e. Xmid and Zmid are the mid point of the block

    else
    %Desplay the density of each prisms and with scaled colour bar
    imagesc(Xmid(1,:),Zmid(:,1)', V_for); %V_for is zero matrix (vertical no. of prisms)x(horizontal no. of prisms)
    grid on
    set(gca,'XAxisLocation','top', 'XTick',xspace, 'YTick',zspace);

    % Remarks:
    % the grid is generate from Xmin to Xmax with x interval dx
    % i.e. xspace and zspace are the interval of x, y axis
    % imagesc show the respective value of mid point of the block
    % i.e. Xmid and Zmid are the mid point of the block



end

    colorbar('southoutside') % clolur bar on the bottom
    [selected_prisms,xi,yi]=roipoly;
    % selected_prisms is a matrix of elements 0 or 1 only
    % 1 represent that elements  is inside the selected polygonal area, 0 not selected






function edit_for_rho_Callback(hObject, eventdata, handles)
% hObject    handle to edit_for_rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_for_rho as text
%        str2double(get(hObject,'String')) returns contents of edit_for_rho as a double


% --- Executes during object creation, after setting all properties.
function edit_for_rho_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_for_rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in pushbutton_add.
function pushbutton_add_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global rho V_for selected_prisms Xmid Zmid xspace zspace axes_dense colour_map
rho=str2double(get(handles.edit_for_rho,'string'));
V_for=rho*selected_prisms+V_for; % add the density of the newly selected prisms to old one

% Visualize the selected block in the lower panel


if strcmp(axes_dense,'off')==1    % compare if axes_dense = 'off', if yes return 1
    
    axes(handles.axes_grid); %specify the axes
    imagesc(Xmid(1,:),Zmid(:,1)',V_for);   %display matrix as image, but with scaled bar
    set(gca,'XAxisLocation','top');
   
else
    
    axes(handles.axes_grid); %specify the axes
    imagesc(Xmid(1,:),Zmid(:,1)',V_for);   %display matrix as image, but with scaled bar
    set(gca,'XAxisLocation','top','XTick',xspace, 'YTick',zspace);
    
end


if strcmp(colour_map,'standardized')==1
    
    load invG_colormap.mat
    colormap(mycamp);
    caxis([-300 300])
    colorbar('southoutside')
    axis('ij');
    grid on
    
else
    
    grid on
    colormap('default')
    colorbar('southoutside')
    axis('ij');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%% Compute %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Executes on button press in pushbutton_compute.
function pushbutton_compute_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_compute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global xx num_model A V_for G_obs G_model free_air gFA

kernel

V=reshape(V_for,num_model,1); 
%reshape V_for to (nx1) matrix
%V_for: column=no. of vertical block; row=no. of horizontal block
%V: column=no. of model= (no. of vertical block)x(no. of horizontal block)

G_model=A*V;  %modelled gravity anomaly (mx1) matrix

if strcmp(free_air,'on')==1
    G_model=G_model+gFA;
end
    
%plot the modelled gravity
axes(handles.axes_plot);
plot(xx, G_model,'r',xx, G_obs,'*');
grid on
xx_min=min(xx); xx_max=max(xx);
xlim([xx_min xx_max]);
ylabel('Gravity effect (mGal)');
legend('modelled anomaly', 'observed data');



%plot(xx, G_model);
%grid on
%ylabel('Gravity effect (mGal)');
%legend('modelled anomaly');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Menu %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% File %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function load_open_Callback(hObject, eventdata, handles)
% hObject    handle to load_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opentxt;

%Plot observed gravity data on axes_plot
axes(handles.axes_plot);
plot(xx, G_obs,'*');
xlim([xx_min xx_max]);
grid on
legend('observed gravity data');


% --------------------------------------------------------------------
function load_model_Callback(hObject, eventdata, handles)
% hObject    handle to load_model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function newProfile_Callback(hObject, eventdata, handles)
% hObject    handle to newProfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global xx_min xx_max xx G_obs prof_l num_data
% Creat a pop-up dialog box asking for the 
prompt = {'Xmin (m)','Xmax (m)','Number of data point'};
dlg_title = 'Profile length';
num_lines = 1;
defAns={'-20000','20000','100'};
answer=inputdlg(prompt, dlg_title, num_lines, defAns);
xx_min=str2double(answer(1));
xx_max=str2double(answer(2));
num_data=str2double(answer(3));
xx=linspace(xx_min,xx_max)';
G_obs=zeros(numel(xx),1);

%Plot observed gravity data on axes_plot
axes(handles.axes_plot);
plot(xx, G_obs,'*');
xlim([xx_min xx_max]);
grid on
legend('Observed gravity data');

prof_l=xx_max-xx_min;

% --------------------------------------------------------------------
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
savetxt;

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exit %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function main_Callback(hObject, eventdata, handles)
% hObject    handle to main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
invG;
close ('Forward');

% --------------------------------------------------------------------
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close ('Forward');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)








% --------------------------------------------------------------------
function inversion_Callback(hObject, eventdata, handles)
% hObject    handle to inversion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Inversion
close ('Forward');


%%%%%%%%%%%%%% Menu: Free air correction %%%%%%%%%%%%%%%%%%%%%%%%%%

% --------------------------------------------------------------------
function FACorrection_Callback(hObject, eventdata, handles)
% hObject    handle to FACorrection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function surveyProf_Callback(hObject, eventdata, handles)
% hObject    handle to surveyProf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xx gFA
axes(handles.axes_grid);  %specify which axes
[xprof,yprof]=ginput;  
% ginput return the x,y coordinate, of selected point
% this function is terminated by pressing 'Enter' in keyboard
% xprof, yprof stand for x,y coordinate of profile 
height=interp1q(xprof,yprof,xx);
gFA=0.3086*height;




% --------------------------------------------------------------------
function calculateFA_Callback(hObject, eventdata, handles)
% hObject    handle to calculateFA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xx gFA G_model G_obs free_air

%plot the modelled gravity with addition of free air correction

%axes(handles.axes_plot);
%G_model=G_model-gFA;
%plot(xx, G_model,'r',xx, G_obs,'*');
%grid on
%xx_min=min(xx); xx_max=max(xx);
%xlim([xx_min xx_max]);
%ylabel('Gravity effect with free air correction (mGal)');
%legend('modelled anomaly', 'observed data');

figure
plot(xx,gFA);
xlabel('x(m)'); ylabel('Free air correction (mGal)');

free_air='on';

% --------------------------------------------------------------------
function removeFA_Callback(hObject, eventdata, handles)
% hObject    handle to removeFA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global xx gFA G_model G_obs free_air

%plot the modelled gravity with addition of free air correction
%axes(handles.axes_plot);
%G_model=G_model+gFA;
%plot(xx, G_model,'r',xx, G_obs,'*');
%grid on
%xx_min=min(xx); xx_max=max(xx);
%xlim([xx_min xx_max]);
%ylabel('Gravity effect (mGal)');
%legend('modelled anomaly', 'observed data');

free_air='off';
%%%%%%%%%%%%%% End: Free air correction %%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%% Menu: Display %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --------------------------------------------------------------------
function display_Callback(hObject, eventdata, handles)
% hObject    handle to display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function axis_dense_Callback(hObject, eventdata, handles)
% hObject    handle to axis_dense (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rho V_for selected_prisms Xmid Zmid xspace zspace axes_dense
axes(handles.axes_grid); %specify the axes
set(gca,'XAxisLocation','top','XTick',xspace, 'YTick',zspace);
axes_dense = 'on';


% --------------------------------------------------------------------
function axis_dense_off_Callback(hObject, eventdata, handles)
% hObject    handle to axis_dense_off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global V_for Xmid Zmid axes_dense colour_map
axes(handles.axes_grid); %specify the axes
imagesc(Xmid(1,:),Zmid(:,1)',V_for);   %display matrix as image, but with scaled bar
set(gca,'XAxisLocation','top');
grid on

if strcmp(colour_map,'default')==1
    
    colourmap('default')
    colorbar('southoutside')
    axis('ij');
else
    
    load invG_colormap.mat
    colormap(mycamp);
    caxis([-300 300])
    colorbar('southoutside')
    axis('ij');
end

axes_dense = 'off';


% --------------------------------------------------------------------
function default_calour_map_Callback(hObject, eventdata, handles)
% hObject    handle to default_calour_map (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Xmid Zmid V_for xspace zspace colour_map axes_dense
axes(handles.axes_grid); % specify the following change will be made on axes_grid
imagesc(Xmid(1,:),Zmid(:,1)',V_for);   %display matrix as image, but with scaled bar

if strcmp(axes_dense,'off')==1
    set(gca,'XAxisLocation','top');
else
    set(gca,'XAxisLocation','top','XTick',xspace, 'YTick',zspace);
end

grid on
colormap('default')
colorbar('southoutside')
axis('ij');

colour_map='default';

% --------------------------------------------------------------------
function std_colour_map_Callback(hObject, eventdata, handles)
% hObject    handle to std_colour_map (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Xmid Zmid V_for xspace zspace colour_map axes_dense
axes(handles.axes_grid); % specify the following change will be made on axes_grid
imagesc(Xmid(1,:),Zmid(:,1)',V_for);   %display matrix as image, but with scaled bar

if strcmp(axes_dense,'off')==1
    set(gca,'XAxisLocation','top');
else
    set(gca,'XAxisLocation','top','XTick',xspace, 'YTick',zspace);
end


load invG_colormap.mat
colormap(mycamp);
caxis([-300 300])
colorbar('southoutside')
axis('ij');
grid on

colour_map='standardized';
