function self = interval_window(varargin)
% interval_window - an observer of interval that lets the user manipulate
% the interval through a simple GUI

self.window = figure('units','pixels','position',[100 100 320 150]);

container = uigridcontainer('gridsize',[4,2],'parent',self.window,...
    'HorizontalWeight',[0.4 0.6],'margin',5,'VerticalWeight',[1 1 1 1]);
label_start = uicontrol('style','text','parent',container,...
    'string','Start:','HorizontalAlignment','right');
field_start = uicontrol('style','edit','parent',container,...
    'callback',@cb_start,'HorizontalAlignment','left');

label_end = uicontrol('style','text','parent',container,...
    'string','End:','HorizontalAlignment','right');
field_end = uicontrol('style','edit','parent',container,...
    'callback',@cb_end,'HorizontalAlignment','left');

label_length = uicontrol('style','text','parent',container,...
    'string','Length:','HorizontalAlignment','right');
field_length = uicontrol('style','edit','parent',container,...
    'callback',@cb_length,'HorizontalAlignment','left');
button = uicontrol('style','pushbutton','String',...
    'Close','parent',container,'callback',@cb_close);

handles = [label_start field_start label_end field_end ...
    label_length field_length button];

if nargin == 1
    self.subject = varargin{1};
else
    self.subject = [];
end

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

    function set_fontsize(s)
        set(handles,'fontsize',s)
    end

set_fontsize(15);
self.update = @update;
self.set_subject = @set_subject;
self.set_fontsize = @set_fontsize;
end