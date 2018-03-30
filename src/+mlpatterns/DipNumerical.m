classdef (Abstract) DipNumerical 
	%% DIPNUMERICAL  

	%  $Revision$
 	%  was created 10-Jan-2016 13:16:45
 	%  by jjlee,
 	%  last modified $LastChangedDate$
 	%  and checked into repository /Users/jjlee/Local/src/mlcvl/mlpatterns/src/+mlpatterns.
 	%% It was developed on Matlab 9.0.0.307022 (R2016a) Prerelease for MACI64.
 	
	methods (Abstract)
        dipiqr(this)
        dipisfinite(this)
        dipisinf(this)
        dipisnan(this)
        dipisreal(this)
        diplogprod(this)
        dipmad(this)
        dipmax(this)
        dipmean(this)
        dipmedian(this)
        dipmin(this)
        dipmode(this)
        dipprctile(this)
        dipprod(this)
        dipquantile(this)
        dipstd(this)
        dipsum(this)
        diptrimmean(this)
    end 

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy
 end

