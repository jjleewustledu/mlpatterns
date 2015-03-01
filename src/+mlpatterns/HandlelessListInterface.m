classdef HandlelessListInterface
   %% HANDLELESSLISTINTERFACE 
   %
   %  Written by John J. Lee, Washington University School of Medicine, St Louis, MO, USA
   %  After Bobby Nedelkovski, Mathworks, Australia
   %
   %  2010-Jul-20: Methods modified to work with arrays of CellArrayList.
   
   methods (Abstract)
      numElts     = length(this)
      empty       = isempty(this)
      this        = add(this, varargin)
      elts        = get(this,locs)
      [this,elts] = remove(this,locs)
      count       = countOf(this,elt)
      locs        = locationsOf(this,elt)
      str         = char(this)
                    display(this)
      iter        = createIterator(this) 
   end
end
