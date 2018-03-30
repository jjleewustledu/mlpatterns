classdef SimpleMA < StrategyType
%SimpleMA Summary of this class goes here
%   Detailed explanation goes here
% This class has a contract with the StrategyType Interface. It must
% deliver a RunStrategy method that takes in a TimeSeries class

   properties
   end

   methods
       function RunStrategy(obj, ts)
          fprintf('SimpleMA:RunStrategy %s\n', ts.Name);
          % This would contain all the calcs for this strategy
          % The data to work on has been passed in via the ts class
       end
   end
end 

%EOF