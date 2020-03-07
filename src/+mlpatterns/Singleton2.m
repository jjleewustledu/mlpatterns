classdef (Abstract) Singleton2 < handle
    %% SINGLETON2
    %  Adapted from classes Singleton and SingletonImpl by Bobby Nedelkovski of
    %  The MathWorks Australia Pty, Ltd.
    %  Copyright 2009, The MathWorks, Inc.
    
    methods (Static, Abstract)
        this = instance(varargin)
        %% INSTANCE
        %  @param optional qualifier is char \in {'initialize' ''}
        % 
        % ip = inputParser;
        % addOptional(ip, 'qualifier', '', @ischar)
        % parse(ip, varargin{:})
        % 
        % persistent uniqueInstance
        % if (strcmp(ip.Results.qualifier, 'initialize'))
        %     uniqueInstance = [];
        % end
        % if (isempty(uniqueInstance))
        %     this = mlpatterns.Singleton2();
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
