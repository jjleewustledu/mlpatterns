classdef Memento 
	%% MEMENTO 
    %  ? stores internal state of the Originator object. The memento may store as much or  
    %    as little of the originator?s internal state as necessary at its originator?s discretion. 
    %  ? protects against access by objects other than the originator. Mementos have effectively two interfaces. 
    %    Caretaker sees a narrow interface to the Memento?it can only pass the memento to other objects. 
    %    Originator, in contrast, sees a wide interface, one that lets it access all the data necessary to  
    %    restore itselfto its previous state. Ideally, only the originator that produced the memento 
    %    would be permitted to access the memento?s internal state.
    
	%  $Revision: 2581 $
 	%  was created $Date: 2013-08-29 02:58:30 -0500 (Thu, 29 Aug 2013) $
 	%  by $Author: jjlee $, 
 	%  last modified $LastChangedDate: 2013-08-29 02:58:30 -0500 (Thu, 29 Aug 2013) $
 	%  and checked into repository $URL: file:///Users/jjlee/Library/SVNRepository_2012sep1/mpackages/mlpatterns/src/+mlpatterns/trunk/Memento.m $, 
 	%  developed on Matlab 8.1.0.604 (R2013a)
 	%  $Id: Memento.m 2581 2013-08-29 07:58:30Z jjlee $

    properties (Dependent)
        state
    end
    
	methods 
        function s = get.state(this)
           s = this.state_; 
        end
        function this = set.state(this, s)
            this.state_ = s;
        end
    end 

    properties (Access = 'private')
        state_
    end
	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

