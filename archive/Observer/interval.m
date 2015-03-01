function self = interval(s, e, l)
% interval(start, end, length) creates an interval. It is a subject and
% several observers can be attatched
% Example:
% i1 = interval(2,8,6);
% iw1 = interval_window();
% i1.attach_observer(iw1);
%
% % Arne Jenssen, ajj@ffi.no

self.start = s;
self.end = e ;
self.length = l;
self.observers = {};

    function attach_observer(o)
        self.observers ={self.observers{:} o};
        o.set_subject(self);
        o.update()
    end

    function notify()
        for k = 1:length(self.observers)
            self.observers{k}.update();
        end
    end

    function set_start(s)
        self.start = s;
        notify();
    end

    function set_length(l)
        self.length = l;
        notify();
    end

    function set_end(e)
        self.end = e;
        notify();
    end

    function calculate_end()
        e = self.start + self.length;
        set_end(e);
    end

    function calculate_length()
        l = self.end -self.start;
        set_length(l);
    end
        
    function print()
        display(self);
    end
    function s = get_start()        
        s = self.start;
    end
        
    function e = get_end()
        e = self.end;
    end

    function l = get_length()
        l = self.length;
    end

self.attach_observer = @attach_observer;
self.get_start = @get_start;
self.get_end = @get_end;
self.get_length = @get_length;
self.set_start = @set_start;
self.set_length = @set_length;
self.set_end = @set_end;
self.calculate_end = @calculate_end;
self.calculate_length = @calculate_length;
self.print = @print;
end