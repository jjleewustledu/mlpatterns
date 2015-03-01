classdef CommandClient  
	%% COMMANDCLIENT creates aConcreteCommand and sets aCommandReceiver; e.g., application

	%  $Revision: 2630 $ 
 	%  was created $Date: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  by $Author: jjlee $,  
 	%  last modified $LastChangedDate: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  and checked into repository $URL: file:///Users/jjlee/Library/SVNRepository_2012sep1/mpackages/mlpatterns/src/+mlpatterns/trunk/CommandClient.m $,  
 	%  developed on Matlab 8.1.0.604 (R2013a) 
 	%  $Id: CommandClient.m 2630 2013-09-16 06:19:23Z jjlee $ 
 	 

	properties
 		 receiver
         concreteCommand
         invoker
    end 
    
    methods
        function this = storeCommand(this, aCommand)
            this.invoker.execute;
        end
        function this = CommandClient(aReceiver)
            this.concreteCommand = ConcreteCommand(aReceiver);
            this.storeCommand(this.concreteCommand);
        end
    end

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

