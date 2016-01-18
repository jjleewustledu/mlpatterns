classdef CompositeIterator < mlpatterns.Iterator
   %% COMPOSITEITERATOR. Realisation of Iterator OOP Design Pattern.
   %  Refer to the description in the abstract superclass Iterator for
   %  full detail.  This is implemented as an external/active iterator.
   %   
   %  Adapted by John J. Lee
   %  Washington University, Saint Louis, MO, USA.
   %  Written by Bobby Nedelkovski
   %  MathWorks Australia
   %  Copyright 2009-2010, The MathWorks, Inc.
   
   properties(Access=private)
      loc;  % Location of traversal
   end
   
   methods
      function newObj = CompositeIterator(composite)
         % Check correct number of input args.
         assert(isa(composite, 'mlpatterns.Composite'));
         % Store reference to list and position iterator at start.
         newObj.collection = composite;
         newObj.loc        = 1;
      end
      function elts = next(this)
         elts = cell(size(this));
         % Query all lists for next element.
         hasNext = this.hasNext();
         
         % Use linear index to retrieve next element from each
         % Composite.
         for i = 1:numel(this)
            if hasNext(i)
               elts{i} = this(i).collection.get(this(i).loc);
               this(i).loc = this(i).loc + 1;
            end
         end

         % Return single element if only single element extracted.
         if numel(elts) == 1
            elts = elts{:};
         end
      end
      function next = hasNext(this)
         next = zeros(size(this));
         % Use linear index to populate next array.
         for i = 1:numel(this)
            next(i) = this(i).loc <= this(i).collection.length();
         end
         next = logical(next);
      end
      function reset(this)
         % Position iterator at start for each CellArrayList.
         for i = 1:numel(this) %#ok<FORFLG>
            this(i).loc = 1; 
         end
      end
   end
end
