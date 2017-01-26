function varargout = Synthetic(varargin)
% SYNTHETIC MATLAB code for Synthetic.fig
%      SYNTHETIC, by itself, creates a new SYNTHETIC or raises the existing
%      singleton*.
%
%      H = SYNTHETIC returns the handle to a new SYNTHETIC or the handle to
%      the existing singleton*.
%
%      SYNTHETIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SYNTHETIC.M with the given input arguments.
%
%      SYNTHETIC('Property','Value',...) creates a new SYNTHETIC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Synthetic_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Synthetic_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Synthetic

% Last Modified by GUIDE v2.5 24-Apr-2015 23:04:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Synthetic_OpeningFcn, ...
                   'gui_OutputFcn',  @Synthetic_OutputFcn, ...
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


% --- Executes just before Synthetic is made visible.
function Synthetic_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Synthetic (see VARARGIN)

% Choose default command line output for Synthetic
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Synthetic wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%%%%%%%%%%%%%%%%%%%%  Set the default example as 'dyke'%%%%%%%%%%%%%%%%%%%%  %%%%%%%%%%%%%%%%%%%%%%
global source_body
source_body='Dyke';




% --- Outputs from this function are returned to the command line.
function varargout = Synthetic_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%%%%%%%%%%%%%%%%%%%%% Panel1: 2D Dyke %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_D_x1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_D_x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_D_x1 as text
%        str2double(get(hObject,'String')) returns contents of edit_D_x1 as a double


% --- Executes during object creation, after setting all properties.
function edit_D_x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_D_x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_D_x2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_D_x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_D_x2 as text
%        str2double(get(hObject,'String')) returns contents of edit_D_x2 as a double


% --- Executes during object creation, after setting all properties.
function edit_D_x2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_D_x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_D_x3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_D_x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_D_x3 as text
%        str2double(get(hObject,'String')) returns contents of edit_D_x3 as a double


% --- Executes during object creation, after setting all properties.
function edit_D_x3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_D_x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_D_x4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_D_x4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_D_x4 as text
%        str2double(get(hObject,'String')) returns contents of edit_D_x4 as a double


% --- Executes during object creation, after setting all properties.
function edit_D_x4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_D_x4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_D_z1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_D_z1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_D_z1 as text
%        str2double(get(hObject,'String')) returns contents of edit_D_z1 as a double


% --- Executes during object creation, after setting all properties.
function edit_D_z1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_D_z1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_D_z2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_D_z2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_D_z2 as text
%        str2double(get(hObject,'String')) returns contents of edit_D_z2 as a double


% --- Executes during object creation, after setting all properties.
function edit_D_z2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_D_z2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_D_rho_Callback(hObject, eventdata, handles)
% hObject    handle to edit_D_rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_D_rho as text
%        str2double(get(hObject,'String')) returns contents of edit_D_rho as a double


% --- Executes during object creation, after setting all properties.
function edit_D_rho_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_D_rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_D_Xmin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_D_rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_D_rho as text
%        str2double(get(hObject,'String')) returns contents of edit_D_rho as a double


% --- Executes during object creation, after setting all properties.
function edit_D_Xmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_D_rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_D_Xmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_D_Xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_D_Xmax as text
%        str2double(get(hObject,'String')) returns contents of edit_D_Xmax as a double


% --- Executes during object creation, after setting all properties.
function edit_D_Xmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_D_Xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%% End Panel 1: 2D Dyke %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%% Panel 2: Sphere %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Panel 2 is default 'Visible' off


function edit_S_Xmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_S_Xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_S_Xmax as text
%        str2double(get(hObject,'String')) returns contents of edit_S_Xmax as a double


% --- Executes during object creation, after setting all properties.
function edit_S_Xmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_S_Xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_S_Xmin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_S_Xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_S_Xmin as text
%        str2double(get(hObject,'String')) returns contents of edit_S_Xmin as a double


% --- Executes during object creation, after setting all properties.
function edit_S_Xmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_S_Xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_S_rho_Callback(hObject, eventdata, handles)
% hObject    handle to edit_S_rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_S_rho as text
%        str2double(get(hObject,'String')) returns contents of edit_S_rho as a double


% --- Executes during object creation, after setting all properties.
function edit_S_rho_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_S_rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_S_R_Callback(hObject, eventdata, handles)
% hObject    handle to edit_S_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_S_R as text
%        str2double(get(hObject,'String')) returns contents of edit_S_R as a double


% --- Executes during object creation, after setting all properties.
function edit_S_R_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_S_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_S_z_Callback(hObject, eventdata, handles)
% hObject    handle to edit_S_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_S_z as text
%        str2double(get(hObject,'String')) returns contents of edit_S_z as a double


