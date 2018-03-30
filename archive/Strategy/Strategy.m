classdef Strategy < handle
%STRATEGY Summary of this class goes here
%   Detailed explanation goes here

   properties
       m_Type = {};
   end

   methods
       function obj = Strategy(value)
            obj.SetStrategy(value);
       end
       
       function SetStrategy(obj, value)
            obj.m_Type = StrategyType.newType(value); 
       end
       
       function RunStrategy(obj, ts)
            obj.m_Type.RunStrategy(ts);
       end
   end
end 

%EOF
