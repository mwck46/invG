function varargout = savedensity(varargin)
% SAVEDENSITY MATLAB code for savedensity.fig
%      SAVEDENSITY, by itself, creates a new SAVEDENSITY or raises the existing
%      singleton*.
%
%      H = SAVEDENSITY returns the handle to a new SAVEDENSITY or the handle to
%      the existing singleton*.
%
%      SAVEDENSITY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAVEDENSITY.M with the given input arguments.
%
%      SAVEDENSITY('Property','Value',...) creates a new SAVEDENSITY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before savedensity_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to savedensity_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help savedensity

% Last Modified by GUIDE v2.5 01-May-2015 21:59:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @savedensity_OpeningFcn, ...
                   'gui_OutputFcn',  @savedensity_OutputFcn, ...
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


% --- Executes just before savedensity is made visible.
function savedensity_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to savedensity (see VARARGIN)

% Choose default command line output for savedensity
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes savedensity wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = savedensity_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_name_Callback(hObject, eventdata, handles)
% hObject    handle to edit_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_name as text
%        str2double(get(hObject,'String')) returns contents of edit_name as a double


% --- Executes during object creation, after setting all properties.
function edit_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_save.
function pushbutton_save_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global V_inv
save(get(handles.edit_name,'string'),'V_inv');
close(savedensity);
