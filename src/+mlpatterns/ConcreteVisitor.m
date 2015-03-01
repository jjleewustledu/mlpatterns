classdef ConcreteVisitor  
	%% CONCRETEVISITOR implements operations on concrete elements; provides algorithmic context;
    %  stores local state as object structure is traversed

	%  $Revision: 2630 $ 
 	%  was created $Date: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  by $Author: jjlee $,  
 	%  last modified $LastChangedDate: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  and checked into repository $URL: file:///Users/jjlee/Library/SVNRepository_2012sep1/mpackages/mlpatterns/src/+mlpatterns/trunk/ConcreteVisitor.m $,  
 	%  developed on Matlab 8.1.0.604 (R2013a) 
 	%  $Id: ConcreteVisitor.m 2630 2013-09-16 06:19:23Z jjlee $ 

    properties
        visitHistory
    end
    
	methods 
        function this = visitConcreteElementA(this, aConcreteElementA)
            this.visitHistory = foo(this, aConcreteElementA);
        end
        function this = visitConcreteElementB(this, aConcreteElementB)
            this.visitHistory = goo(this, aConcreteElementB);
        end
 	end 

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

