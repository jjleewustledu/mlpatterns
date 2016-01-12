classdef (Abstract) DipNumerical 
	%% DIPNUMERICAL  

	%  $Revision$
 	%  was created 10-Jan-2016 13:16:45
 	%  by jjlee,
 	%  last modified $LastChangedDate$
 	%  and checked into repository /Users/jjlee/Local/src/mlcvl/mlpatterns/src/+mlpatterns.
 	%% It was developed on Matlab 9.0.0.307022 (R2016a) Prerelease for MACI64.
 	
	methods (Abstract)
        dipmax(this)
        dipmedian(this)
        dipmean(this)
        dipmin(this)
        dipmode(this)
        dipprod(this)
        dipstd(this)
        dipsum(this)
    end 

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy
 end

