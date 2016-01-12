classdef (Abstract) Composite 
	%% COMPOSITE  

	%  $Revision$
 	%  was created 09-Jan-2016 22:49:18
 	%  by jjlee,
 	%  last modified $LastChangedDate$
 	%  and checked into repository /Users/jjlee/Local/src/mlcvl/mlpatterns/src/+mlpatterns.
 	%% It was developed on Matlab 9.0.0.307022 (R2016a) Prerelease for MACI64.
 	

	properties (Abstract)
        cachedNext
 	end

	methods (Abstract)
        compfun(this)
        hasNext(this)
        horzcat(this)
        next(this)
        reset(this)
        vertcat(this)
 	end 

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy
 end

