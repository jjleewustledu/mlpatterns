classdef CommandInvoker  
	%% COMMANDINVOKER asks command for a request, e.g., menu item.
    %  Stores concreteCommand

	%  $Revision: 2630 $ 
 	%  was created $Date: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  by $Author: jjlee $,  
 	%  last modified $LastChangedDate: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  and checked into repository $URL: file:///Users/jjlee/Library/SVNRepository_2012sep1/mpackages/mlpatterns/src/+mlpatterns/trunk/CommandInvoker.m $,  
 	%  developed on Matlab 8.1.0.604 (R2013a) 
 	%  $Id: CommandInvoker.m 2630 2013-09-16 06:19:23Z jjlee $ 
 	 

	properties 
 		 command
    end 
    
    methods
        function execute(this)
            this.command.execute;
        end
    end
    
    properties (Access = 'private')
        statesForUndo
    end
	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

