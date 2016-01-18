classdef GraphComposite < mlpatterns.Composite
	%% GRAPHCOMPOSITE implements a composite design pattern using graph.
    
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
    
    methods %% GET/SET
        function g = get.Edges(this)
            g = this.graph_.Edges;
        end
        function g = get.Nodes(this)
            g = this.graph_.Nodes;
        end
        function this = set.Edges(this, n)
            this.graph_.Edges = n;
        end
        function this = set.Nodes(this, n)
            this.graph_.Nodes = n;
        end
    end
    
    methods
        function this = GraphComposite(varargin)
            if (nargin == 1 && isa(varargin{1}, 'mlpatterns.CellComposite'))
                this.graph_ = varargin{1}.graph_;
                return
            end
            
            ip = inputParser;
            addOptional(ip, 'graph', this.graph, @(x) isa(x, 'graph'));
            parse(ip, varargin{:});            
            this.graph_ = ip.Results.graph;
        end
        
        function this = add(this, a)
            this = this.addnode(a);
        end
        function c    = clone(this)
            c = mlpatterns.GraphComposite(this);
        end
        function iter = createIterator(this)
            iter = mlpatterns.CompositeIterator(this);
        end
        function        disp(this)
            disp(this.graph_);
        end  
        function idx  = find(this, varargin)
            idx = this.findnode(varargin{:});
        end
        function obj  = get(this, varargin)
            obj = this.subgraph(varargin{:});
        end
        function tf   = isempty(this)
            tf = isempty(this.graph_);
        end
        function n    = length(this)
            n = this.numnodes;
        end
        function this = rm(this, varargin)
            this = this.rmnode(varargin{:});
        end
        function s    = size(this)
            s = this.numnodes;
        end
        
        %% Access and Modify Nodes and Edges
        
        function this  = addnode(this, varargin)
            this.graph_ = addnode(this.graph_, varargin{:});
        end
        function this  = addedge(this, varargin)
            this.graph_ = addedge(this.graph_, varargin{:});
        end
        function this  = rmnode(this, varargin)
            this.graph_ = rmnode(this.graph_, varargin{:});
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
    
	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

