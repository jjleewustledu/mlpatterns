classdef ConcreteCommand < mlpatterns.Command
	%% CONCRETECOMMAND defines binding of a Receiver object & an action.  Stores receiver and 
    %  invoke operations on receiver.

	%  $Revision: 2630 $ 
 	%  was created $Date: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  by $Author: jjlee $,  
 	%  last modified $LastChangedDate: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  and checked into repository $URL: file:///Users/jjlee/Library/SVNRepository_2012sep1/mpackages/mlpatterns/src/+mlpatterns/trunk/ConcreteCommand.m $,  
 	%  developed on Matlab 8.1.0.604 (R2013a) 
 	%  $Id: ConcreteCommand.m 2630 2013-09-16 06:19:23Z jjlee $ 
 	 

	properties 
 		 state
 	end 

	methods 
        function execute(this)
            this.receiver_.action;
        end
        function unexecute(this)
            this.receiver_.unaction
        end 
        function this = ConcreteCommand(receiver)
            this.receiver_ = receiver;
        end
    end 
    
    properties (Access = 'private')
        receiver_
    end

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

