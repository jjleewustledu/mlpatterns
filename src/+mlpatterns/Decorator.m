classdef Decorator < mlpatterns.DecoratorComponent
	%% DECORATOR maintains a reference to the component object.
    %  Applicability:
    %  - Adds responsibilities to objects dynamically & transparenty (w/o inter-object side-effects)
    %  - Has responsibilities that may be withdrawn
    %  - Is helpful when extension by subclassing is impractical
    %  Consequences:
    %  1.  More flexible than static inheritance.  Attach/detach at run-time.  Add double properties.
    %  2.  Avoids feature-heavy classes high in hierarchy by adding functionality incrementally.
    %  3.  Decorator & component aren't identical.  Decorator is a transparent enclosure.
    %  4.  Lots of little objects that may be difficult to learn/debug.
    %  Implementation:
    %  1.  Interfaces of decorators and component must conform.
    %  2.  Omit abstract Decorator when only one responsiblity is added:  merge decorator and concrete-decorator.
    %  3.  Keep component classes lightweight.  Data belong in subclass decorators, not the component.  
    %      Otherwise, decorators will be too heavyweight to use in quantity.
    %  4.  Change the skin, not the guts.  Components are unaware of decorators; decorators are transparent.
    %      Use strategy to change the guts, when component must be heavyweight; component must reference strategies.   
    %      

	%  $Revision: 2630 $ 
 	%  was created $Date: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  by $Author: jjlee $,  
 	%  last modified $LastChangedDate: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  and checked into repository $URL: file:///Users/jjlee/Library/SVNRepository_2012sep1/mpackages/mlpatterns/src/+mlpatterns/trunk/Decorator.m $,  
 	%  developed on Matlab 8.1.0.604 (R2013a) 
 	%  $Id: Decorator.m 2630 2013-09-16 06:19:23Z jjlee $ 
 	 

	properties (Abstract)
 		 component
 	end 

	methods
 		function doSomething(this)
            this.component.doSomething;
 		end 
 	end 

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