% --- Executes during object creation, after setting all properties.
function edit_S_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_S_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%% End Panel 2: Sphere %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%% Panel3: Fault %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edit_F_x1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_F_x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_F_x1 as text
%        str2double(get(hObject,'String')) returns contents of edit_F_x1 as a double


% --- Executes during object creation, after setting all properties.
function edit_F_x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_F_x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_F_x2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_F_x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_F_x2 as text
%        str2double(get(hObject,'String')) returns contents of edit_F_x2 as a double


% --- Executes during object creation, after setting all properties.
function edit_F_x2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_F_x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_F_z1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_F_z1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_F_z1 as text
%        str2double(get(hObject,'String')) returns contents of edit_F_z1 as a double


% --- Executes during object creation, after setting all properties.
function edit_F_z1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_F_z1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_F_z2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_F_z2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_F_z2 as text
%        str2double(get(hObject,'String')) returns contents of edit_F_z2 as a double


% --- Executes during object creation, after setting all properties.
function edit_F_z2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_F_z2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_F_rho_Callback(hObject, eventdata, handles)
% hObject    handle to edit_F_rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_F_rho as text
%        str2double(get(hObject,'String')) returns contents of edit_F_rho as a double


% --- Executes during object creation, after setting all properties.
function edit_F_rho_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_F_rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_F_Xmin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_F_Xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_F_Xmin as text
%        str2double(get(hObject,'String')) returns contents of edit_F_Xmin as a double


% --- Executes during object creation, after setting all properties.
function edit_F_Xmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_F_Xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_F_Xmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_F_Xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_F_Xmax as text
%        str2double(get(hObject,'String')) returns contents of edit_F_Xmax as a double


% --- Executes during object creation, after setting all properties.
function edit_F_Xmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_F_Xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%% End Panel 3: Fault %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on button press in pushbutton_compute.
function pushbutton_compute_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_compute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Creat global variable for inverison
global x g source_body

switch source_body

    case 'Dyke'
        %% Obtain input variables
        x1=str2double(get(handles.edit_D_x1,'string'));
        x2=str2double(get(handles.edit_D_x2,'string'));
        x3=str2double(get(handles.edit_D_x3,'string'));
        x4=str2double(get(handles.edit_D_x4,'string'));
        z1=str2double(get(handles.edit_D_z1,'string'));
        z2=str2double(get(handles.edit_D_z2,'string'));
        rho=str2double(get(handles.edit_D_rho,'string'));
        Xmin=str2double(get(handles.edit_D_Xmin,'string'));
        Xmax=str2double(get(handles.edit_D_Xmax,'string'));
        
        %% Calculate gravity anomaly by grav_dyke function
        x=linspace(Xmin,Xmax);
        g=grav_dyke( x1,x2,x3,x4,z1,z2,rho,Xmin,Xmax);
        
        
        %% Plot gravity anomaly signals
        axes(handles.axes_plot);  % specify the axes with tag axes_plot (upper one)
        plot(x,g);
        grid on;
        xlabel('space(km)'); ylabel('gravity anomaly(mgal)');
        title('Gravity anomaly of a Dip Thick dike');
        
        %% Visualize the dyke
        xmin=min(x);
        xmax=max(x);
        zmax=abs(xmin);  % define the max depth
        t=z2-z1;
        axes(handles.axes_show);  % specify the axes with tag axes_show (lower one)
        
        x_area=[x1 x1 x3 x4; x2 x3 x4 x2];
        z_area=[z1 z1 z1 z2; z2 z1 z2 z2];
        plot(x_area,z_area,'b');
        legend('Cross sectional area of anomalous mass');
        ylabel('depth (km)');
        grid on;
        axis([xmin xmax 0 zmax]);
        set(gca, 'YDir', 'reverse');  % positive axis point downwards
        set(gca, 'XAxisLocation', 'top'); % label of x axis on top
        
        
        %add_plot( x1,x3,z1,z2,x,g );

        x=x*1000; %convert from km to m
        
        
        
    case 'Sphere'
        %% Load parameters
        z=str2double(get(handles.edit_S_z,'string'));
        rho=str2double(get(handles.edit_S_rho,'string'));
        R=str2double(get(handles.edit_S_R,'string'));
        Xmin=str2double(get(handles.edit_S_Xmin,'string'));
        Xmax=str2double(get(handles.edit_S_Xmax,'string'));
        
        
        %% Calculateion
        x=linspace(Xmin,Xmax);
        g=grav_sphere(z,rho,R,Xmin,Xmax);
        
        
        %% Plot gravity anomaly signals
        axes(handles.axes_plot);  % specify the axes with tag axes_plot (upper one)
        
        plot(x, g);
        grid on;
        ylabel('Gravity anomaly (mgal)'); xlabel('X (m)');
        title(['Gravity anomaly of Sphere with center at ', num2str(z), ' (m) below surface']);
        
        
        %% Visualize the Sphere
        axes(handles.axes_show); % specify the axes
        xmin=min(x);
        xmax=max(x);
        % define the range of depth for illustration
        zmax=max(abs(x));
        
        
        xx=linspace(-R,R);
        zz_up=(R^2-xx.^2).^(0.5)+z;
        zz_low=-(R^2-xx.^2).^(0.5)+z;
        plot(xx,zz_up,'b-');
        hold on
        plot(xx,zz_low,'b-');
        hold off
        
        legend('Cross sectional area of anomalous mass');
        ylabel('depth (m)');
        grid on;
        axis([xmin xmax 0 zmax]);
        set(gca, 'YDir', 'reverse');  % positive axis point downwards
        set(gca, 'XAxisLocation', 'top'); % label of x axis on top

        

    case 'Fault'
        %% Obtain input variables
        x1=str2double(get(handles.edit_F_x1,'string'));
        x2=str2double(get(handles.edit_F_x2,'string'));
        z1=str2double(get(handles.edit_F_z1,'string'));
        z2=str2double(get(handles.edit_F_z2,'string'));
        rho=str2double(get(handles.edit_F_rho,'string'));
        Xmin=str2double(get(handles.edit_F_Xmin,'string'));
        Xmax=str2double(get(handles.edit_F_Xmax,'string'));
        
        %% Calculate gravity anomaly by grav_dyke function
        x=linspace(Xmin,Xmax);
        g=grav_fault( x1,x2,z1,z2,rho,Xmin,Xmax);
        
        
        %% Plot gravity anomaly signals
        axes(handles.axes_plot);  % specify the axes with tag axes_plot (upper one)
        plot(x,g);
        grid on;
        xlabel('space(km)'); ylabel('gravity anomaly(mgal)');
        title('Gravity anomaly of a Dip Thick dike');
        
        %% Visualize the dyke
        xmin=min(x);
        xmax=max(x);
        zmax=max(abs(x));  % define the max depth
        
        axes(handles.axes_show);  % specify the axes with tag axes_show (lower one)
        
        x_area=[x1 x1 xmax; x2 xmax x2];
        z_area=[z1 z1 z2; z2 z1 z2];
        plot(x_area,z_area,'b');
        legend('Cross sectional area of anomalous mass');
        ylabel('depth (km)');
        grid on;
        axis([xmin xmax 0 zmax]);
        set(gca, 'YDir', 'reverse');  % positive axis point downwards
        set(gca, 'XAxisLocation', 'top'); % label of x axis on top
        

        x=x*1000; %convert from km to m
        





