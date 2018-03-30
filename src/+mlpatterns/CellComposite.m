classdef CellComposite < mlpatterns.Composite
	%% CELLCOMPOSITE implements a composite design pattern using cell. 

	%  $Revision$
 	%  was created 14-Jan-2016 22:06:45
 	%  by jjlee,
 	%  last modified $LastChangedDate$
 	%  and checked into repository /Users/jjlee/Local/src/mlcvl/mlpatterns/src/+mlpatterns.
 	%% It was developed on Matlab 9.0.0.307022 (R2016a) Prerelease for MACI64.
 	
	methods
 		function this = CellComposite(varargin)
            if (nargin == 1 && isa(varargin{1}, 'mlpatterns.CellComposite'))
                this.cell_ = varargin{1}.cell_;
                return
            end
            
            ip = inputParser;
            addOptional(ip, 'obj', {}, @iscell);
            parse(ip, varargin{:});            
            this.cell_ = ip.Results.obj;
        end
        
        function this = add(this, varargin)
            this = [this varargin{:}];
        end
        function c    = clone(this)
            c = mlpatterns.CellComposite(this);
        end
        function iter = createIterator(this)
            iter = mlpatterns.CompositeIterator(this);
        end
        function t    = ctranspose(this)
            t = this.cell_';
        end
        function        disp(this)
            disp(this.cell_);
        end
        function idx  = find(this, obj)
            idx = find(cellfun(@(x) isequal(x,obj), this.cell_));
            if (isempty(idx))
                idx = [];
            end
        end
        function obj  = get(this, idx)
            obj = this.cell_{idx};
        end
        function c    = horzcat(this, varargin)
            c = this.cell_;
            for v = 1:length(varargin)
                if (isa(varargin{v}, 'mlpatterns.CellComposite'))
                    c = [c varargin{v}.cell_];
                elseif (iscell(varargin{v}))
                    c = [c  varargin{v} ];
                else
                    c = [c {varargin{v}}]; %#ok<CCAT1> % suppressed for clarity
                end
            end
            c = mlpatterns.CellComposite(c);
        end
        function tf   = isempty(this)
            tf = isempty(this.cell_);
        end
        function tf   = ismember(this, varargin)
            tf = ismember(this.cell_, varargin{:});
        end
        function len  = length(this)
            len = length(this.cell_);
        end
        function this = rm(this, idx)
            this.cell_(idx) = [];
        end
        function s    = csize(this)
            s = size(this.cell_);
        end
        function this = subsasgn(this, S, varargin)
            %% SUBSASGN
            %  See also:  web(fullfile(docroot, 'matlab/matlab_oop/class-with-modified-indexing.html'))
            %             web(fullfile(docroot, 'matlab/ref/numargumentsfromsubscript.html'))
            
            switch (S(1).type)
                case '.'
                    this = builtin('subsasgn', this, S, varargin{:});
                case '{}' 
                    this.cell_ = builtin('subsasgn', this.cell_, S, varargin{:});
                case '()'
                    this.cell_ = builtin('subsasgn', this.cell_, S, varargin{:});
            end
        end
        function varargout = subsref(this, S)
            %% SUBSREF
            %  See also:  web(fullfile(docroot, 'matlab/matlab_oop/class-with-modified-indexing.html'))
            %             web(fullfile(docroot, 'matlab/ref/numargumentsfromsubscript.html'))
            
            switch (S(1).type)
                case '.'
                     varargout = {builtin('subsref', this, S)};
                case '{}'
                     varargout = {builtin('subsref', this.cell_, S)};
                case '()'
                     varargout = {builtin('subsref', this.cell_, S)};
            end
        end
        function t    = transpose(this)
            t = this.cell_.';
        end
        function u    = unique(this, varargin)
            u = unique(this.cell_, varargin{:});
        end
        function c    = vertcat(this, varargin)
            c = this.cell_;
            for v = 1:length(varargin)
                if (isa(varargin{v}, 'mlpatterns.CellComposite'))
                    c = [c; varargin{v}.cell_];
                else
                    c = [c; varargin{v}];
                end
            end
            c = mlpatterns.CellComposite(c);
        end
    end
    
    %% PROTECTED
    
	properties %(Access = protected)
        cell_
    end
    
    %% HIDDEN for testing
    
    properties (Hidden)
        testProperty = 'test-property value'
    end
    
    methods (Hidden)        
        function h = testMethod(~, obj)
            if (exist('obj','var'))
                h = obj;
                return
            end
            h = 'hello, from testMethod';
        end
 	end 

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy
 end

