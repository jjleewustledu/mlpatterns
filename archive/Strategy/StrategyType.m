classdef StrategyType
% Interface / Abstract Class 
% This class must be inherited. The child class must deliver the
% RunStrategy method that accept the TimeSeries class

   properties
   end

   methods (Abstract)
       RunStrategy(ts)
   end
   
   methods (Static)
       function rslt = newType(value)
          switch lower(value)
              case 'simplema'
                  rslt = SimpleMA;
              case 'donchian'
                  rslt = Donchian;
                % If you want to add more strategies, simply put them in
                % here and then create another class file that inherits
                % this class and implements the RunStrategy method
              otherwise
                  error('Type must be either SimpleMA or Donchian');
          end
       end
   end
end 

%EOF