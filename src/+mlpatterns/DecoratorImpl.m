classdef DecoratorImpl < mlpatterns.Decorator
	%% DECORATORIMPL subclasses abstract Decorator, adding responsibilities.
    %  Clients cannot distinguish decorated components & must not rely on decorations

	%  $Revision: 2630 $ 
 	%  was created $Date: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  by $Author: jjlee $,  
 	%  last modified $LastChangedDate: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  and checked into repository $URL: file:///Users/jjlee/Library/SVNRepository_2012sep1/mpackages/mlpatterns/src/+mlpatterns/trunk/DecoratorImpl.m $,  
 	%  developed on Matlab 8.1.0.604 (R2013a) 
 	%  $Id: DecoratorImpl.m 2630 2013-09-16 06:19:23Z jjlee $ 

    properties
        addedState
    end
    
	methods 
 		function doSomething(this) 
            doSomething@mlpatterns.Decorator(this);
            this.doSomethingElse;
            this.addedState = this.addedState + 1;
        end 
        function doSomethingElse(~)
        end
 	end 

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

