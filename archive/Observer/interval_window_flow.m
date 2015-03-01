function self = interval_window_flow(varargin)
% interval_window_flow - An observer of an interval
% Example:
% i1 = interval(2,8,6);
% iw1 = interval_window_flow();
% iw2 = interval_window_flow();
% i1.attach_observer(iw1);
% i1.attach_observer(iw2);

self.window = figure('units','pixels','position',[300 100 320 150]);
container = uiflowcontainer('parent',self.window,'flowdirection','lefttoright');
container_left = uiflowcontainer('parent',container,'flowdirection','topdown');
container_right = uiflowcontainer('parent',container,'flowdirection','topdown');
label_start = uicontrol('style','text','parent',container_left,...
    'string','Start:','HorizontalAlignment','right');
field_start = uicontrol('style','edit','parent',container_right,...
    'callback',@cb_start,'HorizontalAlignment','left','backgroundcolor','white');

label_end = uicontrol('style','text','parent',container_left,...
    'string','End:','HorizontalAlignment','right');
field_end = uicontrol('style','edit','parent',container_right,...
    'callback',@cb_end,'HorizontalAlignment','left', 'backgroundcolor','white');

label_length = uicontrol('style','text','parent',container_left,...
    'string','Length:','HorizontalAlignment','right');
field_length = uicontrol('style','edit','parent',container_right,...
    'callback',@cb_length,'HorizontalAlignment','left','backgroundcolor','white');
button = uicontrol('style','pushbutton','String','Close','parent',container,...
    'callback',@cb_close);

handles = [label_start field_start label_end field_end ...
    label_length field_length button];

set(handles,'heightLimits', [20 30]);%'widthlimits',[40 180])

if nargin == 1
    self.subject = varargin{1};
else
    self.subject = [];
end

set_fontsize(15);



    function update
        s = self.subject.get_start();
        set(field_start,'String',num2str(s));
        e = self.subject.get_end();
        set(field_end,'String',num2str(e));
        l= self.subject.get_length();
        set(field_length,'String',num2str(l));
    end

    function cb_start(varargin)
        s = str2double(get(field_start,'String'));
        self.subject.set_start(s);
        self.subject.calculate_length();
    end

    function cb_end(varargin)
        e = str2double(get(field_end,'String'));
        self.subject.set_end(e);
        self.subject.calculate_length();
    end

    function cb_length(varargin)
        l = str2double(get(field_length,'String'));
        self.subject.set_length(l);
        self.subject.calculate_end();
    end
    function cb_close(varargin)
        close(self.window);
    end

    function set_subject(s)
        self.subject = s;
    end

    function set_fontsize(fs)
        set(handles,'fontsize',fs)
    end


self.update = @update;
self.set_subject = @set_subject;
self.set_fontsize = @set_fontsize;
end