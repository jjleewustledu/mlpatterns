classdef (Abstract) Singleton < handle
    %% SINGLETON
    %  Adapted from classes Singleton and SingletonImpl by Bobby Nedelkovski of
    %  The MathWorks Australia Pty, Ltd.
    %  Copyright 2009, The MathWorks, Inc.
    
    methods (Static, Abstract)
        this = instance()
        % persistent uniqueInstance
        % if isempty(uniqueInstance)
        %     this = mlpatterns.Singleton();
        %     uniqueInstance = this;
        % else
        %     this = uniqueInstance;
        % end
    end
    
    methods (Access = protected)
        function this = Singleton()
            % Guard the constructor against external invocation.  We only want
            % to allow a single instance of this class per description in
            % mlpatterns.AbstractSingleton.
        end
    end
end
