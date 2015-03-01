classdef (Abstract) State  
	%% STATE defines interface for behaviorss of any particular state within the state-context
    %  Intent:  object changes behavior with changing internal state. Class appears to change.
    %  Applicability:  
    %  - behavior depends on state and behavior must change at run-time
    %  - operations have large conditional statements taht depend on object state
    %  Consequences:
    %  1.  localizes state-specific behavior
    %  2.  state transitions become explicit
    %  Implementation:
    %  1.  triggering state transitions:   fixed criteria -> implement in context; more flexible for 
    %      concrete states to implement transitions -> concrete states must set context explicitly
    %  2.  tables as alternatives:  tables emphasize transitions
    %  3.  creation/destrution:  (a) create states as needed, (b) create all possible states at the start

	%  $Revision: 2630 $ 
 	%  was created $Date: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  by $Author: jjlee $,  
 	%  last modified $LastChangedDate: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  and checked into repository $URL: file:///Users/jjlee/Library/SVNRepository_2012sep1/mpackages/mlpatterns/src/+mlpatterns/trunk/State.m $,  
 	%  developed on Matlab 8.1.0.604 (R2013a) 
 	%  $Id: State.m 2630 2013-09-16 06:19:23Z jjlee $ 
 	 

	properties 
 		 handle
    end

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

