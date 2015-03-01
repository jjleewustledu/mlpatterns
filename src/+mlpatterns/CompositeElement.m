classdef CompositeElement  
	%% COMPOSITEELEMENT implements accept for visitors; calls visitor operation that fits the concrete interface;
    %  visitor may access state of the concrete element.

	%  $Revision: 2630 $ 
 	%  was created $Date: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  by $Author: jjlee $,  
 	%  last modified $LastChangedDate: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  and checked into repository $URL: file:///Users/jjlee/Library/SVNRepository_2012sep1/mpackages/mlpatterns/src/+mlpatterns/trunk/CompositeElement.m $,  
 	%  developed on Matlab 8.1.0.604 (R2013a) 
 	%  $Id: CompositeElement.m 2630 2013-09-16 06:19:23Z jjlee $ 
 	 
	methods 
 		function visitor = accept(this, visitor) 
            iter = this.listOfElements_.createIterator;
            while (iter.hasNext)
                iter.next.accept(visitor);
            end
            visitor = visitor.visitCompositeElement(this);
 		end 
 		function this = anOperation(this)
        end
    end 
    
    methods (Access = 'protected')
        function this = CompositeElement()
        end
    end
    
    properties (Access = 'private')
        listOfElements_
    end

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

