function self = interval_view(varargin)
% interval_view - a graphical observer of an interval. It plots the start
% and end of the interval and displays the length. For simplicity it does
% not handle intervals with start > end
% Arne Jenssen, ajj@ffi.no
self.window = figure('units','pixels','position',[300 300 320 150]);

if nargin == 1
    self.subject = varargin{1};
else
    self.subject = [];
end

    function update()
        s = self.subject.get_start();       
        e = self.subject.get_end();
        l= self.subject.get_length();
        plot_interval(s,e,l);
    end
    function plot_interval(s,e,l)
        figure(self.window);
        plot([s e],[1 1],'linewidth',2)
        text(s,1.2,num2str(s))
        text(e,1.2,num2str(e))
        text((e+s)/2,1.2,['l=' num2str(l)]);
        axis([s-0.1*l e+0.1*l 0 2])
    end

    function set_subject(s)
        self.subject = s;
    end

self.update = @update;
self.set_subject = @set_subject;
end