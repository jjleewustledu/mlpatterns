classdef (Abstract) Singleton2 < handle
    %% SINGLETON2
    %  Adapted from classes Singleton and SingletonImpl by Bobby Nedelkovski of
    %  The MathWorks Australia Pty, Ltd.
    %  Copyright 2009, The MathWorks, Inc.
    
    methods (Static, Abstract)
        this = instance(reset)
        % arguments
        %     reset = []
        % end
        % persistent uniqueInstance
        % if ~isempty(reset)
        %     uniqueInstance = [];
        % end
        % if (isempty(uniqueInstance))
        %     this = mlvg.Ccir1211Registry();
        %     uniqueInstance = this;
        % else
        %     this = uniqueInstance;
        % end      
    end
    
    methods (Access = protected)
        function this = Singleton2()
            % Guard the constructor against external invocation.  We only want
            % to allow a single instance of this class per description in
            % mlpatterns.AbstractSingleton.
        end
    end
end
