classdef (Abstract) AbstractSingleton < handle
   %% SINGLETON 
   %
   %  Intent:  ensure that a class has only one instance and provide a
   %  global point of access to it [1].
   %
   %  Motivation:  it's important for some classes to have exactly one
   %  instance.  For example, it can be desirable to have only a
   %  single instance of a GUI.  With a MATLAB GUIDE-built GUI, the driver
   %  or main function provides a global point of access which is
   %  executed to
   %
   %      -- initially instantiate the GUI;
   %      -- subsequently bring the existing GUI into focus without 
   %         new instantiations.
   %
   %  Implementation:  MATLAB OOP doesn't implement static properties.  
   %  Properties become available only after a class constructor is invoked.
   %  For a singleton, it 
   %  is therefor undesirable to use the constructor as a global point of
   %  access as it creates a new instance for any checks of whether an
   %  instance already exists.  The solution is to use a persistent
   %  variable within a unique static method, instance, which calls the
   %  constructor and creates the unique 'singleton' instance as required.  
   %  The persistent variable may be queried for whether the singleton object 
   %  exists.  Subclasses must satisfy the conditions:
   %
   %      1. the constructor must be hidden from the user;
   %      2. the concrete implementation of instance must store the unique
   %         subclass instance in a persistent variable.
   % 
   %  Adapted from classdef Singleton by:
   %  Bobby Nedelkovski of
   %  The MathWorks Australia Pty, Ltd.
   %  Copyright 2009, The MathWorks, Inc.
   %
   %  [1] Gamma, E., Helm, R., Johnson, R. and Vlissides, J.
   %      Design Patterns:  Elements of Reusable Object-Oriented Software.  pp. 127-134;
   %      Boston: Addison-Wesley, 1995.

   methods (Abstract, Static)
      % If the persistent instance doesn't exist, create it; otherwise, return the
      % persistent instance.  Concrete classes must override the constructor call.
      % @return this := reference to the persistent instance of the class
      this = instance()
   end
   
   methods
      function singletonData = getSingletonData(this)
          % @param this := reference to the singleton instance
          % @return singletonData := internal data stored for the singleton
         singletonData = this.singletonData;
      end
      function setSingletonData(this, singletonData)          
          % @param this := reference to the singleton instance
          % @param singletonData := new data to set internal data store
         this.singletonData = singletonData;
      end      
   end
   
   properties (Access = private)
      singletonData;
   end
   
end
