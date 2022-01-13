classdef (Abstract, HandleCompatible) Numerical < handle
	%% NUMERICAL extends numeric functionality to other structural classes
	
	%  $Revision$
 	%  was created 10-Jan-2016 13:16:45
 	%  by jjlee,
 	%  last modified $LastChangedDate$
 	%  and checked into repository /Users/jjlee/Local/src/mlcvl/mlpatterns/src/+mlpatterns.
 	%% It was developed on Matlab 9.0.0.307022 (R2016a) Prerelease for MACI64.
    
	methods (Abstract)
        abs(this)
        acos(this, b)
        acosh(this, b)
        asin(this, b)
        atan(this, b)
        atan2(this, b)
        atanh(this)
        bsxfun(this, pfun, b)
        cos(this)
        cosh(this)
        exp(this)
        expm(this)
        flip(this, adim)
        rdivide(this, b)
        ldivide(this, b)
        hypot(this, b)
        log(this)
        log10(this)
        logm(this)
        max(this, b)
        min(this, b)
        minus(this, b)
        mod(this, b)
        mpower(this, b)
        mldivide(this, b)
        mrdivide(this, b)
        mtimes(this, b)
        plus(this, b)
        power(this, b)
        rem(this, b) % remainder after division
        sin(this)
        sinh(this)
        sqrt(this)
        sqrtm(this)
        sum(this, varargin)
        tan(this)
        tanh(this)
        times(this, b)
        ctranspose(this)
        transpose(this)
        uminus(this, varargin)
        usxfun(this, pfun)

        and(this, b)
        isequal(this, b)
        isequaln(this, b)
        isfinite(this)
        isinf(this)
        isnan(this)
        isreal(this)
        not(this)
        or(this, b)
        xor(this, b)
        
        double(this)
        false(this, varargin)
        find(this, varargin)
        nan(this, varargin)
        ones(this, varargin)
        reshape(this, varargin)
        single(this)
        true(this, varargin)
        zeros(this)
    end 

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