end


x=x';
g=g';



% --- Executes on button press in pushbutton_inversion.
function pushbutton_inversion_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_inversion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global synthetic
synthetic = 'Yes';
Inversion   % go to inversion menu





































% --------------------------------------------------------------------
function Examples_Callback(hObject, eventdata, handles)
% hObject    handle to Examples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function main_Callback(hObject, eventdata, handles)
% hObject    handle to main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
invG
close('Synthetic');

% --------------------------------------------------------------------
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close('Synthetic');

% --------------------------------------------------------------------
function Sphere_Callback(hObject, eventdata, handles)
% hObject    handle to Sphere (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global source_body
source_body='Sphere';
set(handles.uipanel_dyke, 'Visible', 'off');
set(handles.uipanel_sphere, 'Visible', 'on');
set(handles.uipanel_fault, 'Visible', 'off');

% --------------------------------------------------------------------
function Cyclinder_Callback(hObject, eventdata, handles)
% hObject    handle to Cyclinder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function dyke_Callback(~, eventdata, handles)
% hObject    handle to dyke (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global source_body
source_body='Dyke';
set(handles.uipanel_sphere, 'Visible', 'off');
set(handles.uipanel_dyke, 'Visible', 'on');
set(handles.uipanel_fault, 'Visible', 'off');

% --------------------------------------------------------------------
function fault_Callback(hObject, eventdata, handles)
% hObject    handle to fault (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global source_body
source_body='Fault';
set(handles.uipanel_sphere, 'Visible', 'off');
set(handles.uipanel_dyke, 'Visible', 'off');
set(handles.uipanel_fault, 'Visible', 'on');


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global x g
[FileName,PathName] = uiputfile('*.txt','Save File');
local_path=pwd;

head1='X[m]';
head2='Data[mGal]';
header=strcat(head1, '\t', head2);

cd(PathName);
fid = fopen(FileName,'w');
fprintf(fid, header, 'newline', 'pc');
fclose(fid);
dlmwrite(FileName, [x,g], 'newline','pc', 'delimiter','\t', '-append', 'roffset',1, 'precision','%.3f');
cd(local_path);
