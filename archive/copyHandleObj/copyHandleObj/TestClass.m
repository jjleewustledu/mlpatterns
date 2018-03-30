classdef TestClass < handle
   %TESTCLASS used to demonstrate the cloning of an object
   %   Since TestClass inherits reference behaviour from the 'handle' class
   %   you will only create a shallow copy of an instance of this class by
   %   specifying b = a; where 'a' is an instance of testClass. Effectively
   %   'a' and 'b' are references to the same object.
   %   This class contains a constructor and a method which both produce
   %   clones (deep copies) of an object of its kind.
   %
   %   Written by Sam Oliver & Bobby Nedelkovski
   %   The MathWorks Australia Pty Ltd
   %   Copyright 2009, The MathWorks, Inc.
   
   properties
      sam   = 1;
      bobby = 2;
   end
   
   methods
      function newObj = TestClass(oldObj)
         % Construct a new object based on a deep copy of an old object
         % of this class by copying properties over.
         if nargin == 1 && isa(oldObj,'TestClass')
            props = properties(oldObj);
            for i = 1:length(props)
               % Use Dynamic Expressions to copy the required property.
               % For more info on usage of Dynamic Expressions, refer to
               % the section "Creating Field Names Dynamically" in:
               % web([docroot '/techdoc/matlab_prog/br04bw6-38.html#br1v5a9-1'])
               newObj.(props{i}) = oldObj.(props{i});
            end
         end
         % If no arguments, just create a new object of this class if
         % called by the constructor.
      end
      
      function copyobj(thisObj,newObj)
         % Construct a new object based on a deep copy of the current
         % object of this class by copying properties over.
         props = properties(thisObj);
         for i = 1:length(props)
            % Use Dynamic Expressions to copy the required property.
            % For more info on usage of Dynamic Expressions, refer to
            % the section "Creating Field Names Dynamically" in:
            % web([docroot '/techdoc/matlab_prog/br04bw6-38.html#br1v5a9-1'])
            newObj.(props{i}) = thisObj.(props{i});
         end
      end
   end
end
