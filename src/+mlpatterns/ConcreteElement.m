classdef ConcreteElement < mlpatterns.VisitedElement
	%% CONCRETEELEMENT implements accept for visitors; calls visitor operation that fits the concrete interface;
    %  visitor may access state of the concrete element.

	%  $Revision: 2630 $ 
 	%  was created $Date: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  by $Author: jjlee $,  
 	%  last modified $LastChangedDate: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  and checked into repository $URL: file:///Users/jjlee/Library/SVNRepository_2012sep1/mpackages/mlpatterns/src/+mlpatterns/trunk/ConcreteElement.m $,  
 	%  developed on Matlab 8.1.0.604 (R2013a) 
 	%  $Id: ConcreteElement.m 2630 2013-09-16 06:19:23Z jjlee $ 
 	 
	methods 
 		function visitor = acceptVisit(this, visitor) 
            visitor = visitor.visitConcreteElement(this);
 		end 
 		function this = anOperation(this)
        end
    end 
    
    methods (Access = 'protected')
        function this = ConcreteElement()
        end
    end

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

