function varargout = RK2MethodGUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RK2MethodGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @RK2MethodGUI_OutputFcn, ...
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

function RK2MethodGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = RK2MethodGUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

image1Array=imread('fcn.jpg');
imshow(image1Array, 'Parent', handles.fcn);


function altSinir_Callback(hObject, eventdata, handles)

function altSinir_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ustSinir_Callback(hObject, eventdata, handles)

function ustSinir_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function startValue_Callback(hObject, eventdata, handles)

function startValue_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nValue_Callback(hObject, eventdata, handles)

function nValue_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calculate_Callback(hObject, eventdata, handles)
cla(handles.axes);
% Ödevde verilen fonksiyonu oluþturdum.
f=inline('x+2*x*y-1');
% Ödevde sabit deðerler verilmiþ fakat deðiþtirilebilir olmasý için
% kullanýcý giriþi saðladým.
altSinir=str2double(get(handles.altSinir,'string'));
ustSinir=str2double(get(handles.ustSinir,'string'));
startValue=str2double(get(handles.startValue,'string'));
nValue=str2double(get(handles.nValue,'string'));

% Fonksiyonu iþleme kattým.
[x,y]=RK2_Midpt(f,[altSinir,ustSinir],startValue,nValue);

for i=1:1:nValue+1
    % Verileri tabloya yazmak için data dizisi oluþturdum.
    data(i,1)=x(i);
    data(i,2)=y(i);
    % Anlýk grafiðe çizdirdim.
    plot(handles.axes,x(i),y(i),'*');
    xlabel('x(i)');
    ylabel('y(i)');
    hold on
    grid on
    datacursormode on
    
end
% Tabloyu doldurdum.
set(handles.dataTable,'data',data);
