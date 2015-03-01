classdef MementoOriginator 
	%% MEMENTOORIGINATOR 
    %  ? creates a memento containing a snapshot of its current internal state.
    %  ? uses the memento to restore its internal state.

	%  $Revision: 2581 $
 	%  was created $Date: 2013-08-29 02:58:30 -0500 (Thu, 29 Aug 2013) $
 	%  by $Author: jjlee $, 
 	%  last modified $LastChangedDate: 2013-08-29 02:58:30 -0500 (Thu, 29 Aug 2013) $
 	%  and checked into repository $URL: file:///Users/jjlee/Library/SVNRepository_2012sep1/mpackages/mlpatterns/src/+mlpatterns/trunk/MementoOriginator.m $, 
 	%  developed on Matlab 8.1.0.604 (R2013a)
 	%  $Id: MementoOriginator.m 2581 2013-08-29 07:58:30Z jjlee $

    properties (Dependent)
        memento
    end
    
	methods
        function this = set.memento(this, m)
            assert(isa(m, 'mlpatterns.Memento'));
            this.state_ = m.state;
        end
        function m = createMemento(this)
           m = mlpatterns.Memento(this.state_); 
        end
    end
    
    properties (Access = 'private')
        state_
    end

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

