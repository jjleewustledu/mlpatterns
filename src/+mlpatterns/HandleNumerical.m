classdef (Abstract) HandleNumerical < handle
	%% NUMERICAL extends numeric functionality to other structural classes
	
	%  $Revision$
 	%  was created 10-Jan-2016 13:16:45
 	%  by jjlee,
 	%  last modified $LastChangedDate$
 	%  and checked into repository /Users/jjlee/Local/src/mlcvl/mlpatterns/src/+mlpatterns.
 	%% It was developed on Matlab 9.0.0.307022 (R2016a) Prerelease for MACI64.
    
	methods (Abstract)
        abs(this)
        atan2(this, b)
        bsxfun(this, pfun, b)
        rdivide(this, b)
        ldivide(this, b)
        hypot(this, b)
        max(this, b)
        min(this, b)
        minus(this, b)
        mod(this, b)
        plus(this, b)
        power(this, b)
        rem(this, b) % remainder after division
        times(this, b)
        ctranspose(this)
        transpose(this)
        usxfun(this, pfun)
        
        eq(this, b)
        ne(this, b)
        lt(this, b)
        le(this, b)
        gt(this, b)
        ge(this, b)
        and(this, b)
        or(this, b)
        xor(this, b)
        not(this)
        
        char(this)
        double(this)
        find(this)
        ones(this)
        rank(this)
        scrubNanInf(this)
        single(this)
        size(this)
        zeros(this)
    end 

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

