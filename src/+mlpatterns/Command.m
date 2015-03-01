classdef (Abstract) Command  
	%% COMMAND defines the interface for operations.   Encapsulates requests as objects, parameterizing
    %  clients with varying requests.  Supports queues, logs, undo operations.
    %  Motivation:   tookit has menus, but no knowledge of operations or receiver of requests.  
    %  Request made into objects:  storable, sharable.   Menus may be implemented with commands.  
    %  Menuitems are unaware of concrete commands.   Command decouples object requests from objects that 
    %  execute requests.   Commands may be replaced dynamically.
    %  Applicability:  
    %  - to parameterize objects by actions; commands are objects for callbacks
    %  - specify, queue, execute commands asynchronously
    %  - to undo
    %  - do persistent logging
    %  - structure high-level operations using primitive operations; encapsulate changes to data
    %  Consequences:
    %  1.  Decouples invoker from performing operation
    %  2.  Commands are 1st-class objects
    %  3.  Composite commands supported, instance of composite pattern
    %  4.  Easy to add new commands
    %  Implementation:
    %  1.  Commands must at least bind receiver and operations; but may implement operations 
    %      so as to dynamically find receivers
    %  2.  Undo/redo.  May use Memento or Prototype.
    %  3.  Avoid error accumulation in undo/redo.

	%  $Revision: 2630 $ 
 	%  was created $Date: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  by $Author: jjlee $,  
 	%  last modified $LastChangedDate: 2013-09-16 01:19:23 -0500 (Mon, 16 Sep 2013) $ 
 	%  and checked into repository $URL: file:///Users/jjlee/Library/SVNRepository_2012sep1/mpackages/mlpatterns/src/+mlpatterns/trunk/Command.m $,  
 	%  developed on Matlab 8.1.0.604 (R2013a) 
 	%  $Id: Command.m 2630 2013-09-16 06:19:23Z jjlee $ 
 	 
	methods 
        execute(this)
        unexecute(this)
 	end 

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy 
end

