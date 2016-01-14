classdef Composite <  mlpatterns.ValueList
	%% COMPOSITE characteristics arise from mlpatterns.ValueList, which resembles mlpatterns.List but is a value class.
    %  Composite has an mlpatterns.CellArrayList.
    
	%  $Revision: 2618 $
 	%  was created $Date: 2013-09-08 23:15:55 -0500 (Sun, 08 Sep 2013) $
 	%  by $Author: jjlee $, 
 	%  last modified $LastChangedDate: 2013-09-08 23:15:55 -0500 (Sun, 08 Sep 2013) $
 	%  developed on Matlab 8.1.0.604 (R2013a)
 	%  $Id: Composite.m 2618 2013-09-09 04:15:55Z jjlee $
	    
    methods
        function this = Composite(varargin)
            if (nargin == 1 && isa(varargin{1}, 'mlpatterns.Composite'))
                this.internalList_ = mlpatterns.CellArrayList(varargin{1}.internalList_);
                return
            end
            this.internalList_ = mlpatterns.CellArrayList;
        end
        function cll  = cell(this)
            %% CELL 
            %  @return cll is the composite formatted as a cell array.
            
            len = length(this.internalList_);
            cll = cell(1, len);
            for c = 1:len
                cll{c} = this.internalList_.get(c);
            end
        end        
        function c    = char(this)
            c = this.internalList_.char;
        end
        function c    = clone(this)
            c = mlpatterns.Composite(this);
        end
        function this = compfun(this, fun, varargin)
            %% COMPFUN Apply a function to each element of a composite (Composite).
            %  A = compfun(C, FUN[, ARGS]) applies the function specified by FUN to the
            %  contents of each element of composite C, and returns the results in
            %  composite A.  A is the same size as C, and the (I,J,...)th element of A
            %  is equal to FUN(C{I,J,...}[, ARGS]). FUN is a function handle to a method of C
            %  that may also take arguments ARGS.  The order in which compfun computes 
            %  elements of A is not specified and should not be relied on.
            
            for c = 1:this.internalList_.length
                tmp = fun(this.internalList_.get(c), varargin{:});
                this.internalList_.remove(c);
                this.internalList_.add(tmp, c);
            end
        end
        function iter = createIterator(this)
            iter = this.internalList_.createIterator;
        end
        function        disp(this)
            this.internalList_.disp;
        end        

        %% Implementations of mlpatterns.ValueList
        
        function nElts       = length(this)
            if (~isempty(this.internalList_))
                nElts = this.internalList_.length;
                return; 
            end
            nElts = 0;
        end         
        function tf          = isempty(this)
            if (isempty(this.internalList_))
                tf = true; 
                return; 
            end
            tf = this.internalList_.isempty;
        end
        function this        = add(this, varargin)
            va = varargin;
            import mlpatterns.*;
            if (isa(va{1}, 'mlpatterns.Composite'))
                va{1} = CellArrayList(va{1}.internalList_);
                this.internalList_.add(va{:});
                return
            end
            if (isa(va{1}, 'mlpatterns.CellArrayList'))
                va{1} = CellArrayList(va{1});
                this.internalList_.add(va{:});
                return
            end
            this.internalList_.add(va{:});
        end          
        function elts        = get(this, varargin)
            if (~isempty(this.internalList_))
                elts = this.internalList_.get(varargin{:});
                return; 
            end
            elts = [];
        end
        function [this,elts] = remove(this, locs)
            if (~isempty(this.internalList_))
                elts = this.internalList_.remove(locs);
                return; 
            end
            elts = [];
        end  
        function count       = countOf(this, elt)
            if (~isempty(this.internalList_))
                count = this.internalList_.countOf(elt);
                return
            end
            count = 0;
        end
        function locs        = locationsOf(this, elt)
            if (~isempty(this.internalList_));
                locs = this.internalList_.locationsOf(elt);
                return
            end
            locs = [];
        end        
    end
    
    %% PROTECTED
    
    properties (Access = 'protected')
        internalList_
    end
    
	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

