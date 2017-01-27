function varargout = invG(varargin)
% INVG MATLAB code for invG.fig
%      INVG, by itself, creates a new INVG or raises the existing
%      singleton*.
%
%      H = INVG returns the handle to a new INVG or the handle to
%      the existing singleton*.
%
%      INVG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INVG.M with the given input arguments.
%
%      INVG('Property','Value',...) creates a new INVG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before invG_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to invG_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help invG

% Last Modified by GUIDE v2.5 25-Jan-2017 17:45:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @invG_OpeningFcn, ...
                   'gui_OutputFcn',  @invG_OutputFcn, ...
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


% --- Executes just before invG is made visible.
function invG_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to invG (see VARARGIN)

% Choose default command line output for invG
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes invG wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% Clear memory
clc; clear all;


% --- Outputs from this function are returned to the command line.
function varargout = invG_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_forward.
function pushbutton_forward_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global inver
inver= 'No';
Forward
close ('invG');

% --- Executes on button press in pushbutton_extract.
function pushbutton_extract_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_extract (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Extract
close ('invG');

% --- Executes on button press in pushbutton_inversion.
function pushbutton_inversion_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_inversion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global synthetic
synthetic = 'No';
Inversion
close ('invG');

% --- Executes on button press in pushbutton_synthetic.
function pushbutton_synthetic_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_synthetic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Synthetic
close ('invG');
