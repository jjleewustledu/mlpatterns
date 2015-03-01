classdef (Abstract) Visitor  
	%% VISITOR represents an operation to be made on an object structure; define new operations w/o
    %  change classes of the object structure elements.   Defines two class hierarchies:  
    %  one for elements operated upon, another for visitors that define operations.  
    %  Add new operations by subclassing Visitor
    %  Applicability:
    %  - object structure has classes with differing interfaces, but common operations needed
    %  - operations are distinct, unrelated; similar operations need to be grouped within a visitor-class
    %  - classes for object structure rarely change, but many new operations arise
    %  Consequences:
    %  1.  Adding new operations is easy.  Operations work on components of complex objects.  
    %      New operation iff new visitor.
    %  2.  Visitor gathers related operations, separates unrelated ones.  Unrelated operations 
    %      are sequestered in visitor subclasses.   Algorithm-specific data is hidden in concrete visitor.
    %  3.  Adding new concrete elements is hard.  
    %  4.  Unlike iterator, visitor can visit objects without a common parent class.
    %  5.  Visitors accumulate state.  
    %  6.  Visitors break encapsulation of concrete elements' states
    %  Implementation:
    %  1.  Double-dispatch:  executed operation <- kind of request, type of visitor, type of element.
    %      Ergo, visitors request different operations for each class of element.
    %      Operation made on element using visitor as argument.
    %  2.  Responsibility for travsersing object structure may be in:  (1)  object structure, 
    %      (2) the visitor, (3) separate iterator.   Object structure's internal iterator is not double-dispatch:
    %      iterator will call operation on visitor with element-argument.

	%  $Revision: 2630 $ 
 	%  was created $Date: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  by $Author: jjlee $,  
 	%  last modified $LastChangedDate: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  and checked into repository $URL: file:///Users/jjlee/Library/SVNRepository_2012sep1/mpackages/mlpatterns/src/+mlpatterns/trunk/Visitor.m $,  
 	%  developed on Matlab 8.1.0.604 (R2013a) 
 	%  $Id: Visitor.m 2630 2013-09-16 06:19:23Z jjlee $ 
 	 
	methods 
 		 visitConcreteElementA(this, aConcreteElementA) % concreteElementA will send request to visitor;
                                                        % the visit will conform to concreteElementA's interface
         visitConcreteElementB(this, aConcreteElementB) % A & B are unrelated
 	end 

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

