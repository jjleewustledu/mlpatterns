classdef CompositePrototype < mlpatterns.Composite 
	%% COMPOSITEPROTOTYPE  

	%  $Revision$
 	%  was created 14-Jan-2016 01:03:49
 	%  by jjlee,
 	%  last modified $LastChangedDate$
 	%  and checked into repository /Users/jjlee/Local/src/mlcvl/mlpatterns/src/+mlpatterns.
 	%% It was developed on Matlab 9.0.0.307022 (R2016a) Prerelease for MACI64.
 	
	methods
 		function this = CompositePrototype(varargin)
            this = this@mlpatterns.Composite(varargin{:}); 			
        end
        function c    = clone(this)
            c = mlpatterns.CompositePrototype(this);
        end        
        function c    = cached(this, idx)
            %% CACHED aliases get, assuming loc == 1 without arguments.
            %  @param [idx] is the location in the composite.
            %  @return c is the element from the composite.
            
            if (~exist('idx','var'))
                idx = 1;
            end
            c = this.internalList_.get(idx);
        end        
        function this = compfun(this, fun, varargin)
            %% COMPFUN Apply a function to each element of a composite (Composite).
            %  A = compfun(C, FUN[, ARGS]) applies the function specified by FUN to the
            %  contents of each element of composite C, and returns the results in
            %  composite A.  A is the same size as C, and the (I,J,...)th element of A
            %  is equal to FUN(C{I,J,...}[, ARGS]). FUN is a function handle to a method of C
            %  that may also take arguments ARGS.  The order in which compfun computes 
            %  elements of A is not specified and should not be relied on.
            
            for c = 1:this.graph_.length
                tmp = fun(this.graph_.get(c), varargin{:});
                this.graph_.remove(c);
                this.graph_.add(tmp, c);
            end
        end
        
        %% Operator overloading
        
        function cmp  = horzcat(this, varargin)
            %% HORZCAT overloads []
            %  Usage:  imaging_composite = [imaging_component imaging_component2 ...]
            
            if (isempty(this.internalList_))
                this.internalList_ = mlpatterns.CellArrayList; 
            end
            for v = 1:length(varargin)
                this.internalList_.add(varargin{v});
            end
            cmp = mlpatterns.CompositePrototype(this); % copy-ctor
        end  
        function cmp  = vertcat(this, varargin)
            cmp = this.horzcat(varargin{:});
        end        
        function this = subsasgn(this, S, rhs)
            %% SUBSASN overload subscript assignment for '.' and '{}' and '()' to mimic cell-arrays
            
            switch (S(1).type)
                case '.'
                    this = builtin('subsasgn', this, S, rhs);
                case '{}' 
                    if (length(S) < 2)
                        locs = S(1).subs{:};
                        this.internalList_.remove(locs);
                        this.internalList_.add(rhs, locs);
                    else
                        this = builtin('subsasgn', this, S(2:end), rhs);
                    end
                case '()'
                    if (length(S) < 2)
                        locs = S(1).subs{:};
                        this.internalList_.remove(locs);
                        assert(1 == rhs.internalList_.length, ...
                            'In an assignment A(:) = B, the number of elements in A and B must be the same.');
                        this.internalList_.add(rhs.internalList_.get(1), locs);
                    else
                        this = builtin('subsasgn', this, S(2:end), rhs);
                    end
            end
        end
        function obj  = subsref(this, S)
            %% SUBSREF overloads subscript referencing for '.' and '{}' and '()' to mimic cell-arrays; 
            %  Usage:   imaging_component = obj{n} % component obj, natural number n
            %                       field = obj.field_name
            %                         obj = obj(n) % retains only n-th list element
            
            switch (S(1).type)
                case '.'
                    if (length(S) < 2 && strcmp('save', S.subs))
                        builtin('subsref', this, S);
                        obj = [];
                    else
                        obj = builtin('subsref', this, S);
                    end
                case '{}'
                    if (length(S) < 2)
                        obj = this.internalList_.get(S(1).subs{:});
                    else
                        obj = builtin('subsref', this, S(2:end));
                    end
                case '()'
                    error('mlfourd:NotImplemented', 'subsref() not implemented for debugging');
            end
        end
		  
    end 
    
	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy
 end

