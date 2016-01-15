classdef GraphComposite < mlpatterns.CellComposite
	%% GRAPHCOMPOSITE implements a composite design pattern by one-to-one correspondence
    %  of elements of a cell array with nodes of a graph.
    
	%  $Revision$
 	%  was created 14-Jan-2016 17:34:02
 	%  by jjlee,
 	%  last modified $LastChangedDate$
 	%  and checked into repository /Users/jjlee/Local/src/mlcvl/mlpatterns/src/+mlpatterns.
 	%% It was developed on Matlab 9.0.0.307022 (R2016a) Prerelease for MACI64.
	    
    properties (Dependent)
        Edges
        Nodes
    end
    
    methods %% GET
        function g = get.Edges(this)
            g = this.graph_.Edges;
        end
        function g = get.Nodes(this)
            g = this.graph_.Nodes;
        end
    end
    
    methods
        function this = GraphComposite(varargin)
            this = this@mlpatterns.CellComposite(varargin{:});
            ip = inputParser;
            addOptional(ip, 'nodes', {},           @iscell);
            addOptional(ip, 'graph', this.graph__, @(x) isa(x, 'graph'));
            parse(ip, varargin{:});
            
            this.graph_ = ip.Results.graph;
            if (length(this.cell_) > numnodes(this.graph_))
                this.graph_ = addnode(this.graph_, ...
                                      length(this.cell_) - numnodes(this.graph_));
            end
        end
        
        function        disp(this)
            disp(this.cell_);
            disp(this.graph_);
        end  
        function obj  = horzcat(this, varargin)
            c = this.cell_;
            g = this.graph_;
            for v = 1:length(varargin)
                if (isa(varargin{v}, 'mlpatterns.GraphComposite'))
                    c = [c varargin{v}.cell_];
                    g = addnode(g, varargin{v}.graph_.Nodes);
                elseif (isa(varargin{v}, 'mlpatterns.CellComposite'))
                    c = [c varargin{v}.cell_];
                    g = addnode(g, length(varargin{v}));
                else
                    c = [c varargin{v}];
                    g = addnode(g, length(varargin{v}));
                end
            end
            obj = mlpatterns.GraphComposite(c, g);
        end
        function tf   = isempty(this)
            tf = isempty(this.graph_) || isempty(this.cell_);
        end
        function n    = length(this)
            n = length(this.cell_);
            assert(n == numnodes(this.graph_));
        end
        function this = subsasgn(this, S, varargin)
            %% SUBSASGN
            %  See also:  web(fullfile(docroot, 'matlab/matlab_oop/class-with-modified-indexing.html'))
            %             web(fullfile(docroot, 'matlab/ref/numargumentsfromsubscript.html'))
            
            switch (S(1).type)
                case '.'
                    this = builtin('subsasgn', this, S, varargin{:});
                case '{}' 
                    this = builtin('subsasgn', this.cell_, S, varargin{:});
                    this.graph_ = addnode(this.graph_, ...
                                          length(varargin{:}) - dipsum(ismember(this.cell_, varargin{:})));
                case '()'
                    this = builtin('subsasgn', this.cell_, S, varargin{:});
                    this.graph_ = addnode(this.graph_, ...
                                          length(varargin{:}) - dipsum(ismember(this.cell_, varargin{:})));
            end
        end
        function obj  = vertcat(this, varargin)
            c = this.cell_;
            g = this.graph_;
            for v = 1:length(varargin)
                if (isa(varargin{v}, 'mlpatterns.GraphComposite'))
                    c = [c; varargin{v}.cell_];
                    g = addnode(g, varargin{v}.graph_.Nodes);
                elseif (isa(varargin{v}, 'mlpatterns.CellComposite'))
                    c = [c; varargin{v}.cell_];
                    g = addnode(g, length(varargin{v}));
                else
                    c = [c; varargin{v}];
                    g = addnode(g, length(varargin{v}));
                end
            end
            obj = mlpatterns.GraphComposite(c, g);
        end
        
        %% Access and Modify Nodes and Edges
        
        function this  = addnode(this, varargin)
            this = horzcat(this, varargin{:});
        end
        function this  = addedge(this, varargin)
            this.graph_ = addedge(this.graph_, varargin{:});
        end
        function this  = rmnode(this, varargin)
            for v = 1:length(varargin)
                assert(isnumeric(varargin{v}));
                this.cell_{varargin{v}} = [];
                this.graph_ = rmnode(this.graph_, varargin{v});
            end
        end
        function this  = rmedge(this, varargin)
            this.graph_ = rmedge(this.graph_, varargin{:});
        end
        function id    = findnode(this, varargin)
            id = findnode(this.graph_, varargin{:});
        end
        function [s,t] = findedge(this, varargin)
            [s,t] = findedge(this.graph_, varargin{:});
        end
        function n     = numnodes(this)
            n = numnode(this.graph_);
            assert(n == length(this.cell_));
        end
        function n     = numedges(this)
            n = numedge(this.graph_);
        end        
        function [this,idx] = reordernodes(this, varargin)
            [this.graph_,idx] = reordernodes(this.graph_, varargin{:});
        end
        function s     = subgraph(this, varargin)
            s = subgraph(this.graph_, varargin{:});
        end
        
        %% Search and Structure
        
        function v = bfsearch(this, varargin)
            v = bfsearch(this.graph_, varargin{:});
        end
        function v = dfsearch(this, varargin)
            v = dfsearch(this.graph_, varargin{:});
        end
        function bins = conncomp(this, varargin)
            bins = conncomp(this.graph_, varargin{:});
        end
        function mf = maxflow(this, varargin)
            mf = maxflow(this.graph_, varargin{:});
        end
        function T = minspantree(this, varargin)
            T = minspantree(this.graph_, varargin{:});
        end
        
        %% Shortest Path
        
        function p = shortestpath(this, varargin)
            p = shortestpath(this.graph_, varargin{:});
        end
        function t = shortestpathtree(this, varargin)
            t = shortestpathtree(this.graph_, varargin{:});
        end
        function d = distances(this, varargin)
            d = distances(this.graph_, varargin{:});
        end
        
        %% Matrix Representation
        
        function a = adjacency(this, varargin)
            a = adjacency(this.graph_, varargin{:});
        end
        function i = incidence(this, varargin)
            i = incidence(this.graph_, varargin{:});
        end
        function l = laplacian(this, varargin)
            l = laplacian(this.graph_, varargin{:});
        end        
        
        %% Node Information
        
        function d = degree(this, varargin)
            d = degree(this.graph_, varargin{:});
        end
        function n = neighbors(this, varargin)
            n = neighbors(this.graph_, varargin{:});
        end
        function n = nearest(this, varargin)
            n = nearest(this.graph_, varargin{:});
        end
        
        %% Visualization
        
        function this = plot(this, varargin)
            plot(this.graph_, varargin{:});
        end
        
    end
    
    %% PROTECTED
    
    properties %(Access = 'protected')
        graph_
    end
    
    methods (Access = 'protected')
        function g = graph__(this)
            len = length(this.cell_);
            A = ones(len) - diag(ones(1,len));
            
            names = cell(size(this.cell_));
            for n = 1:length(names)
                try
                    names{n} = char(this.cell_{n});
                catch ME
                    names{n} = 'unknown';
                    handwarning(ME);                    
                end
            end
            
            g = graph(A, names);
        end
    end
    
	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

