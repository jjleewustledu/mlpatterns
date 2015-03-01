classdef MementoCaretaker
	%% MEMENTOCARETAKER (undo mechanism)
    %  - is reponsible for the memento's safekeeping
    %  - never operates on or examines the contents of a memento
    
	%  $Revision: 2581 $
 	%  was created $Date: 2013-08-29 02:58:30 -0500 (Thu, 29 Aug 2013) $
 	%  by $Author: jjlee $, 
 	%  last modified $LastChangedDate: 2013-08-29 02:58:30 -0500 (Thu, 29 Aug 2013) $
 	%  and checked into repository $URL: file:///Users/jjlee/Library/SVNRepository_2012sep1/mpackages/mlpatterns/src/+mlpatterns/trunk/MementoCaretaker.m $, 
 	%  developed on Matlab 8.1.0.604 (R2013a)
 	%  $Id: MementoCaretaker.m 2581 2013-08-29 07:58:30Z jjlee $

    properties
        anOriginator
    end
    
    methods
        function m = requestMemento(this)
            m = this.anOriginator.createMemento;
        end
        function this = passBackMemento(this, m)
            this.anOriginator.memento = m;
        end
        
        function this = MementoCaretaker(orig)
            assert(isa(orig, 'mlpatterns.MementoOriginator'));
            this.anOriginator = orig;
        end
    end
    
	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

