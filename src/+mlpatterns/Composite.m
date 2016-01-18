classdef Composite
	%% COMPOSITE 
    
	%  $Revision$
 	%  was created 14-Jan-2016 17:34:02
 	%  by jjlee,
 	%  last modified $LastChangedDate$
 	%  and checked into repository /Users/jjlee/Local/src/mlcvl/mlpatterns/src/+mlpatterns.
 	%% It was developed on Matlab 9.0.0.307022 (R2016a) Prerelease for MACI64.
	    
    methods (Abstract)
        this = add(this, obj)
        obj  = clone(this)
        iter = createIterator(this)
               disp(this)
        idx  = find(this, obj)
        obj  = get(this, idx)
        tf   = isempty(this)
        len  = length(this)
               rm(this, idx)
        s    = size(this)        
    end
    
	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

