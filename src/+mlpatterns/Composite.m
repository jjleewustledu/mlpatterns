classdef Composite
	%% COMPOSITE 
    
	%  $Revision$
 	%  was created 14-Jan-2016 17:34:02
 	%  by jjlee,
 	%  last modified $LastChangedDate$
 	%  and checked into repository /Users/jjlee/Local/src/mlcvl/mlpatterns/src/+mlpatterns.
 	%% It was developed on Matlab 9.0.0.307022 (R2016a) Prerelease for MACI64.
	    
    methods (Abstract)
        disp(this)
        horzcat(this, varargin)
        isempty(this)
        length(this)
        subsasgn(this, S, RHS)
        subsref(this, S)
        vertcat(this, varargin)
        
    end
    
	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

