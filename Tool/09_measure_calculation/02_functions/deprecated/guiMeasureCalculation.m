function varargout = guiMeasureCalculation(varargin)
% GUIMEASURECALCULATION MATLAB code for guiMeasureCalculation.fig
%      GUIMEASURECALCULATION, by itself, creates a new GUIMEASURECALCULATION or raises the existing
%      singleton*.
%
%      H = GUIMEASURECALCULATION returns the handle to a new GUIMEASURECALCULATION or the handle to
%      the existing singleton*.
%
%      GUIMEASURECALCULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIMEASURECALCULATION.M with the given input arguments.
%

%      GUIMEASURECALCULATION('Property','Value',...) creates a new GUIMEASURECALCULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiMeasureCalculation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiMeasureCalculation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiMeasureCalculation

% Last Modified by GUIDE v2.5 17-Jun-2017 16:28:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiMeasureCalculation_OpeningFcn, ...
                   'gui_OutputFcn',  @guiMeasureCalculation_OutputFcn, ...
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


% --- Executes just before guiMeasureCalculation is made visible.
function guiMeasureCalculation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiMeasureCalculation (see VARARGIN)

% Choose default command line output for guiMeasureCalculation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
gui_path = which('guiMeasureCalculation');
slash_id=strfind(gui_path,'\');
gui_path(slash_id(end):end)=[];
cd(gui_path);
cd ..\..
currentfolder = pwd;


addpath(genpath(currentfolder));
sqlite_path = which('sqlite-jdbc-3.8.6.jar');
javaaddpath(sqlite_path);

cd(gui_path);
% UIWAIT makes guiMeasureCalculation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiMeasureCalculation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loadDatabase.
function loadDatabase_Callback(hObject, eventdata, handles)
% hObject    handle to loadDatabase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fileName = fcn_load_database();
set(handles.databaseFileTxt,'String',strcat('Database file : ',fileName));



% --- Executes on button press in basisButton.
function basisButton_Callback(hObject, eventdata, handles)
% hObject    handle to basisButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
licenceStr = get(handles.editLicence,'String');
wheelStr = get(handles.editWheel,'String');
pedalStr = get(handles.editPedal,'String');
downforceStr = get(handles.editDownforce,'String');
fcn_missingCoordinates(licenceStr,wheelStr,pedalStr,downforceStr);
msgbox('Inputs saved','Success');



% --- Executes on button press in calculateButton.
function calculateButton_Callback(hObject, eventdata, handles)
% hObject    handle to calculateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fcn_combine_mc();




% --- Executes during object creation, after setting all properties.
function editLicence_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editLicence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function editWheel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editWheel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






% --- Executes during object creation, after setting all properties.
function editPedal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPedal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes during object creation, after setting all properties.
function editDownforce_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDownforce (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
